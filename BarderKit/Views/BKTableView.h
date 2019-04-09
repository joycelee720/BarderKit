//
//  BKTableView.h
//  BarderKit
//
//  Created by Joyce on 2019/3/16.
//  Copyright © 2019 Poet. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BKCellType) {
    BKCellType_userInfo = 1, //用户信息cell
    BKCellType_normal,       //普通cell
    BKCellType_loginOut,     //登出cell
    BKCellType_rightImage,   //右侧ImageView
};

@class BKCellModel;

@interface BKCellSectionModel : NSObject

/**
 section的header高度
 */
@property (nonatomic, assign) NSInteger sectionHeaderHeight;
/**
 section的footer高度
 */
@property (nonatomic, assign) NSInteger sectionFooterHeight;
/**
 section的row数组
 */
@property (nonatomic, strong) NSMutableArray <BKCellModel *> *sectionRowArray;
/**
 section的index， 必填
 */
@property (nonatomic, assign) NSInteger section;

@end

@interface BKCellModel : NSObject
/**
 cell的indexPath，必要，手动赋值
 */
@property (nonatomic, strong) NSIndexPath *indexPath;
/**
 cell的跳转类名，可选
 */
@property (nonatomic, copy) NSString *pushClassName;
/**
 cell的类型，必要，手动赋值
 */
@property (nonatomic, assign) BKCellType cellType;
/**
 cell的高度，设置cellType时会设置默认高度。如需自定义高度，设置cellType完成后再赋值
 */
@property (nonatomic, assign) CGFloat cellHeight;
/**
 本地图片名，需自定义，无默认值。为nil则不显示图片
 */
@property (nonatomic, copy) NSString *imageName;
/**
 标题，需自定义，无默认值，为nil则不显示标题
 */
@property (nonatomic, copy) NSString *title;
/**
 副标题，需自定义，无默认值，为nil则不显示副标题。
 BKCellType_userInfo时在标题下方，BKCellType_normal时在右侧，BKCellType_loginOut无右标题
 */
@property (nonatomic, copy) NSString *subTitle;
/**
 是否有右侧arrow，默认YES。BKCellType_loginOut无。可自定义
 */
@property (nonatomic, assign) BOOL hasArrow;
/**
 icon image
 */
@property (nonatomic, strong) UIImage *headerImage;

@end

typedef void(^SelectedRow)(BKCellModel *rowModel);

NS_ASSUME_NONNULL_BEGIN

@interface BKTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

/**
 初始化方法
 */
+ (instancetype)bk_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(NSArray <BKCellSectionModel *> *)dataSource;

/**
 tableView列表的内容，
 */
@property (nonatomic, strong) NSMutableArray <BKCellSectionModel *> *sectionArray;
/**
 用户头像，用来加载网络地址
 */
@property (nonatomic, strong) UIImageView *userHeaderView;
/**
 刷新方法
 先设置sectionArray后再执行该方法
 */
- (void)bk_reloadTableView;
- (void)bk_reloadTableViewWithBKCellSectionModel:(BKCellSectionModel *)sectionModel;
- (void)bk_reloadTableViewWithBKCellModels:(NSArray <BKCellModel *>*)array;

/**
 选择cell的回调方法
 */
- (void)bk_addSelectedRowBlock:(SelectedRow)selectedRowBlock;

@end

NS_ASSUME_NONNULL_END
