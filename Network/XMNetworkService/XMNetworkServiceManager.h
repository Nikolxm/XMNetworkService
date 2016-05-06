//
//  XMNetworkServiceManager.h
//  Network
//
//  Created by Xuemin on 15/11/19.
//  Copyright © 2016年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMNetworkServiceConfigInterface.h"

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

@interface XMNetworkServiceManager : NSObject

//设置系统参数
@property (strong, nonatomic) id<XMNetworkServiceConfigSystemInterface> systemParams;

//设置参数管理对象
@property (strong, nonatomic) id<XMNetworkServiceConfigInterface> paramsManager;

+ (instancetype)sharedInstance;

- (void)requestWithAPI:(id<XMNetworkServiceConfigMethodInterface>)api;
@end
