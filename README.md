# ZYShareView
- 应用中常见的分享/功能菜单面板, 高仿微信:-)

![](https://raw.githubusercontent.com/zzyspace/ZYShareView/master/ZYShareViewDemo/share.jpg)

## Usage

### Basic Usage

> 只需简单的2步即可快速集成此控件

#### 1.创建代表每个按钮的模型

```Objective-C
// 根据需要创建多个item
ZYShareItem *item0 = [ZYShareItem itemWithTitle:@"发送给朋友"
                                               icon:@"Action_Share"
                                            handler:^{ [weakSelf itemAction:@"点击了发送给朋友"]; }];
...
```

#### 2.创建shareView并弹出

```Objective-C
ZYShareView *shareView = [ZYShareView shareViewWithShareItems:@[item0, item1, item2, item3, item4, item5]
                                                functionItems:@[item6, item7, item8, item9]];
[shareView show];
```

### Advanced Usage

#### 1.可以根据自己的需求在`ZYShareViewDefine.h`文件中对UI进行调整

```Objective-C
#define ZY_CancelButtonHeight       49.f    // 取消按钮的高度

#define ZY_ItemCellHeight           123.f   // 每个item的高度
#define ZY_ItemCellWidth            70.f    // 每个item的宽度
#define ZY_ItemCellPadding          15.f    // item之间的距离

#define ZY_AnimateDuration          0.3     // 动画时间
#define ZY_DimBackgroundAlpha       0.3     // 半透明背景的alpha值
```

## Requirements

- iOS 7.0+
- Xcode 5.0+

## Installation

1.手动添加:
- 将ZYShareView文件夹中拖拽到项目中
- 导入头文件：`#import "ZYShareView.h"`

## License

ZYShareView is released under the MIT license. See LICENSE for details.
