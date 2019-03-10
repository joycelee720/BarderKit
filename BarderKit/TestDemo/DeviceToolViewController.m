//
//  DeviceToolViewController.m
//  BarderKit
//
//  Created by Joyce on 2019/3/9.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "DeviceToolViewController.h"
#import "BKHeightHeader.h"
#import "BKDeviceTool.h"

@interface DeviceToolViewController ()

@end

@implementation DeviceToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 16, ME_Screen_Width-32, 13*5)];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:13];
    label.text = [self labelText];
    [scrollView addSubview:label];
}

- (NSString *)labelText{
    NSString *text = [NSString stringWithFormat:@" bk_getBundleID: %@\n bk_getAppVersion: %@\n bk_getBuild: %@\n bk_getAppName: %@",
                      [BKDeviceTool bk_getBundleID],
                      [BKDeviceTool bk_getAppVersion],
                      [BKDeviceTool bk_getBuild],
                      [BKDeviceTool bk_getAppName]];
    
    
    return text;
}

@end
