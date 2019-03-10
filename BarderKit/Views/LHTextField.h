//
//  LHTextField.h
//  WisdomLaundry
//
//  Created by Joyce on 2019/3/8.
//  Copyright © 2019 iLaundry. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSInteger, LHTextFieldType) {
//    LHTextFieldTypeNoIcon = 1
//};

@class LHTextField;

typedef void(^LHTextFieldHandler)(LHTextField *textField);

NS_ASSUME_NONNULL_BEGIN

@interface LHTextField : UITextField

/**
 该属性返回一个经过处理的 `self.text` 的值, 去除了首位的空格和换行.
 */
@property (nonatomic, readonly) NSString *formatText;
/**
 设定文本改变Block回调. (切记弱化引用, 以免造成内存泄露.)
 */
- (void)addTextDidChangeHandler:(LHTextFieldHandler)eventHandler;

@end

NS_ASSUME_NONNULL_END
