//
//  UserAPIModel.h
//  Network
//
//  Created by Xuemin on 15/11/19.
//  Copyright © 2016年 XM. All rights reserved.
//

#import "XMNetworkServiceMehtodBaseAPI.h"

@interface UserAPIModel : XMNetworkServiceMehtodBaseAPI
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

@end
