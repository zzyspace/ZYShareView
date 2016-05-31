//
//  ZYShareView.h
//  
//
//  Created by ZZY on 16/3/28.
//
//

#import <UIKit/UIKit.h>
#import "ZYShareItem.h"

@interface ZYShareView : UIView

/** 顶部标题Label, 默认内容为"分享" */
@property (nonatomic, readonly) UILabel *titleLabel;

/** 底部取消Button, 默认标题为"取消" */
@property (nonatomic, readonly) UIButton *cancelButton;

/**
 *  创建常规shareView
 *
 *  @param shareArray    分享item数组 (元素须为`ZYShareItem`)
 *  @param functionArray 功能item数组 (元素须为`ZYShareItem`)
 */
+ (instancetype)shareViewWithShareItems:(NSArray *)shareArray
                          functionItems:(NSArray *)functionArray;
- (instancetype)initWithShareItems:(NSArray *)shareArray
                     functionItems:(NSArray *)functionArray;

/**
 *  创建具有n行的shareView
 *
 *  @param array 二维数组 (eg: @[shareArray, functionArray, otherItemsArray, ...])
 */
- (instancetype)initWithItemsArray:(NSArray *)array;

/**
 *  显示\隐藏
 */
- (void)show;
- (void)hide;

@end