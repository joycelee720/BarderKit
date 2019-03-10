//
//  LHTextFieldView.m
//  BarderKit
//
//  Created by Joyce on 2019/3/10.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "LHTextFieldView.h"

@implementation LHTextFieldView

+ (instancetype)textFieldViewWithFrame:(CGRect)frame withLHTextFieldViewType:(LHTextFieldViewType)viewType{
    LHTextFieldView *view = [[LHTextFieldView alloc] initWithFrame:frame withType:viewType];
    view.backgroundColor = UIColor.whiteColor;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame withType:(LHTextFieldViewType)type{
    self = [super initWithFrame:frame];
    if (self) {
        self.textFieldViewType = type;
        self.textFieldHeight = 25.0f;
        [self addSubview:self.textField];
        [self configDetault];
    }
    
    return self;
}

- (void)configDetault{
    switch (self.textFieldViewType) {
        case LHTextFieldViewTypeNormal:
        {
            self.leftMargin = 16.0f;
            self.rightMargin = 16.0f;
        }
            break;
        case LHTextFieldViewTypeWords:
        {
            self.leftMargin = 8.0f;
            self.rightMargin = 16.0;
            self.labelWidth = 14*5+5;
            self.labelLeftMargin = 16.0;
            [self addSubview:self.titleLabel];
        }
            break;
        case LHTextFieldViewTypeImage:
        {
            self.leftMargin = 8.0f;
            self.rightMargin = 16.0;
            self.imageSize = CGSizeMake(25, 25);
            self.imageLeftMargin = 16.0;
            [self addSubview:self.iconImageView];
        }
            break;
        default:
        {
            self.leftMargin = 16.0f;
            self.rightMargin = 16.0f;
        }
            break;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.textFieldViewType == LHTextFieldViewTypeNormal) {
        self.textField.frame = CGRectMake(self.leftMargin, (self.bounds.size.height-self.textFieldHeight)/2.0, self.bounds.size.width-self.leftMargin-self.rightMargin, self.textFieldHeight);
    } else if (self.textFieldViewType == LHTextFieldViewTypeWords) {
        self.titleLabel.frame = CGRectMake(self.labelLeftMargin, 0, self.labelWidth, self.bounds.size.height);
        self.textField.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+self.leftMargin, (self.bounds.size.height-self.textFieldHeight)/2.0, self.bounds.size.width-(CGRectGetMaxX(self.titleLabel.frame)+self.leftMargin)-self.rightMargin, self.textFieldHeight);
    } else if (self.textFieldViewType == LHTextFieldViewTypeImage) {
        self.iconImageView.frame = CGRectMake(self.imageLeftMargin, (self.bounds.size.height-self.imageSize.height)/2.0, self.imageSize.width, self.imageSize.height);
        self.textField.frame = CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+self.leftMargin, (self.bounds.size.height-self.textFieldHeight)/2.0, self.bounds.size.width-(CGRectGetMaxX(self.titleLabel.frame)+self.leftMargin)-self.rightMargin, self.textFieldHeight);
    }
}

- (LHTextField *)textField{
    if (!_textField) {
        _textField = [[LHTextField alloc] init];
        _textField.font = [UIFont systemFontOfSize:15];
    }
    
    return _textField;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithRed:32/255.0 green:32/255.0 blue:32/255.0 alpha:1];
    }
    
    return _titleLabel;
}

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    
    return _iconImageView;
}

@end
