//
//  ADTableHeaderFooterView.h
//  ADCommonDemo
//
//  Created by 马乾征 on 2017/6/19.
//  Copyright © 2017年 maqz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADTableHeaderFooterView : UITableViewHeaderFooterView
@property (nonatomic, weak)id delegate;
/**
 *  填充数据，子类实现
 */
- (void)fillData:(id)data;
/**
 *  计算视图高度，子类实现
 */
+ (CGFloat)computeHeight:(id)data;
@end
