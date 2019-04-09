//
//  LHTextField+ZNMaxLength.h
//  ZHINENGANQUAN
//
//  Created by Joyce on 2019/3/21.
//  Copyright © 2019 IntelligentTool. All rights reserved.
//

#import "LHTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface LHTextField (ZNMaxLength)

@property (nonatomic, assign) NSInteger maxLength;
@property (nonatomic, copy) LHTextFieldHandler maxHandler;

- (void)addTextLength:(NSInteger)maxLength didMaxHandler:(LHTextFieldHandler)maxHandler;

@end

NS_ASSUME_NONNULL_END
