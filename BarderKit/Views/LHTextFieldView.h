//
//  LHTextFieldView.h
//  BarderKit
//
//  Created by Joyce on 2019/3/10.
//  Copyright © 2019 Poet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHTextField.h"

typedef NS_ENUM(NSInteger, LHTextFieldViewType) {
    LHTextFieldViewTypeNormal,
    LHTextFieldViewTypeWords,
    LHTextFieldViewTypeImage
};

NS_ASSUME_NONNULL_BEGIN

@interface LHTextFieldView : UIView

+ (instancetype)textFieldViewWithFrame:(CGRect)frame withLHTextFieldViewType:(LHTextFieldViewType)viewType;

@property (nonatomic, assign) LHTextFieldViewType textFieldViewType;
/**
 LHTextField, 可自由设置其相关属性, 实现addTextDidChangeHandler来获取实时改变的值
 默认字体15
 */
@property (nonatomic, strong) LHTextField *textField;
/**
 textField高度, 默认为25
 */
@property (nonatomic, assign) CGFloat textFieldHeight;
/**
 textField距离左边宽度, LHTextFieldViewTypeNormal 中默认为16, 其他为8
 */
@property (nonatomic, assign) CGFloat leftMargin;
/**
 textField距离右边宽度, 默认为16
 */
@property (nonatomic, assign) CGFloat rightMargin;

///LHTextFieldViewTypeWords
/**
 textField前面的label, 默认字体14, 颜色#323232
 */
@property (nonatomic, strong) UILabel *titleLabel;
/**
 label宽度, 默认14*5+5
 */
@property (nonatomic, assign) CGFloat labelWidth;
/**
 label距离左边宽度, 默认为16
 */
@property (nonatomic, assign) CGFloat labelLeftMargin;

///LHTextFieldViewTypeImage
/**
 textField前面的imageView
 */
@property (nonatomic, strong) UIImageView *iconImageView;
/**
 imageView大小, 默认为25*25
 */
@property (nonatomic, assign) CGSize imageSize;
/**
 imageView距离左边宽度, 默认为16
 */
@property (nonatomic, assign) CGFloat imageLeftMargin;

@end

NS_ASSUME_NONNULL_END
