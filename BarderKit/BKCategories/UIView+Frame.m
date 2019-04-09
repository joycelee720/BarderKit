//
//  UIView+Frame.m
//  BarderKit
//
//  Created by Joyce on 2019/3/15.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)bk_x{
    return self.frame.origin.x;
}
- (CGFloat)bk_y{
    return self.frame.origin.y;
}

- (CGFloat)bk_midX{
    return CGRectGetMidX(self.frame);
}
- (CGFloat)bk_midY{
    return CGRectGetMidY(self.frame);
}

- (CGFloat)bk_maxX{
    return CGRectGetMaxX(self.frame);
}
- (CGFloat)bk_maxY{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)bk_centerX{
    return self.center.x;
}
- (CGFloat)bk_centerY{
    return self.center.y;
}

- (CGFloat)bk_width{
    return self.frame.size.width;
}
- (CGFloat)bk_height{
    return self.frame.size.height;
}

- (void)bk_setX:(CGFloat)x{
    CGRect bkFrame = self.frame;
    bkFrame.origin.x = x;
    self.frame = bkFrame;
}
- (void)bk_setY:(CGFloat)y{
    CGRect bkFrame = self.frame;
    bkFrame.origin.y = y;
    self.frame = bkFrame;
}
- (void)bk_setXY:(CGPoint)point{
    CGRect bkFrame = self.frame;
    bkFrame.origin = point;
    self.frame = bkFrame;
}

- (void)bk_setWidth:(CGFloat)width{
    CGRect bkFrame = self.frame;
    bkFrame.size.width = width;
    self.frame = bkFrame;
}
- (void)bk_setHeight:(CGFloat)height{
    CGRect bkFrame = self.frame;
    bkFrame.size.height = height;
    self.frame = bkFrame;
}
- (void)bk_setSize:(CGSize)size{
    CGRect bkFrame = self.frame;
    bkFrame.size = size;
    self.frame = bkFrame;
}

@end
