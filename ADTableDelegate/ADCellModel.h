//
//  ADCellModel.h
//  ADCommonDemo
//
//  Created by 马乾征 on 2017/6/19.
//  Copyright © 2017年 maqz. All rights reserved.
//
#import <UIKit/UIKit.h>

/**
    目前只支持 Table view
 */
@interface ADCellModel : NSObject
@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) id data;
@property (nonatomic, weak  ) id delegate;
@property (nonatomic, strong) NSString *selectorString;
@property (nonatomic, assign) CGFloat heignt;
@end

@interface ADSectionModel : NSObject
@property (nonatomic, strong) NSString *headerClassName;
@property (nonatomic, strong) NSString *headerIdentifier;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, weak  ) id headerDelegate;
@property (nonatomic, strong) id headerData;

@property (nonatomic, strong) NSString *footerClassName;
@property (nonatomic, strong) NSString *footerIdentifier;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, weak  ) id footerDelegate;
@property (nonatomic, strong) id footerData;

@property (nonatomic, strong) NSArray <ADCellModel *> *cellModels;
@end
