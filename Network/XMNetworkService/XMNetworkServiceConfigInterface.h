//
//  XMNetworkServiceConfigInterface.h
//  Network
//
//  Created by Xuemin on 16/5/6.
//  Copyright © 2016年 Simin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMNetworkServiceConfigMethodInterface.h"
#import "XMNetworkServiceConfigSystemInterface.h"

@protocol XMNetworkServiceConfigInterface <NSObject>

/**
 *  @author Xuemin, 16-05-06 11:05:11
 *
 *  @brief 整合参数
 *
 *  @param method 方法级的对象
 *  @param system 系统级的对象
 *
 *  @return 返回接口需要的参数
 *
 *  @since 1.0
 */
- (NSDictionary *)paramsForInterfaceWithMethod:(id<XMNetworkServiceConfigMethodInterface>)method
                                        System:(id<XMNetworkServiceConfigSystemInterface>)system;
@end
