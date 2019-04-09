//
//  UIView+Category.h
//  WisdomLaundry
//
//  Created by Joyce on 2019/3/14.
//  Copyright © 2019 iLaundry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SPActionBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Category)<UIGestureRecognizerDelegate>

- (void)wl_addEndEditing;

@property (nonatomic, copy) SPActionBlock actionBlock;
- (void)sp_addPressActionBlock:(SPActionBlock)actionBlock;

@end

NS_ASSUME_NONNULL_END
