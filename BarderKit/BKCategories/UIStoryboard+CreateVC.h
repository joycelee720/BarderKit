//
//  UIStoryboard+CreateVC.h
//  ReassuringLaundry
//
//  Created by Michael on 2019/1/23.
//  Copyright © 2019 ReassuringLaundry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIStoryboard (CreateVC)

+ (UIViewController *)rl_createVCWith:(NSString *)name withBoardID:(NSString * _Nullable)boardID;

@end

NS_ASSUME_NONNULL_END
