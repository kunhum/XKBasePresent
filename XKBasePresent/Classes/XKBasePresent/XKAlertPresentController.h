//
//  XKAlertContainerController.h
//  TestDemo
//
//  Created by Nicholas on 2018/3/27.
//  Copyright © 2018年 nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XKAlertPresentController : UIPresentationController

///default is UIBlurEffectStyleDark
@property (nonatomic, assign) UIBlurEffectStyle effectStyle;

///必须指定
@property (nonatomic, assign) CGRect frameOfPresentedView;

///弹框即将显示时执行所需要的操作
@property (nonatomic, copy) void(^xk_presentationTransitionWillBegin)(void);

///弹框显示完毕时执行所需要的操作
@property (nonatomic, copy) void(^xk_presentationTransitionDidEnd)(void);

///弹框即将消失时执行所需要的操作
@property (nonatomic, copy) void(^xk_dismissalTransitionWillBegin)(void);

///弹框消失之后执行所需要的操作
@property (nonatomic, copy) void(^xk_dismissalTransitionDidEnd)(void);

@end
