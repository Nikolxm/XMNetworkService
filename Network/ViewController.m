//
//  ViewController.m
//  Network
//
//  Created by Xuemin on 15/11/18.
//  Copyright © 2016年 XM. All rights reserved.
//

#import "ViewController.h"
#import "UserAPIModel.h"
#import "TestAPIModel.h"
#import "XMNetworkServiceManager.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UserAPIModel *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.contentView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        view.backgroundColor = [UIColor blueColor];
        view;
    });
    
    self.model = [[UserAPIModel alloc] init];
    
    NSLog(@"%@", self.contentView);
    
    TestAPIModel *apiModel = [[TestAPIModel alloc] init];
    apiModel.requestMethodMode = XMNetworkServiceRequestMethodModeGET;
    [[XMNetworkServiceManager sharedInstance] requestWithAPI:apiModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
