//
//  ADTableDelegate.m
//  ADTableDelegate
//
//  Created by 马乾征 on 2017/7/2.
//  Copyright © 2017年 maqz. All rights reserved.
//

#import "ADTableDelegate.h"
#import "ADCellModel.h"
#import "ADTableCell.h"
#import "ADTableHeaderFooterView.h"

@interface ADTableDelegate ()
@property (nonatomic, weak)id responder;
@end

@implementation ADTableDelegate

- (instancetype)initWithResponder:(id)responder
{
    self = [super init];
    if (self) {
        _responder = responder;
        _sectionArray = [NSArray array];
    }
    return self;
}

#pragma maek - table delegate

// data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ADSectionModel *sm = _sectionArray[section];
    return sm.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ADSectionModel *sm = _sectionArray[indexPath.section];
    ADCellModel *cm = sm.cellModels[indexPath.row];
    
    ADTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cm.identifier];
    if (!cell) {
        cell = [[NSClassFromString(cm.className) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cm.identifier];
        cell.delegate = cm.delegate;
    }
    return cell;
}

// delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ADSectionModel *sm = _sectionArray[section];
    ADTableHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sm.headerIdentifier];
    if (!headerView) {
        headerView = [[NSClassFromString(sm.headerClassName) alloc] init];
        headerView.delegate = sm.headerDelegate;
    }
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    ADSectionModel *sm = _sectionArray[section];
    ADTableHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sm.footerIdentifier];
    if (!footerView) {
        footerView = [[NSClassFromString(sm.footerClassName) alloc] init];
        footerView.delegate = sm.footerDelegate;
    }
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    ADSectionModel *sm = _sectionArray[section];
    return sm.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    ADSectionModel *sm = _sectionArray[section];
    return sm.footerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ADSectionModel *sm = _sectionArray[indexPath.section];
    ADCellModel *cm = sm.cellModels[indexPath.row];
    return cm.heignt;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    ADSectionModel *sm = _sectionArray[section];
    ADTableHeaderFooterView *headerView = (ADTableHeaderFooterView *)view;
    [headerView fillData:sm.headerData];
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    ADSectionModel *sm = _sectionArray[section];
    ADTableHeaderFooterView *footerView = (ADTableHeaderFooterView *)view;
    [footerView fillData:sm.footerData];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    ADSectionModel *sm = _sectionArray[indexPath.section];
    ADCellModel *cm = sm.cellModels[indexPath.section];
    ADTableCell *tableCell = (ADTableCell *)cell;
    [tableCell fillData:cm.data];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ADSectionModel *sm = _sectionArray[indexPath.section];
    ADCellModel *cm = sm.cellModels[indexPath.section];
    SEL selector = NSSelectorFromString(cm.selectorString);
    if ([_responder respondsToSelector:selector]) {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [_responder performSelector:selector withObject:indexPath];
        #pragma clang diagnostic pop
        
    }
}

@end
