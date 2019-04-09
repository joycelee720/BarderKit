//
//  SPViewController.m
//  SPSupply
//
//  Created by Joyce on 2019/3/27.
//  Copyright © 2019 ZhaoChuZi_Business. All rights reserved.
//

#import "SPViewController.h"

@interface SPViewController ()

@end

@implementation SPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.groupTableViewBackgroundColor;
}

- (void)sp_requestData{
    
}

- (void)sp_reloadListArray:(id)array{
    [self.listArray removeAllObjects];
    [self.listArray addObjectsFromArray:array];
}

- (void)sp_reloadTableViewOnMainThread:(void (^)(void))complete{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        if (complete) {
            complete();
        }
    });
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.sectionHeaderHeight = 0.01;
        _tableView.sectionFooterHeight = 0.01;
    }
    
    return _tableView;
}

- (NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray = [[NSMutableArray alloc] init];
    }
    
    return _listArray;
}

@end
