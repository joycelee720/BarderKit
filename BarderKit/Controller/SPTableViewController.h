//
//  SPTableViewController.h
//  BarderKit
//
//  Created by Joyce on 2019/3/27.
//  Copyright © 2019 Poet. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *listArray;

///子类实现
- (void)sp_requestData;

- (void)sp_reloadListArray:(id)array;
- (void)sp_reloadTableViewOnMainThread:(void(^ _Nullable)(void))complete;

@end

NS_ASSUME_NONNULL_END
