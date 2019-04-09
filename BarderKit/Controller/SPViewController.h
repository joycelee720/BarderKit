//
//  SPViewController.h
//  SPSupply
//
//  Created by Joyce on 2019/3/27.
//  Copyright © 2019 ZhaoChuZi_Business. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, strong) UITableView *tableView;

///子类实现
- (void)sp_requestData;

- (void)sp_reloadListArray:(id)array;
- (void)sp_reloadTableViewOnMainThread:(void(^ _Nullable)(void))complete;

@end

NS_ASSUME_NONNULL_END
