//
//  UIView+Category.m
//  WisdomLaundry
//
//  Created by Joyce on 2019/3/14.
//  Copyright © 2019 iLaundry. All rights reserved.
//

#import "UIView+Category.h"
#import <objc/runtime.h>

static const char *kActionBlock = "kActionBlock";

@implementation UIView (Category)

- (void)wl_addEndEditing{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditing:)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isKindOfClass:[UITableViewCell class]]) {
        return NO;
    }
    if ([touch.view.superview isKindOfClass:[UITableViewCell class]]) {
        return NO;
    }
    
    if([touch.view.superview.superview isKindOfClass:[UITableViewCell class]]) {
        return NO;
    }
    
    return YES;
}

- (SPActionBlock)actionBlock{
    return objc_getAssociatedObject(self, &kActionBlock);
}

- (void)setActionBlock:(SPActionBlock)actionBlock{
    objc_setAssociatedObject(self, &kActionBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)sp_addPressActionBlock:(SPActionBlock)actionBlock{
    self.actionBlock = [actionBlock copy];
}

@end
