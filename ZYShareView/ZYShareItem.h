//
//  ZYShareItem.h
//  
//
//  Created by ZZY on 16/3/28.
//
//

#import <Foundation/Foundation.h>

@interface ZYShareItem : NSObject

@property (nonatomic, copy) NSString *icon;             /**< 图标名称 */
@property (nonatomic, copy) NSString *title;            /**< 标题 */
@property (nonatomic, copy) void (^selectionHandler)(); /**< 点击后的事件处理 */

/**
 *  快速创建方法
 */
+ (instancetype)itemWithTitle:(NSString *)title
                         icon:(NSString *)icon
                      handler:(void (^)())handler;

@end
