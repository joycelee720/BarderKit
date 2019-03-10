//
//  LHTextField.m
//  WisdomLaundry
//
//  Created by Joyce on 2019/3/8.
//  Copyright © 2019 iLaundry. All rights reserved.
//

#import "LHTextField.h"

@interface LHTextField ()

@property (nonatomic, copy) LHTextFieldHandler changeHandler; ///< 文本改变Block

@end

@implementation LHTextField

- (BOOL)becomeFirstResponder{
    BOOL become = [super becomeFirstResponder];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
    return become;
}

- (BOOL)resignFirstResponder{
    BOOL resign = [super resignFirstResponder];
    [NSNotificationCenter.defaultCenter removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    return resign;
}

- (void)textDidChange:(NSNotification *)noti{
    if (noti.object != self) {
        return;
    }
    
    if (self.text.length == 1) {
        if ([self.text isEqualToString:@" "] || [self.text isEqualToString:@"\n"]) {
            self.text = @"";
        }
    }
    
    !_changeHandler ?: _changeHandler(self);
}

- (void)addTextDidChangeHandler:(LHTextFieldHandler)eventHandler{
    _changeHandler = [eventHandler copy];
}

- (NSString *)formatText{
    return [[super text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
