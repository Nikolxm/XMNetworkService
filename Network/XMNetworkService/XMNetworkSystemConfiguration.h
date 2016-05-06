//
//  XMXMNetworkSystemConfiguration.h
//  Network
//
//  Created by Xuemin on 16/3/21.
//  Copyright © 2016年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMNetworkServiceConfigInterface.h"

/**
 *  @author Xuemin, 16-05-06 12:05:20
 *
 *  @brief 自定义系统参数配置类
 *
 *  @since 1.0
 */
@interface XMNetworkSystemConfiguration : NSObject <XMNetworkServiceConfigInterface>
- (NSDictionary *)paramsForInterfaceWithMethod:(id<XMNetworkServiceConfigMethodInterface>)method
                                        System:(id<XMNetworkServiceConfigSystemInterface>)system;
@end
