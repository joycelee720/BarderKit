//
//  UIView+Frame.h
//  BarderKit
//
//  Created by Joyce on 2019/3/15.
//  Copyright © 2019 Poet. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

- (CGFloat)bk_x;
- (CGFloat)bk_y;

- (CGFloat)bk_midX;
- (CGFloat)bk_midY;

- (CGFloat)bk_maxX;
- (CGFloat)bk_maxY;

- (CGFloat)bk_centerX;
- (CGFloat)bk_centerY;

- (CGFloat)bk_width;
- (CGFloat)bk_height;

- (void)bk_setX:(CGFloat)x;
- (void)bk_setY:(CGFloat)y;
- (void)bk_setXY:(CGPoint)point;

- (void)bk_setWidth:(CGFloat)width;
- (void)bk_setHeight:(CGFloat)height;
- (void)bk_setSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
