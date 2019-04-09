//
//  BKDeviceTool.m
//  BarderKit
//
//  Created by Joyce on 2019/2/1.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "BKDeviceTool.h"

@implementation BKDeviceTool

+ (NSString *)bk_getBundleID{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

+ (NSString *)bk_getAppVersion{
    return [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)bk_getBuild{
    return [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)bk_getAppName{
    return [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (BOOL)isUserNotificationEnable{
    BOOL isEnable = NO;
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    isEnable = (UIUserNotificationTypeNone == setting.types) ? NO : YES;
    return isEnable;
}

@end
