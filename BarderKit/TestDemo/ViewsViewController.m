//
//  ViewsViewController.m
//  BarderKit
//
//  Created by Joyce on 2019/3/15.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "ViewsViewController.h"
#import "BKTableView.h"

@interface ViewsViewController ()

//@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, strong) BKTableView *bkTableView;

@end

@implementation ViewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    [self.view addSubview:self.bkTableView];
    [self.bkTableView bk_addSelectedRowBlock:^(BKCellModel *rowModel) {
        NSString *className = rowModel.pushClassName;
        if (className == nil || className.length == 0) {
            return;
        }
        
        Class class = NSClassFromString(className);
        if (class) {
            UIViewController *vc = [class new];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }];
}

- (void)configData{
    BKCellSectionModel *section0 = [[BKCellSectionModel alloc] init];
    section0.section = 0;
    BKCellModel *row0_0 = [[BKCellModel alloc] init];
    row0_0.title = @"WLVerifyCodeButton";
    row0_0.pushClassName = @"CodeButtonViewController";
    row0_0.cellType = BKCellType_normal;
    row0_0.indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    BKCellModel *row1_0 = [[BKCellModel alloc] init];
    row1_0.title = @"TextField";
    row1_0.pushClassName = @"TextFieldViewController";
    row1_0.cellType = BKCellType_normal;
    row1_0.indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    section0.sectionRowArray = [NSMutableArray arrayWithArray:@[row0_0, row1_0]];
    
    self.listArray = [NSMutableArray arrayWithArray:@[section0]];
}

- (BKTableView *)bkTableView{
    if (!_bkTableView) {
        _bkTableView = [BKTableView bk_tableViewWithFrame:self.view.bounds style:UITableViewStyleGrouped dataSource:self.listArray];
    }
    
    return _bkTableView;
}

@end
