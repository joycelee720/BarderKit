//
//  NSString+IsEmptyString.h
//  
//
//  Created by Michael on 2019/1/23.
//  Copyright © 2019 Poet. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (IsEmptyString)

- (NSString *)rl_stringByTrim;
- (BOOL)rl_isEmptyString;

@end

NS_ASSUME_NONNULL_END
