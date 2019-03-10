//
//  TextFieldViewController.m
//  BarderKit
//
//  Created by Joyce on 2019/3/10.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "TextFieldViewController.h"
#import "LHTextFieldView.h"

@interface TextFieldViewController ()

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LHTextFieldView *textField1 = [LHTextFieldView textFieldViewWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 45) withLHTextFieldViewType:LHTextFieldViewTypeNormal];
    textField1.textField.placeholder = @"textField1";
    [textField1.textField addTextDidChangeHandler:^(LHTextField *textField) {
        NSLog(@"%@", textField.formatText);
    }];
    [self.view addSubview:textField1];
    LHTextFieldView *textField2 = [LHTextFieldView textFieldViewWithFrame:CGRectMake(0, 45, UIScreen.mainScreen.bounds.size.width, 45) withLHTextFieldViewType:LHTextFieldViewTypeWords];
    textField2.textField.placeholder = @"textField2";
    textField2.titleLabel.text = @"测试例子：";
    [self.view addSubview:textField2];
    LHTextFieldView *textField3 = [LHTextFieldView textFieldViewWithFrame:CGRectMake(0, 90, UIScreen.mainScreen.bounds.size.width, 45) withLHTextFieldViewType:LHTextFieldViewTypeImage];
    textField3.textField.placeholder = @"textField3";
    textField3.iconImageView.image = [UIImage imageNamed:@""];
    [self.view addSubview:textField3];
}

@end
