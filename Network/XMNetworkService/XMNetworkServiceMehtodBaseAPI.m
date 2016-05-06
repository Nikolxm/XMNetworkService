//
//  XMNetworkServiceMehtodBaseAPIModel.m
//  Network
//
//  Created by Xuemin on 16/3/21.
//  Copyright © 2016年 XM. All rights reserved.
//

#import "XMNetworkServiceMehtodBaseAPI.h"

@implementation XMNetworkServiceMehtodBaseAPI

@synthesize persistence = _persistence;
@synthesize requestMethodMode = _requestMethodMode;
@synthesize identifier  = _identifier;
@synthesize uploadFileDatas = _uploadFileDatas;

- (NSDictionary *)methodParamsForInterface {
    return nil;
}

- (NSString *)requestURL {
    return nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self defualtSetupInit];
    }
    return self;
}

- (void)defualtSetupInit {
    self.requestMethodMode = XMNetworkServiceRequestMethodModePOST;
    self.persistence       = NO;
    self.identifier        = nil;
    self.page              = 1;
    self.numOfPage         = 10;
}
@end
