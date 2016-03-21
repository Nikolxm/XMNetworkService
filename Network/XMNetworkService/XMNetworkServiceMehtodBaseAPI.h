//
//  XMNetworkServiceMehtodBaseAPIModel.h
//  Network
//
//  Created by Xuemin on 16/3/21.
//  Copyright © 2016年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMNetworkServiceConfigMethodInterface.h"

@interface XMNetworkServiceMehtodBaseAPI : NSObject<XMNetworkServiceConfigMethodInterface>
@property (strong, nonatomic) id firstDataIdentifier; //最新数据标识
@property (strong, nonatomic) id lastDataIdentifier;  //最后数据标识
@property (assign, nonatomic) NSInteger page;         //分页
@property (assign, nonatomic) NSInteger numOfPage;    //每页的数据数量
@end
