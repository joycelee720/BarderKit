//
//  BKTableView.m
//  BarderKit
//
//  Created by Joyce on 2019/3/16.
//  Copyright © 2019 Poet. All rights reserved.
//

#import "BKTableView.h"

@interface BKRightImageCell : UITableViewCell

@property (nonatomic, strong) UIImageView *rightImage;

@end

@implementation BKRightImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    
    return self;
}

- (void)createUI{
    _rightImage = [[UIImageView alloc] init];
    _rightImage.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_rightImage];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _rightImage.frame = CGRectMake(self.bounds.size.width-16-(self.bounds.size.height-20), 10, self.bounds.size.height-20, self.bounds.size.height-20);
}

@end

@interface BKUserInfoCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headerView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation BKUserInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    
    return self;
}

- (void)createUI{
    _headerView = [[UIImageView alloc] init];
    _headerView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_headerView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0];
    _titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [self.contentView addSubview:_titleLabel];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textColor = UIColor.darkGrayColor;
    _contentLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.contentView addSubview:_contentLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _headerView.frame = CGRectMake(16, (self.bounds.size.height-50.0f)/2.0, 50.0f, 50.0f);
    _titleLabel.frame = CGRectMake(16.0f+50.0f+12.0f, CGRectGetMidY(_headerView.frame)-6.0f-18.0f, UIScreen.mainScreen.bounds.size.width-(16.0f+50.0f+12.0f)-50.0f, 18.0f);
    _contentLabel.frame = CGRectMake(16.0f+50.0f+12.0f, CGRectGetMidY(_headerView.frame)+6.0f, UIScreen.mainScreen.bounds.size.width-(16.0f+50.0f+12.0f)-50.0f, 16.0f);
}

@end

@implementation BKCellSectionModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.sectionHeaderHeight = 15.0f;
        self.sectionFooterHeight = 0.01f;
        self.sectionRowArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end

@implementation BKCellModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.cellHeight = 44.0f;
        self.hasArrow = YES;
    }
    
    return self;
}

- (void)setCellType:(BKCellType)cellType{
    _cellType = cellType;
    if (_cellType == BKCellType_userInfo || _cellType == BKCellType_rightImage) {
        self.cellHeight = 70.0f;
    } else if (_cellType == BKCellType_normal) {
        self.cellHeight = 44.0f;
    } else if (_cellType == BKCellType_loginOut) {
        self.cellHeight = 44.0f;
    }
}

@end

@interface BKTableView ()

@property (nonatomic, copy) SelectedRow selectedRowBlock;

@end

@implementation BKTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.sectionHeaderHeight = 0.01;
        self.sectionFooterHeight = 0.01;
    }
    
    return self;
}

+ (instancetype)bk_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(NSArray<BKCellSectionModel *> *)dataSource{
    BKTableView *tableView = [[BKTableView alloc] initWithFrame:frame style:style];
    tableView.sectionArray = [NSMutableArray arrayWithArray:dataSource];
    return tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    BKCellSectionModel *sectionModel = self.sectionArray[section];
    return !sectionModel.sectionRowArray ? 0 : sectionModel.sectionRowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BKCellSectionModel *sectionModel = self.sectionArray[indexPath.section];
    BKCellModel *rowModel = sectionModel.sectionRowArray[indexPath.row];
    if (rowModel.cellType == BKCellType_userInfo) {
        BKUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BKUserInfoCell"];
        if (cell == nil) {
            cell = [[BKUserInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BKUserInfoCell"];
            cell.backgroundColor = UIColor.whiteColor;
        }
        
        cell.accessoryType = rowModel.hasArrow ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
        cell.titleLabel.text = rowModel.title;
        cell.contentLabel.text = rowModel.subTitle;
        self.userHeaderView = cell.headerView;
        return cell;
    } else if (rowModel.cellType == BKCellType_rightImage) {
        BKRightImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BKRightImageCell"];
        if (cell == nil) {
            cell = [[BKRightImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BKRightImageCell"];
            cell.backgroundColor = UIColor.whiteColor;
            cell.textLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0];
            cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
            cell.textLabel.backgroundColor = UIColor.clearColor;
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        cell.textLabel.text = !rowModel.title ? @"" : rowModel.title;
        cell.rightImage.image = rowModel.headerImage;
        return cell;
    } else if (rowModel.cellType == BKCellType_loginOut) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BKLoginOutCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BKLoginOutCell"];
            cell.backgroundColor = UIColor.whiteColor;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0];
            cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
        }
        
        cell.textLabel.text = rowModel.title;
        return cell;
    } else if (rowModel.cellType == BKCellType_normal) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BKNormalCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"BKNormalCell"];
            cell.backgroundColor = UIColor.whiteColor;
            cell.textLabel.textColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1.0];
            cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
            cell.detailTextLabel.textColor = UIColor.darkGrayColor;
            cell.detailTextLabel.font = [UIFont systemFontOfSize:14.0f];
        }
        
        cell.accessoryType = rowModel.hasArrow ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
        cell.textLabel.text = !rowModel.title ? @"" : rowModel.title;
        cell.detailTextLabel.text = !rowModel.subTitle ? @"" : rowModel.subTitle;
        if (rowModel.headerImage) {
            cell.imageView.image = rowModel.headerImage;
        }
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BKOtherCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BKOtherCell"];
            cell.backgroundColor = UIColor.whiteColor;
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        cell.textLabel.text = @"";
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BKCellSectionModel *sectionModel = self.sectionArray[indexPath.section];
    BKCellModel *rowModel = sectionModel.sectionRowArray[indexPath.row];
    return rowModel.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    BKCellSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.sectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    BKCellSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.sectionFooterHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BKCellSectionModel *sectionModel = self.sectionArray[indexPath.section];
    BKCellModel *rowModel = sectionModel.sectionRowArray[indexPath.row];
    !self.selectedRowBlock ?: self.selectedRowBlock(rowModel);
}

- (void)bk_addSelectedRowBlock:(SelectedRow)selectedRowBlock{
    self.selectedRowBlock = selectedRowBlock;
}

- (void)bk_reloadTableView{
    [self reloadData];
}

- (void)bk_reloadTableViewWithBKCellSectionModel:(BKCellSectionModel *)sectionModel{
    if (sectionModel.section < self.sectionArray.count) {
        [self.sectionArray replaceObjectAtIndex:sectionModel.section withObject:sectionModel];
        [self reloadSections:[NSIndexSet indexSetWithIndex:sectionModel.section] withRowAnimation:UITableViewRowAnimationNone];
    }
}

- (void)bk_reloadTableViewWithBKCellModels:(NSArray<BKCellModel *> *)array{
    NSMutableArray *arr = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(BKCellModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.indexPath.section < self.sectionArray.count) {
            BKCellSectionModel *sectionModel = self.sectionArray[obj.indexPath.section];
            if (obj.indexPath.row < sectionModel.sectionRowArray.count) {
                [sectionModel.sectionRowArray replaceObjectAtIndex:obj.indexPath.row withObject:obj];
                [arr addObject:obj.indexPath];
            }
        }
    }];
    
    [self reloadRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationNone];
}

- (NSMutableArray<BKCellSectionModel *> *)sectionArray{
    if (!_sectionArray) {
        _sectionArray = [[NSMutableArray alloc] init];
    }
    
    return _sectionArray;
}

@end
