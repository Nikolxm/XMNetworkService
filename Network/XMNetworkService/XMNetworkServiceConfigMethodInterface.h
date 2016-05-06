//
//  NetworkServiceMethodConfigInterface.h
//  Network
//
//  Created by Xuemin on 16/3/21.
//  Copyright © 2016年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  @author Xuemin, 15-12-14 11:12:09
 *
 *  @brief 请求方式
 *
 *  @since 1.0
 */
typedef NS_ENUM(NSInteger, XMNetworkServiceRequestMethodMode) {
    XMNetworkServiceRequestMethodModeGET    = 0,
    XMNetworkServiceRequestMethodModePUT    = 1,
    XMNetworkServiceRequestMethodModePOST   = 2,
    XMNetworkServiceRequestMethodModeDELETE = 3,
};

/**
 *  @author Xuemin, 15-12-14 11:12:09
 *
 *  @brief 接口（方法级）需要遵循的方法
 *
 *  @since 1.0
 */
@protocol XMNetworkServiceConfigMethodInterface <NSObject>
@property (nonatomic, copy)   NSString *identifier; //URL 资源标识
@property (nonatomic, assign) BOOL persistence;  //是否持久化接口返回的数据 默认 NO
@property (nonatomic, assign) XMNetworkServiceRequestMethodMode requestMethodMode; //默认post
@property (strong, nonatomic) NSArray *uploadFileDatas; //里面是NSDictionary包含fileData, name, fileName, mimeType四个key

@required
//方法级接口需要的参数
- (NSDictionary *)methodParamsForInterface;

/**
 * 例 @"http://xx/xx" URL
 */
- (NSString *)requestURL; //请求URL

@optional

/**
 *  @author Xuemin, 16-03-21 14:03:22
 *
 *  @brief 上传文件数组
 *
 *  @return  里面是NSDictionary包含fileData, name, fileName, mimeType四个key
 *
 *  @since 1.0
 */
- (NSArray<NSDictionary<NSString *, id> *> *)uploadFileDatas;
@end
