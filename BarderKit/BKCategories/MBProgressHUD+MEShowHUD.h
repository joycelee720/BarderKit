//
//  MBProgressHUD+MEShowHUD.h
//  
//
//  Created by Joyce on 2019/1/27.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (MEShowHUD)

+ (void)bk_showTipHUD:(NSString *)tip onView:(UIView *)onView;
+ (void)bk_showTipHUD:(NSString *)tip;

+ (void)bk_showStatusHUD:(NSString * _Nullable)tip onView:(UIView *)onView;
+ (void)bk_showStatusHUD:(NSString * _Nullable)tip;

+ (void)bk_hideHUD:(UIView *)onView;
+ (void)bk_hideHUD;

@end

NS_ASSUME_NONNULL_END
