//
//  CodeButtonViewController.m
//  BarderKit
//
//  Created by Joyce on 2019/3/15.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "CodeButtonViewController.h"
#import "WLVerifyCodeButton.h"

@interface CodeButtonViewController ()

@end

@implementation CodeButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor;

    WLVerifyCodeButton *button = [WLVerifyCodeButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 50, 80, 40);
    button.backgroundColor = UIColor.blueColor;
    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)tap:(WLVerifyCodeButton *)button{
    [button timeFailBeginFrom:10 end:^{
        [button setTitle:@"获取验证码" forState:UIControlStateNormal];
    } progress:^(NSInteger count) {
        [button setTitle:@(count).stringValue forState:UIControlStateNormal];
    }];
}

@end
