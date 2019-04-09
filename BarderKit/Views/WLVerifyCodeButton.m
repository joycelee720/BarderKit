//
//  WLVerifyCodeButton.m
//  WisdomLaundry
//
//  Created by Joyce on 2019/3/15.
//  Copyright © 2019 iLaundry. All rights reserved.
//

#import "WLVerifyCodeButton.h"

@interface WLVerifyCodeButton ()

@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger count;
@property (nonatomic, copy) EndBlock endBlock;
@property (nonatomic, copy) ProgressBlock progressBlock;

@end

@implementation WLVerifyCodeButton

- (void)timeFailBeginFrom:(NSInteger)timeCount end:(EndBlock)endBlock progress:(ProgressBlock)progressBlock{
    self.endBlock = endBlock;
    self.progressBlock = progressBlock;
    
    self.count = timeCount;
    self.enabled = NO;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeDown) userInfo: nil repeats:YES];
}

- (void)timeDown{
    if (self.count != 1){
        self.count -=1;
        self.enabled = NO;
        self.progressBlock(self.count);
    } else {
        self.enabled = YES;
        self.endBlock();
        [self.timer invalidate];
        self.timer = nil;
        self.endBlock = nil;
        self.progressBlock = nil;
    }
}

@end
