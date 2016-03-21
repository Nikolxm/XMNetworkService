//
//  UserAPIModel.m
//  Network
//
//  Created by Xuemin on 15/11/19.
//  Copyright © 2016年 XM. All rights reserved.
//

#import "UserAPIModel.h"

@implementation UserAPIModel
- (NSDictionary *)paramsForInterface {
    return @{@"username": self.username, @"password" : self.password};
}

- (NSString *)relativePathToBaseURL {
    return @"user";
}

- (NSString *)identifier {
    return @"uid";
}
@end
