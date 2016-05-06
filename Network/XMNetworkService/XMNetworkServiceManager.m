//
//  XMNetworkServiceManager.m
//  Network
//
//  Created by Xuemin on 15/11/19.
//  Copyright © 2016年 XM. All rights reserved.
//

#import "XMNetworkServiceManager.h"
#import <AFNetworking/AFNetworking.h>

@interface XMNetworkServiceManager ()

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

- (void)requestWithAPI:(id<XMNetworkServiceConfigMethodInterface>)api {
    @synchronized(self) {
        NSString *URL = [api.requestURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
        
        NSDictionary *params = [api methodParamsForInterface];
        
        if (self.paramsManager&&self.systemParams) {
            params = [self.paramsManager paramsForInterfaceWithMethod:api
                                                               System:self.systemParams];
        }
        
        if (params) {
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
            NSString *paramsJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSLog(@"\nURL\n:%@\n params:\n%@\n", api.requestURL, paramsJson);
        }
        else {
            NSLog(@"\nURL\n:%@\n params:\n%@\n", api.requestURL, params);
        }
        
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
@end
