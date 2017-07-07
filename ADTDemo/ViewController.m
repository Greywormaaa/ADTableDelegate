//
//  ViewController.m
//  ADTDemo
//
//  Created by 马乾征 on 2017/7/2.
//  Copyright © 2017年 maqz. All rights reserved.
//
//  ADTableDelegate简单使用demo
//

#import "ViewController.h"
#import "ADTableDelegate.h"
#import "ADCellModel.h"
#import "ADTableCell.h"
#import "ADTableHeaderFooterView.h"

#pragma mark - 测试cell
#pragma mark -
@interface TestCell : ADTableCell

@end
@implementation TestCell
{
    UILabel *_centerLab;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    _centerLab = [[UILabel alloc] init];
    _centerLab.textColor = [UIColor redColor];
    _centerLab.font = [UIFont systemFontOfSize:18];
    _centerLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_centerLab];
    
    _centerLab.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *centerLabCenterXConstraint = [NSLayoutConstraint constraintWithItem:_centerLab attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerLabCenterYConstraint = [NSLayoutConstraint constraintWithItem:_centerLab attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.contentView addConstraints:@[centerLabCenterXConstraint, centerLabCenterYConstraint]];
}

- (void)fillData:(id)data {
    if (!data) {
        return;
    }
    _centerLab.text = data;
}

+ (CGFloat)computeHeight:(id)data {
    return 66;
}

@end

#pragma mark - 试图控制器
#pragma mark -

@interface ViewController ()
@property (nonatomic, strong)UITableView *table;
@property (nonatomic, strong)ADTableDelegate *tableDelegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeComponent];
}

- (void)initializeComponent {
    
    _tableDelegate = [[ADTableDelegate alloc] initWithResponder:self];
    _tableDelegate.sectionArray = [self dataSource];
    
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
    _table.delegate  = _tableDelegate;
    _table.dataSource = _tableDelegate;
    [self.view addSubview:_table];
}

- (NSArray <ADSectionModel *>*)dataSource {
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 13; i++) {
        ADCellModel *cm = [[ADCellModel alloc] init];
        cm.className = NSStringFromClass([TestCell class]);
        cm.heignt = [TestCell computeHeight:nil];
        cm.data = @"点我点我";
        cm.selectorString = @"touchMe:";
        [arr addObject:cm];
    }
    
    ADSectionModel *sm = [[ADSectionModel alloc] init];
    sm.headerHeight = 10;
    sm.footerHeight = 20;
    sm.cellModels = arr.copy;
    return @[sm];
}

- (void)touchMe:(NSIndexPath *)indexPath {
    NSLog(@"touch index path : %@", indexPath);
}
@end













