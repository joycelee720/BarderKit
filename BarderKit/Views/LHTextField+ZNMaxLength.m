//
//  LHTextField+ZNMaxLength.m
//  ZHINENGANQUAN
//
//  Created by Joyce on 2019/3/21.
//  Copyright © 2019 IntelligentTool. All rights reserved.
//

#import "LHTextField+ZNMaxLength.h"
#import <objc/runtime.h>

static const char *key = "maxLength";
static const char *blockKey = "blockKey";

@implementation LHTextField (ZNMaxLength)

+ (void)load{
    swizzleMethod([self class], @selector(textDidChange:), @selector(swizzled_textDidChange:));
}

- (NSInteger)maxLength{
    return [objc_getAssociatedObject(self, key) integerValue];
}

- (void)setMaxLength:(NSInteger)maxLength{
    objc_setAssociatedObject(self, key, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
}

- (LHTextFieldHandler)maxHandler{
    return objc_getAssociatedObject(self, blockKey);
}

- (void)setMaxHandler:(LHTextFieldHandler)maxHandler{
    objc_setAssociatedObject(self, blockKey, maxHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)addTextLength:(NSInteger)maxLength didMaxHandler:(LHTextFieldHandler)maxHandler{
    self.maxLength = maxLength;
    self.maxHandler = maxHandler;
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector){
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    // the method doesn’t exist and we just added one
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)swizzled_textDidChange:(NSNotification *)noti{
    if (noti.object != self) {
        return;
    }
    
    if (self.text.length == 1) {
        if ([self.text isEqualToString:@" "] || [self.text isEqualToString:@"\n"]) {
            self.text = @"";
        }
    }
    
    if (self.maxLength != NSUIntegerMax && self.maxLength != 0 && self.text.length > 0) {
        
        if (!self.markedTextRange && self.text.length >= self.maxLength) {
            !self.maxHandler ?: self.maxHandler(self);
            self.text = [self.text substringToIndex:self.maxLength];
            [self.undoManager removeAllActions];
        }
    }
    
    LHTextFieldHandler changeHandler =  [self valueForKey:@"changeHandler"];
    !changeHandler ?: changeHandler(self);
}

@end
