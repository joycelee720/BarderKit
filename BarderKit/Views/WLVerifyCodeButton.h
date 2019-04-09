//
//  WLVerifyCodeButton.h
//  WisdomLaundry
//
//  Created by Joyce on 2019/3/15.
//  Copyright © 2019 iLaundry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EndBlock)(void);
typedef void(^ProgressBlock)(NSInteger count);

NS_ASSUME_NONNULL_BEGIN

@interface WLVerifyCodeButton : UIButton

- (void)timeFailBeginFrom:(NSInteger)timeCount end:(EndBlock)endBlock progress:(ProgressBlock)progressBlock;

@end

NS_ASSUME_NONNULL_END
