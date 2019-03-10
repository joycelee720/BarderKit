//
//  UIAlertController+MEShowAlert.h
//  DaBaoMerchantEntry
//
//  Created by Joyce on 2019/1/28.
//  Copyright © 2019 DaBao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SureAction)(void);

@interface UIAlertController (MEShowAlert)

+ (UIAlertController *)me_showAlertViewWithTitle:(NSString * _Nullable)title withMessage:(NSString * _Nullable)message cancelTitle:(NSString * _Nullable)cancel sureTitle:(NSString * _Nullable)sure sureAction:(SureAction)block;

+ (UIAlertController *)me_showActionSheetViewWithTitle:(NSString * _Nullable)title withMessage:(NSString * _Nullable)message cancelTitle:(NSString * _Nullable)cancel sureTitle:(NSString * _Nullable)sure sureAction:(SureAction)block;

@end

NS_ASSUME_NONNULL_END
