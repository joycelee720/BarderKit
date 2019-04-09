//
//  UIAlertController+MEShowAlert.h
//  DaBaoMerchantEntry
//
//  Created by Joyce on 2019/1/28.
//  Copyright © 2019 DaBao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CancelAction)(void);
typedef void (^SureAction)(UIAlertController *meAlert);
typedef void (^ReturnText)(NSString *text);
typedef void (^TextFieldConfig)(UITextField *textField);

@interface UIAlertController (MEShowAlert)

///不存在cancel动作的Alert
+ (UIAlertController *)me_showAlertViewWithTitle:(NSString * _Nullable)title withMessage:(NSString * _Nullable)message cancelTitle:(NSString * _Nullable)cancel sureTitle:(NSString * _Nullable)sure sureAction:(SureAction)block;

///存在cancel动作的Alert
+ (UIAlertController *)me_showAlertViewWithTitle:(NSString * _Nullable)title withMessage:(NSString * _Nullable)message cancelTitle:(NSString * _Nullable)cancel sureTitle:(NSString * _Nullable)sure cancelAction:(CancelAction _Nullable)cancelBlock sureAction:(SureAction _Nullable)sureBlock;

///仅cancel的Alert
+ (UIAlertController *)me_showAlertViewWithTitle:(NSString * _Nullable)title withMessage:(NSString * _Nullable)message cancelTitle:(NSString * _Nullable)cancel cancelAction:(CancelAction _Nullable)cancelBlock;

/// + textField的Alert
+ (UIAlertController *)me_showAlertViewWithTitle:(NSString * _Nullable)title withMessage:(NSString * _Nullable)message cancelTitle:(NSString * _Nullable)cancel sureTitle:(NSString * _Nullable)sure defaultText:(NSString * _Nullable)defaultText textFieldConfig:(TextFieldConfig _Nullable)configBlock cancelAction:(CancelAction _Nullable)cancelBlock sureAction:(ReturnText _Nullable)textBlock;


///不存在cancel动作的Action Sheet
+ (UIAlertController *)me_showActionSheetViewWithTitle:(NSString * _Nullable)title withMessage:(NSString * _Nullable)message cancelTitle:(NSString * _Nullable)cancel sureTitle:(NSString * _Nullable)sure sureAction:(SureAction)block;
///存在cancel动作的Action Sheet
+ (UIAlertController *)me_showActionSheetViewWithTitle:(NSString * _Nullable)title withMessage:(NSString * _Nullable)message cancelTitle:(NSString * _Nullable)cancel sureTitle:(NSString * _Nullable)sure cancelAction:(CancelAction _Nullable)cancelBlock sureAction:(SureAction _Nullable)sureBlock;
///仅cancel的Action Sheet
+ (UIAlertController *)me_showActionSheetViewWithTitle:(NSString * _Nullable)title withMessage:(NSString * _Nullable)message cancelTitle:(NSString * _Nullable)cancel cancelAction:(CancelAction _Nullable)cancelBlock;

@end

NS_ASSUME_NONNULL_END
