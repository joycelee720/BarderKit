//
//  DemoViewController.m
//  BarderKit
//
//  Created by Joyce on 2019/3/9.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@{@"title": @"DeviceTool", @"class":@"DeviceToolViewController"},
                       @{@"title": @"ShowTip", @"class":@"ShowTipViewController"},
                       @{@"title": @"TextField", @"class":@"TextFieldViewController"}];
    self.listArray = [NSMutableArray arrayWithArray:array];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kIdentifierCell" forIndexPath:indexPath];
    cell.textLabel.text = self.listArray[indexPath.row][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *className = self.listArray[indexPath.row][@"class"];
    Class class = NSClassFromString(className);
    UIViewController *vc = [class new];
    vc.view.backgroundColor = UIColor.groupTableViewBackgroundColor;
    vc.navigationItem.title = self.listArray[indexPath.row][@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"kIdentifierCell"];
    }
    
    return _tableView;
}

@end
