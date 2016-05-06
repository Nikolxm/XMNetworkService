
//
//  XMNetworkServiceConfigSystemInterface.h
//  Network
//
//  Created by Xuemin on 16/5/6.
//  Copyright © 2016年 Simin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XMNetworkServiceConfigSystemInterface <NSObject>

/**
 *  @author Xuemin, 16-05-06 11:05:12
 *
 *  @brief 系统级参数
 *
 *  @return 返回系统级参数
 *
 *  @since 1.0
 */
- (NSDictionary *)systemParamsForInterface;

/**
 *  @author Xuemin, 16-05-06 11:05:53
 *
 *  @brief 设置全局请求的头信息
 *
 *  @return 返回头信息字典
 *
 *  @since 1.0
 */
- (NSDictionary *)systemValuesForHTTPHeader;
@end
