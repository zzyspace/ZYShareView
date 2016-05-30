//
//  ZYShareItem.m
//  
//
//  Created by ZZY on 16/3/28.
//
//

#import "ZYShareItem.h"

@implementation ZYShareItem

+ (instancetype)itemWithTitle:(NSString *)title
                         icon:(NSString *)icon
                     handler:(void (^)())handler
{
    ZYShareItem *item = [[ZYShareItem alloc] init];
    item.title = title;
    item.icon = icon;
    item.selectionHandler = handler;
    
    return item;
}

@end
