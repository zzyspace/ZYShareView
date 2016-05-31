//
//  ViewController.m
//  ZYShareViewDemo
//
//  Created by ZZY on 16/3/29.
//  Copyright (c) 2016年 tongbu. All rights reserved.
//

#import "ViewController.h"
#import "ZYShareView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)shareAction
{
    __weak typeof(self) weakSelf = self;
    
    // 创建代表每个按钮的模型
    ZYShareItem *item0 = [ZYShareItem itemWithTitle:@"发送给朋友"
                                               icon:@"Action_Share"
                                            handler:^{ [weakSelf itemAction:@"点击了发送给朋友"]; }];
    
    ZYShareItem *item1 = [ZYShareItem itemWithTitle:@"分享到朋友圈"
                                               icon:@"Action_Moments"
                                            handler:^{ [weakSelf itemAction:@"点击了分享到朋友圈"]; }];
    
    ZYShareItem *item2 = [ZYShareItem itemWithTitle:@"收藏"
                                               icon:@"Action_MyFavAdd"
                                            handler:^{ [weakSelf itemAction:@"点击了收藏"]; }];
    
    ZYShareItem *item3 = [ZYShareItem itemWithTitle:@"QQ空间"
                                               icon:@"Action_qzone"
                                            handler:^{ [weakSelf itemAction:@"点击了QQ空间"]; }];
    
    ZYShareItem *item4 = [ZYShareItem itemWithTitle:@"QQ"
                                               icon:@"Action_QQ"
                                            handler:^{ [weakSelf itemAction:@"点击了QQ"]; }];
    
    ZYShareItem *item5 = [ZYShareItem itemWithTitle:@"Facebook"
                                               icon:@"Action_facebook"
                                            handler:^{ [weakSelf itemAction:@"点击了Facebook"]; }];
    
    ZYShareItem *item6 = [ZYShareItem itemWithTitle:@"查看公众号"
                                               icon:@"Action_Verified"
                                            handler:^{ [weakSelf itemAction:@"点击了查看公众号"]; }];
    
    ZYShareItem *item7 = [ZYShareItem itemWithTitle:@"复制链接"
                                               icon:@"Action_Copy"
                                            handler:^{ [weakSelf itemAction:@"点击了复制链接"]; }];
    
    ZYShareItem *item8 = [ZYShareItem itemWithTitle:@"调整字体"
                                               icon:@"Action_Font"
                                            handler:^{ [weakSelf itemAction:@"点击了调整字体"]; }];
    
    ZYShareItem *item9 = [ZYShareItem itemWithTitle:@"刷新"
                                               icon:@"Action_Refresh"
                                            handler:^{ [weakSelf itemAction:@"点击了刷新"]; }];
    
    NSArray *shareItemsArray = @[item0, item1, item2, item3, item4, item5];
    NSArray *functionItemsArray = @[item6, item7, item8, item9];
    
    // 创建shareView
    ZYShareView *shareView = [ZYShareView shareViewWithShareItems:shareItemsArray
                                                    functionItems:functionItemsArray];
    // 弹出shareView
    [shareView show];
    
    /*
    // OR
    ZYShareView *shareView = [[ZYShareView alloc] initWithItemsArray:@[shareItemsArray, functionItemsArray]];
    [shareView show];
     */
}


#pragma mark -

- (void)itemAction:(NSString *)title
{
    NSLog(@"%@", title);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // 白色导航栏
    return UIStatusBarStyleLightContent;
}

@end
