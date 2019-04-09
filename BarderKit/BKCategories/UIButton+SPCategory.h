//
//  UIButton+SPCategory.h
//  SPSupply
//
//  Created by Joyce on 2019/3/27.
//  Copyright © 2019 ZhaoChuZi_Business. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TouchBlock)(UIButton *button);

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SPCategory)

@property (nonatomic, copy) TouchBlock touchUpInsideBlock;

+ (UIButton *)sp_createButtonWithFontSize:(CGFloat)fontSize textColor:(UIColor *)color withTitle:(NSString *)title touchBlock:(_Nullable TouchBlock)touchUpInside;

- (void)sp_changeButtonWithFontSize:(CGFloat)fontSize textColor:(UIColor *)color withTitle:(nonnull NSString *)title;

- (void)sp_setButtonWithFontSize:(CGFloat)fontSize textColor:(UIColor *)color withTitle:(nonnull NSString *)title state:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
