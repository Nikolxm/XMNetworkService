//
//  XMNetworkServiceManager.m
//  Network
//
//  Created by Xuemin on 15/11/19.
//  Copyright © 2016年 XM. All rights reserved.
//

#import "XMNetworkServiceManager.h"
#import <AFNetworking/AFNetworking.h>
#import "XMNetworkServiceMehtodBaseAPI.h"
#import "XMNetworkSystemConfiguration.h"


@interface XMNetworkServiceManager ()
@property (nonatomic, strong) XMNetworkSystemConfiguration *systemConfig;
@end

@implementation XMNetworkServiceManager

+ (instancetype)sharedInstance {
    static XMNetworkServiceManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[XMNetworkServiceManager alloc] init];
    });
    
    return manager;
}

- (XMNetworkSystemConfiguration *)systemConfig {
    if (_systemConfig == nil) {
        _systemConfig = [XMNetworkSystemConfiguration sharedInstance];
    }
    
    return _systemConfig;
}

- (void)requestWithAPI:(XMNetworkServiceMehtodBaseAPI *)api {
    @synchronized(self) {
        NSString *URL = [self URLStingWithAPI:api];
        NSDictionary *params = [self paramsWithAPI:api];
        
        switch (api.requestMethodMode) {
            case XMNetworkServiceRequestMethodModeGET: {
                [[AFHTTPSessionManager manager] GET:URL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                    NSLog(@"\n%@ downloadProgress: %@\n\n", NSStringFromClass([api class]), downloadProgress);
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSLog(@"\n%@ responseObject: %@\n\n", NSStringFromClass([api class]), responseObject);
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"\n%@ error: %@\n\n", NSStringFromClass([api class]), error);
                }];
            }
                break;
            case XMNetworkServiceRequestMethodModePUT: {
                [[AFHTTPSessionManager manager] PUT:URL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSLog(@"\n%@ responseObject: %@\n\n", NSStringFromClass([api class]), responseObject);
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"\n%@ error \n: %@ \n\n", NSStringFromClass([api class]), error);
                }];
            }
                break;
            case XMNetworkServiceRequestMethodModePOST: {
                
                if (api.uploadFileDatas) {
                    NSArray<NSDictionary *> *uploadArray = api.uploadFileDatas;
                    
                    [[AFHTTPSessionManager manager] POST:URL parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                        
                        [uploadArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            [formData appendPartWithFileData:obj[@"fileData"] name:obj[@"name"] fileName:obj[@"fileName"] mimeType:obj[@"mimeType"]];
                        }];
                        
                    } progress:^(NSProgress * _Nonnull uploadProgress) {
                        NSLog(@"\n%@ downloadProgress: %@\n\n", NSStringFromClass([api class]), uploadProgress);
                    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        NSLog(@"\n%@ responseObject: %@\n\n", NSStringFromClass([api class]), responseObject);
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        NSLog(@"\n%@ error: %@\n\n", NSStringFromClass([api class]), error);
                    }];
                }
                else {
                    [[AFHTTPSessionManager manager] POST:URL parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                        NSLog(@"\n%@ downloadProgress: %@\n\n", NSStringFromClass([api class]), uploadProgress);
                    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        NSLog(@"\n%@ responseObject: %@\n\n", NSStringFromClass([api class]), responseObject);
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        NSLog(@"\n%@ error: %@\n\n", NSStringFromClass([api class]), error);
                    }];
                }
            }
                break;
            case XMNetworkServiceRequestMethodModeDELETE: {
                [[AFHTTPSessionManager manager] DELETE:URL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSLog(@"\n%@ responseObject: %@\n\n", NSStringFromClass([api class]), responseObject);
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"\n%@ error \n: %@ \n\n", NSStringFromClass([api class]), error);
                }];
            }
                break;
        }
    }
}

/**
 *  @author Xuemin, 16-03-21 12:03:49
 *
 *  @brief 配置URL
 *
 *  @param api 方法API model
 *
 *  @return 方法级 和 系统级 整合的URL
 *
 *  @since 1.0
 */
- (NSString *)URLStingWithAPI:(XMNetworkServiceMehtodBaseAPI *)api {
    NSString *path = [api.relativePathToBaseURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    if (api.identifier && [api respondsToSelector:@selector(URIIdentifier)]) {
        [path stringByAppendingPathComponent:api.URIIdentifier];
    }
    
    NSURL *URL = [NSURL URLWithString:path];

    //如果这是一个有HOST的字符串则直接返回
    if (URL.host) {
        return path;
    }
    else {
        //基于baseURL构建
        NSString *urlString = [self.systemConfig.baseURL stringByAppendingPathComponent:path];
        return urlString;
    }
}

- (NSDictionary *)paramsWithAPI:(XMNetworkServiceMehtodBaseAPI *)api {
    if (api.methodParamsForInterface) {
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:api.methodParamsForInterface];
        [params setDictionary:self.systemConfig.systemParams];
        return params;
    }
    else {
        return self.systemConfig.systemParams;
    }
}
@end
