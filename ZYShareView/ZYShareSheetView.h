//
//  ZYShareSheetView.h
//  
//
//  Created by ZZY on 16/3/28.
//
//

#import <UIKit/UIKit.h>

@interface ZYShareSheetView : UIToolbar

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *cancelButton;

//@property (nonatomic, strong) NSArray *shareArray;
//@property (nonatomic, strong) NSArray *functionArray;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, copy) void (^cancelBlock)();

- (CGFloat)shareSheetHeight;
- (CGFloat)initialHeight;

@end
