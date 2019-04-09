//
//  ShowTipViewController.m
//  BarderKit
//
//  Created by Joyce on 2019/3/9.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "ShowTipViewController.h"
#import "MBProgressHUD+MEShowHUD.h"
#import "UIAlertController+MEShowAlert.h"

@interface ShowTipViewController ()

@end

@implementation ShowTipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    CGFloat y = 20;
    [scrollView addSubview:[self createButtonWith:@"显示tip" y:y]];
    y += 50;
    [scrollView addSubview:[self createButtonWith:@"显示转圈" y:y]];
    y += 50;
    [scrollView addSubview:[self createButtonWith:@"显示Alert" y:y]];
}

- (UIButton *)createButtonWith:(NSString *)title y:(CGFloat)y{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(30, y, 100, 35);
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)buttonAction:(UIButton *)sender{
    NSString *title = sender.titleLabel.text;
    if ([title isEqualToString:@"显示tip"]) {
        [MBProgressHUD bk_showTipHUD:title];
    } else if ([title isEqualToString:@"显示转圈"]) {
        [MBProgressHUD bk_showStatusHUD:title];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD bk_hideHUD];
        });
    } else if ([title isEqualToString:@"显示Alert"]) {
        UIAlertController *alert = [UIAlertController me_showAlertViewWithTitle:title withMessage:nil cancelTitle:nil sureTitle:nil sureAction:^(UIAlertController * _Nonnull meAlert) {
            [MBProgressHUD bk_showTipHUD:meAlert.title];
        }];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
