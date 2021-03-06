//
//  MBProgressHUD+MEShowHUD.m
//  
//
//  Created by Joyce on 2019/1/27.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "MBProgressHUD+MEShowHUD.h"

@implementation MBProgressHUD (MEShowHUD)

+ (void)bk_showTipHUD:(NSString *)tip{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:UIApplication.sharedApplication.keyWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = tip;
        [hud hideAnimated:YES afterDelay:1.0];
    });
}

+ (void)bk_showTipHUD:(NSString *)tip onView:(UIView *)onView{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:onView animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = tip;
        [hud hideAnimated:YES afterDelay:1.0];
    });
}

+ (void)bk_showStatusHUD:(NSString *)tip{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:UIApplication.sharedApplication.keyWindow animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = tip;
    });
}

+ (void)bk_showStatusHUD:(NSString *)tip onView:(UIView *)onView{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:onView animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = tip;
    });
}

+ (void)bk_hideHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:UIApplication.sharedApplication.keyWindow animated:YES];
    });
}

+ (void)bk_hideHUD:(UIView *)onView{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:onView animated:YES];
    });
}

@end
