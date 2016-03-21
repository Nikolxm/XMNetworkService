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
 * 例1 @"xx/xx" 会根据XMNetworkSystemConfiguration拼接形成完整的URL
 * 例2 @"http://xx/xx" 直接使用这个URL
 */
- (NSString *)relativePathToBaseURL; //相对与baseURL的路径

@optional
/**
 *  @author Xuemin, 16-03-21 11:03:38
 *
 *  @brief 如果是RESTful API 尝试模式实现（获取这个不会调用relativePathToBaseURL）
 
 *  @return identifier 资源标识 可以为空
 *
 *  @since 1.0
 */
- (NSString *)URIIdentifier;

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
