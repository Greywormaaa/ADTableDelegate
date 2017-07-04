//
//  ADTableDelegate.h
//  ADTableDelegate
//
//  Created by 马乾征 on 2017/7/2.
//  Copyright © 2017年 maqz. All rights reserved.
//
//  简化对 Table view 代理的处理
//
//  注意 : 使用该类的对象，TableView 的 cell 必须继承自 ADTableCell，headerFooterView 必须继承自ADTableHeaderFooterrView
//
#import <UIKit/UIKit.h>
#import "ADCellModel.h"
#import "ADTableCell.h"
#import "ADTableHeaderFooterView.h"

@interface ADTableDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>
// 整个Table view的数据源
@property (nonatomic, strong)NSArray <ADSectionModel *>*sectionArray;

- (instancetype)initWithResponder:(id)responder;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end
