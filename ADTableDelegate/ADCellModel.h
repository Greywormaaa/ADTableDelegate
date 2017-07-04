//
//  ADCellModel.h
//  ADCommonDemo
//
//  Created by 马乾征 on 2017/6/19.
//  Copyright © 2017年 maqz. All rights reserved.
//
#import <UIKit/UIKit.h>


#pragma mark - cell model
#pragma mark -
/**
 *  只支持 Table view
 *  cell 对应model
 */
@interface ADCellModel : NSObject

/**
 *  对应cell类名
 */
@property (nonatomic, strong) NSString *className;
/**
 *  对应cell注册id
 */
@property (nonatomic, strong) NSString *identifier;
/**
 *  对应cell填充的数据
 */
@property (nonatomic, strong) id data;
/**
 *  对应cell代理
 */
@property (nonatomic, weak  ) id delegate;
/**
 *  对应cell选中事件，方法参数默认为当前cell的indexPath
 */
@property (nonatomic, strong) NSString *selectorString;
/**
 *  对应cell高度
 */
@property (nonatomic, assign) CGFloat heignt;
@end

#pragma mark - section model
#pragma mark -
/**
 *  section 对应model
 */
@interface ADSectionModel : NSObject

/**
 *  对应section头类名
 */
@property (nonatomic, strong) NSString *headerClassName;
/**
 *  对应section头注册id
 */
@property (nonatomic, strong) NSString *headerIdentifier;
/**
 *  对应section头高度
 */
@property (nonatomic, assign) CGFloat headerHeight;
/**
 *  对应section头代理
 */
@property (nonatomic, weak  ) id headerDelegate;
/**
 *  对应section头填充数据
 */
@property (nonatomic, strong) id headerData;

/**
 *  对应section尾类名
 */
@property (nonatomic, strong) NSString *footerClassName;
/**
 *  对应section尾注册id
 */
@property (nonatomic, strong) NSString *footerIdentifier;
/**
 *  对应section尾高度
 */
@property (nonatomic, assign) CGFloat footerHeight;
/**
 *  对应section尾代理
 */
@property (nonatomic, weak  ) id footerDelegate;
/**
 *  对应section尾填充数据
 */
@property (nonatomic, strong) id footerData;
/**
 *  对应section所有的cellModel
 */
@property (nonatomic, strong) NSArray <ADCellModel *> *cellModels;

@end




