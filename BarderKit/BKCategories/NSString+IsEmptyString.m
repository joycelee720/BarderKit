//
//  NSString+IsEmptyString.m
//  
//
//  Created by Michael on 2019/1/23.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "NSString+IsEmptyString.h"

@implementation NSString (IsEmptyString)

- (NSString *)rl_stringByTrim{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)rl_isEmptyString{
    NSString *str = [self rl_stringByTrim];
    if (str && str.length > 0) {
        return NO;
    }
    
    return YES;
}

- (NSString *)ys_transferDateStringWithFormatter:(NSString *)format toFormatter:(NSString *)toFormat{
    NSDateFormatter *fromFormatter = [[NSDateFormatter alloc] init];
    fromFormatter.dateFormat = format;
    NSDate *date = [fromFormatter dateFromString:self];
    NSDateFormatter *toFormatter = [[NSDateFormatter alloc] init];
    toFormatter.dateFormat = toFormat;
    return [toFormatter stringFromDate:date];
}

@end
