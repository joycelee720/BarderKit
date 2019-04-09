//
//  UIButton+SPCategory.m
//  SPSupply
//
//  Created by Joyce on 2019/3/27.
//  Copyright © 2019 ZhaoChuZi_Business. All rights reserved.
//

#import "UIButton+SPCategory.h"
#import <objc/runtime.h>

@implementation UIButton (SPCategory)

static char *blockKey = "blockKey";

- (TouchBlock)touchUpInsideBlock{
    return objc_getAssociatedObject(self, &blockKey);
}

- (void)setTouchUpInsideBlock:(TouchBlock)touchUpInsideBlock{
    objc_setAssociatedObject(self, &blockKey, touchUpInsideBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (UIButton *)sp_createButtonWithFontSize:(CGFloat)fontSize textColor:(UIColor *)color withTitle:(nonnull NSString *)title touchBlock:(TouchBlock _Nullable)touchUpInside{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setAttributedTitle:[[NSMutableAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}] forState:UIControlStateNormal];
    button.touchUpInsideBlock = [touchUpInside copy];
    [button addTarget:button action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)sp_changeButtonWithFontSize:(CGFloat)fontSize textColor:(UIColor *)color withTitle:(nonnull NSString *)title{
    [self setAttributedTitle:[[NSMutableAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}] forState:UIControlStateNormal];
}

- (void)sp_setButtonWithFontSize:(CGFloat)fontSize textColor:(UIColor *)color withTitle:(NSString *)title state:(UIControlState)state{
    [self setAttributedTitle:[[NSMutableAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}] forState:state];
}

- (void)clickButton{
    if (self.touchUpInsideBlock) {
        self.touchUpInsideBlock(self);
    }
}

@end
