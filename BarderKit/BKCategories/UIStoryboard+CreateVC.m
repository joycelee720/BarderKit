//
//  UIStoryboard+CreateVC.m
//  ReassuringLaundry
//
//  Created by Michael on 2019/1/23.
//  Copyright © 2019 ReassuringLaundry. All rights reserved.
//

#import "UIStoryboard+CreateVC.h"

@implementation UIStoryboard (CreateVC)

+ (UIViewController *)rl_createVCWith:(NSString *)name withBoardID:(NSString *)boardID{
    UIStoryboard *story = [UIStoryboard storyboardWithName:name bundle:nil];
    if (boardID && boardID.length > 0) {
        return [story instantiateViewControllerWithIdentifier:boardID];
    } else {
        return [story instantiateInitialViewController];
    }
}

@end
