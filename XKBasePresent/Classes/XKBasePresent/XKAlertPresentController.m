//
//  XKAlertContainerController.m
//  TestDemo
//
//  Created by Nicholas on 2018/3/27.
//  Copyright © 2018年 nicholas. All rights reserved.
//

#import "XKAlertPresentController.h"
//#import <Masonry.h>

@interface XKAlertPresentController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIVisualEffectView *visualView;

@end

@implementation XKAlertPresentController

#pragma mark 初始化
- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]) {
        
        self.effectStyle          = UIBlurEffectStyleDark;
        self.frameOfPresentedView = [UIApplication sharedApplication].keyWindow.bounds;
        
    }
    return self;
}

#pragma mark 决定了弹出框的frame
- (CGRect)frameOfPresentedViewInContainerView {
    
    return self.frameOfPresentedView;
}

#pragma mark 重写此方法可以在弹框即将显示时执行所需要的操作
- (void)presentationTransitionWillBegin {
    [super presentationTransitionWillBegin];
    
    self.bgView = [UIView new];
    self.bgView.frame = self.containerView.bounds;
    self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
//    self.visualView.frame = self.containerView.bounds;
//    [self.containerView addSubview:self.visualView];
    [self.containerView addSubview:self.bgView];
    
    [UIView animateWithDuration:0.5 animations:^{
//        self.visualView.alpha = 0.4;
        self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }];
    
    if (self.xk_presentationTransitionWillBegin) {
        self.xk_presentationTransitionWillBegin();
    }
}

#pragma mark 重写此方法可以在弹框显示完毕时执行所需要的操作
- (void)presentationTransitionDidEnd:(BOOL)completed {
    [super presentationTransitionDidEnd:completed];
    
    if (self.xk_presentationTransitionDidEnd) {
        self.xk_presentationTransitionDidEnd();
    }
}

#pragma mark 重写此方法可以在弹框即将消失时执行所需要的操作
- (void)dismissalTransitionWillBegin {
    [super dismissalTransitionWillBegin];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];;
    }];
    
    if (self.xk_dismissalTransitionWillBegin) {
        self.xk_dismissalTransitionWillBegin();
    }
    
}

#pragma mark 重写此方法可以在弹框消失之后执行所需要的操作
- (void)dismissalTransitionDidEnd:(BOOL)completed {
    [super dismissalTransitionDidEnd:completed];
    
    if (self.xk_dismissalTransitionDidEnd) {
        self.xk_dismissalTransitionDidEnd();
    }
}

#pragma mark - 公共方法
- (void)setEffectStyle:(UIBlurEffectStyle)effectStyle {
    _effectStyle = effectStyle;
    self.visualView.effect = [UIBlurEffect effectWithStyle:effectStyle];;
}

#pragma mark - 懒加载
- (UIVisualEffectView *)visualView {
    if (!_visualView) {
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:self.effectStyle];
        _visualView                 = [[UIVisualEffectView alloc] initWithEffect:effect];
        _visualView.backgroundColor = [UIColor blackColor];
        _visualView.alpha           = 0.0;
        
    }
    return _visualView;
}
@end
