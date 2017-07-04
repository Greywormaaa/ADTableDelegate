//
//  ADTableCell.h
//  ADCommonDemo
//
//  Created by 马乾征 on 2017/6/19.
//  Copyright © 2017年 maqz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADTableCell : UITableViewCell
@property (nonatomic, weak)id delegate;
- (void)fillData:(id)data;
+ (CGFloat)computeHeight:(id)data;
@end
