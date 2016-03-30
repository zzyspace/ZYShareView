//
//  ZYShareItemCell.m
//  
//
//  Created by ZZY on 16/3/28.
//
//

#import "ZYShareItemCell.h"
#import "ZYShareViewDefine.h"

@interface ZYShareItemCell ()

@property (nonatomic, strong) UIButton *iconView;
@property (nonatomic, strong) UITextView *titleView;

@end

@implementation ZYShareItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    [self addSubview:self.iconView];
    [self addSubview:self.titleView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat topPadding = 15.f;
    CGFloat iconView2titleH = 10.f;
    CGFloat cellWidth = self.frame.size.width;
    CGFloat titleInset = 4;
    
    // 图标
    CGFloat iconViewX = ZY_ItemCellPadding / 2;
    CGFloat iconViewY = topPadding;
    CGFloat iconViewW = cellWidth - ZY_ItemCellPadding;
    CGFloat iconViewH = cellWidth - ZY_ItemCellPadding;
    self.iconView.frame = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    // 标题
    CGFloat titleViewX = -titleInset;
    CGFloat titleViewY = topPadding + iconViewH + iconView2titleH;
    CGFloat titleViewW = cellWidth + 2 * titleInset;
    CGFloat titleViewH = 30.f;
    self.titleView.frame = CGRectMake(titleViewX, titleViewY, titleViewW, titleViewH);
}

#pragma mark - Actions

- (void)iconClick
{
    if (self.item.selectionHandler) {
        [[NSNotificationCenter defaultCenter] postNotificationName:ZY_HideNotification object:nil];
        self.item.selectionHandler();
    }
}

#pragma mark - setter 

- (void)setItem:(ZYShareItem *)item
{
    _item = item;
    
    [self.iconView setImage:[UIImage imageNamed:item.icon] forState:UIControlStateNormal];
    self.titleView.text = item.title;
}

#pragma mark - getter

- (UIButton *)iconView
{
    if (!_iconView) {
        _iconView = [[UIButton alloc] init];
        [_iconView addTarget:self
                      action:@selector(iconClick)
            forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconView;
}

- (UITextView *)titleView
{
    if (!_titleView) {
        _titleView = [[UITextView alloc] init];
        _titleView.textColor = [UIColor darkGrayColor];
        _titleView.font = [UIFont systemFontOfSize:11];
        _titleView.contentInset = UIEdgeInsetsMake(-10, 0, 0, 0);
        _titleView.backgroundColor = nil;
        _titleView.textAlignment = NSTextAlignmentCenter;
        _titleView.userInteractionEnabled = NO;
    }
    return _titleView;
}

@end
