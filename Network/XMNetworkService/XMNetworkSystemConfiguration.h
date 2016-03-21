//
//  XMXMNetworkSystemConfiguration.h
//  Network
//
//  Created by Xuemin on 16/3/21.
//  Copyright © 2016年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @author Xuemin, 16-03-21 10:03:24
 *
 *  @brief 网络服务的环境模式
 *
 *  @since 1.0
 */
typedef NS_ENUM(NSInteger, XMNetworkServiceEnvironmentMode) {
    XMNetworkServiceEnvironmentModeDebug,     //修改bug
    XMNetworkServiceEnvironmentModeDeveloper, //开发
    XMNetworkServiceEnvironmentModeRelese,    //发布
};

/**
 *  @author Xuemin, 16-03-21 10:03:48
 *
 *  @brief 系统级参数配置
 *
 *  @since 1.0
 */
@interface XMNetworkSystemConfiguration : NSObject
@property (nonatomic, readonly) NSString     *baseURL;
@property (nonatomic, readonly) NSDictionary *systemParams; //系统参数
@property (nonatomic, assign)   XMNetworkServiceEnvironmentMode mode; //默认debug模式

+ (instancetype)sharedInstance;
@end
