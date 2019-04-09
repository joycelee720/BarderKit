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
            block(alert);
        }
    }];
    [alert addAction:cancelAction];
    [alert addAction:sureAction];
    return alert;
}

+ (UIAlertController *)me_showActionSheetViewWithTitle:(NSString *)title withMessage:(NSString *)message cancelTitle:(NSString *)cancel sureTitle:(NSString *)sure sureAction:(SureAction)block{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel ? cancel : @"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sure ? sure : @"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block(alert);
        }
    }];
    [alert addAction:cancelAction];
    [alert addAction:sureAction];
    return alert;
}

+ (UIAlertController *)me_showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message cancelTitle:(NSString *)cancel sureTitle:(NSString *)sure cancelAction:(CancelAction)cancelBlock sureAction:(SureAction)sureBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel ? cancel : @"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sure ? sure : @"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sureBlock) {
            sureBlock(alert);
        }
    }];
    [alert addAction:cancelAction];
    [alert addAction:sureAction];
    return alert;
}

+ (UIAlertController *)me_showActionSheetViewWithTitle:(NSString *)title withMessage:(NSString *)message cancelTitle:(NSString *)cancel sureTitle:(NSString *)sure cancelAction:(CancelAction)cancelBlock sureAction:(SureAction)sureBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel ? cancel : @"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sure ? sure : @"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sureBlock) {
            sureBlock(alert);
        }
    }];
    [alert addAction:cancelAction];
    [alert addAction:sureAction];
    return alert;
}

+ (UIAlertController *)me_showActionSheetViewWithTitle:(NSString *)title withMessage:(NSString *)message cancelTitle:(NSString *)cancel cancelAction:(CancelAction)cancelBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel ? cancel : @"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    [alert addAction:cancelAction];
    return alert;
}

+ (UIAlertController *)me_showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message cancelTitle:(NSString *)cancel cancelAction:(CancelAction)cancelBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel ? cancel : @"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }];
    [alert addAction:cancelAction];
    return alert;
}

+ (UIAlertController *)me_showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message cancelTitle:(NSString *)cancel sureTitle:(NSString *)sure defaultText:(NSString *)defaultText textFieldConfig:(TextFieldConfig)configBlock cancelAction:(CancelAction)cancelBlock sureAction:(ReturnText)textBlock{
    UIAlertController *alert = [UIAlertController me_showActionSheetViewWithTitle:title withMessage:message cancelTitle:cancel sureTitle:sure cancelAction:cancelBlock sureAction:^(UIAlertController * _Nonnull meAlert) {
        UITextField *textField = meAlert.textFields.firstObject;
        if (textBlock) {
            textBlock(textField.text);
        }
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
        if (configBlock) {
            configBlock(textField);
        }
    }];
    return alert;
}

@end
