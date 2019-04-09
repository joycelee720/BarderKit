//
//  SPTableViewController.m
//  BarderKit
//
//  Created by Joyce on 2019/3/27.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "SPTableViewController.h"

@interface SPTableViewController ()

@end

@implementation SPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionHeaderHeight = 0.01f;
    self.tableView.sectionFooterHeight = 0.01f;
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

- (NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray = [[NSMutableArray alloc] init];
    }
    
    return _listArray;
}

@end
