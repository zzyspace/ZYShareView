//
//  ZYShareView.m
//  
//
//  Created by ZZY on 16/3/28.
//
//

#import "ZYShareView.h"
#import "ZYShareSheetView.h"
#import "ZYShareViewDefine.h"

@interface ZYShareView ()

@property (nonatomic, strong) ZYShareSheetView *shareSheetView; /**< 分享面板 */
@property (nonatomic, strong) UIView *dimBackgroundView;        /**< 半透明黑色背景 */

@property (nonatomic, strong) UIWindow *window;

@end

@implementation ZYShareView

+ (instancetype)shareViewWithShareItems:(NSArray *)shareArray
                          functionItems:(NSArray *)functionArray
{
    ZYShareView *shareView = [[self alloc] initWithShareItems:shareArray functionItems:functionArray];
    
    return shareView;
}

- (instancetype)initWithShareItems:(NSArray *)shareArray
                     functionItems:(NSArray *)functionArray
{
    NSMutableArray *itemsArrayM = [NSMutableArray array];
    
    if (shareArray.count) [itemsArrayM addObject:shareArray];
    if (functionArray.count) [itemsArrayM addObject:functionArray];
    
    return [self initWithItemsArray:[itemsArrayM copy]];
}

- (instancetype)initWithItemsArray:(NSArray *)array
{
    if (self = [super init]) {
        [self.shareSheetView.dataArray addObjectsFromArray:array];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.frame = CGRectMake(0, 0, ZY_ScreenWidth, ZY_ScreenHeight);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hide) name:ZY_HideNotification object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - public method

- (void)show
{
    [self addToKeyWindow];
    [self showAnimationWithCompletion:nil];
}

- (void)hide
{
    [self hideAnimationWithCompletion:^(BOOL finished) {
        [self removeFromKeyWindow];
    }];
}

#pragma mark - private method

- (void)addToKeyWindow
{
    if (!self.superview) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        [keyWindow addSubview:self];
        
        [self addSubview:self.dimBackgroundView];
        [self addSubview:self.shareSheetView];
    }
}

- (void)removeFromKeyWindow
{
    if (self.superview) {
        [self removeFromSuperview];
    }
}

- (void)showAnimationWithCompletion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:ZY_AnimateDuration animations:^{
        self.dimBackgroundView.alpha = ZY_DimBackgroundAlpha;
        
        CGRect frame = self.shareSheetView.frame;
        frame.origin.y = ZY_ScreenHeight - self.shareSheetView.shareSheetHeight;
        self.shareSheetView.frame = frame;
    } completion:completion];
}

- (void)hideAnimationWithCompletion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:ZY_AnimateDuration animations:^{
        self.dimBackgroundView.alpha = 0;
        
        CGRect frame = self.shareSheetView.frame;
        frame.origin.y = ZY_ScreenHeight;
        self.shareSheetView.frame = frame;
    } completion:completion];
}

#pragma mark - getter

- (ZYShareSheetView *)shareSheetView
{
    if (!_shareSheetView) {
        _shareSheetView = [[ZYShareSheetView alloc] init];
        _shareSheetView.frame = CGRectMake(0, ZY_ScreenHeight, ZY_ScreenWidth, _shareSheetView.initialHeight);
        __weak typeof(self) weakSelf = self;
        _shareSheetView.cancelBlock = ^{
            [weakSelf hide];
        };
    }
    return _shareSheetView;
}

- (UIView *)dimBackgroundView
{
    if (!_dimBackgroundView) {
        _dimBackgroundView = [[UIView alloc] init];
        _dimBackgroundView.frame = CGRectMake(0, 0, ZY_ScreenWidth, ZY_ScreenHeight);
        _dimBackgroundView.backgroundColor = [UIColor blackColor];
        _dimBackgroundView.alpha = 0;
        
        // 添加手势监听
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [_dimBackgroundView addGestureRecognizer:tap];
    }
    return _dimBackgroundView;
}

- (UILabel *)titleLabel
{
    return self.shareSheetView.titleLabel;
}

- (UIButton *)cancelButton
{
    return self.shareSheetView.cancelButton;
}

@end
