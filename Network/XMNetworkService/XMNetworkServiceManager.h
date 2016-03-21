//
//  XMNetworkServiceManager.h
//  Network
//
//  Created by Xuemin on 15/11/19.
//  Copyright © 2016年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMNetworkServiceMehtodBaseAPI;

@interface XMNetworkServiceManager : NSObject

+ (instancetype)sharedInstance;

- (void)requestWithAPI:(XMNetworkServiceMehtodBaseAPI *)api;
@end
