//
//  ZYShareItemCell.h
//  
//
//  Created by ZZY on 16/3/28.
//
//

#import <UIKit/UIKit.h>
#import "ZYShareItem.h"

static NSString *zy_share_item_cell_id = @"ZYShareItemCell";

@interface ZYShareItemCell : UICollectionViewCell

@property (nonatomic, strong) ZYShareItem *item;

@end
