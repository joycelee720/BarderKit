//
//  UIAlertController+MEShowAlert.m
//  DaBaoMerchantEntry
//
//  Created by Joyce on 2019/1/28.
//  Copyright © 2019 DaBao. All rights reserved.
//

#import "UIAlertController+MEShowAlert.h"

@implementation UIAlertController (MEShowAlert)

+ (UIAlertController *)me_showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message cancelTitle:(NSString *)cancel sureTitle:(NSString *)sure sureAction:(SureAction)block{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel ? cancel : @"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sure ? sure : @"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block();
        }
    }];
    [alert addAction:cancelAction];
    [alert addAction:sureAction];
    return alert;
}

+ (UIAlertController *)me_showActionSheetViewWithTitle:(NSString * _Nullable)title withMessage:(NSString * _Nullable)message cancelTitle:(NSString * _Nullable)cancel sureTitle:(NSString * _Nullable)sure sureAction:(SureAction)block{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel ? cancel : @"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sure ? sure : @"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block();
        }
    }];
    [alert addAction:cancelAction];
    [alert addAction:sureAction];
    return alert;
}

@end
