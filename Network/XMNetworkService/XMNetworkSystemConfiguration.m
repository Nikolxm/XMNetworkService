//
//  XMXMNetworkSystemConfiguration.m
//  Network
//
//  Created by Xuemin on 16/3/21.
//  Copyright © 2016年 XM. All rights reserved.
//

#import "XMNetworkSystemConfiguration.h"

@implementation XMNetworkSystemConfiguration

@synthesize baseURL = _baseURL;
@synthesize systemParams = _systemParams;

+ (instancetype)sharedInstance {
    static XMNetworkSystemConfiguration *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[XMNetworkSystemConfiguration alloc] init];
    });
    
    return manager;
}

- (NSString *)baseURL {
    if (_baseURL == nil) {
        //这里更改主域名
        _baseURL = @"http://www.baidu.com";
    }
    
    return _baseURL;
}

- (NSDictionary *)systemParams {
    if (_systemParams == nil) {
        
        //这里配置只一次系统参数（如果有需要每次配置请求，去掉判断_systemParams == nil）
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        
        _systemParams = params;
    }
    
    
    return  _systemParams;
}
@end
