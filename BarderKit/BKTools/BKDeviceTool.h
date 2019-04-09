//
//  BKDeviceTool.h
//  BarderKit
//
//  Created by Joyce on 2019/2/1.
//  Copyright © 2019 Poet. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BKDeviceTool : NSObject

+ (NSString *)bk_getBundleID;
+ (NSString *)bk_getAppVersion;
+ (NSString *)bk_getBuild;
+ (NSString *)bk_getAppName;

+ (BOOL)isUserNotificationEnable;

@end

NS_ASSUME_NONNULL_END
