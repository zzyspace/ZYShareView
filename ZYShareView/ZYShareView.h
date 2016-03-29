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

/** 顶部标题, 默认为"分享" */
@property (nonatomic, copy) NSString *title;

/** 取消按钮标题, 默认为"取消" */
@property (nonatomic, copy) NSString *cancelButtonTitle;

/**
 *  创建shareView
 *
 *  @param shareArray    分享item数组 (元素须为`ZYShareItem`)
 *  @param functionArray 功能item数组 (元素须为`ZYShareItem`)
 */
+ (instancetype)shareViewWithShareItems:(NSArray *)shareArray
                          functionItems:(NSArray *)functionArray;
- (instancetype)initWithShareItems:(NSArray *)shareArray
                     functionItems:(NSArray *)functionArray;

- (void)show;
- (void)hide;

@end