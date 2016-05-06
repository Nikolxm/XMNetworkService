//
//  XMXMNetworkSystemConfiguration.m
//  Network
//
//  Created by Xuemin on 16/3/21.
//  Copyright © 2016年 XM. All rights reserved.
//

#import "XMNetworkSystemConfiguration.h"

@implementation XMNetworkSystemConfiguration

- (NSDictionary *)paramsForInterfaceWithMethod:(id<XMNetworkServiceConfigMethodInterface>)method
                                        System:(id<XMNetworkServiceConfigSystemInterface>)system {
    
    NSDictionary *systemParams = [system systemParamsForInterface];
    NSDictionary *methodParams = [method methodParamsForInterface];
    
    NSMutableDictionary *parsms = [NSMutableDictionary dictionary];
    
    //整合参数
    if (systemParams) {
        [parsms setDictionary:systemParams];
    }
    
    if (methodParams) {
        [parsms setDictionary:methodParams];
    }
    
    return parsms;
}
@end
