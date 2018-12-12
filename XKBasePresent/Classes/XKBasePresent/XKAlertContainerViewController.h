//
//  XKAlertContainerViewController.h
//  TestDemo
//
//  Created by Nicholas on 2018/3/27.
//  Copyright © 2018年 nicholas. All rights reserved.
//
//  弹窗控制器继承此控制器

#import <UIKit/UIKit.h>
//#import "XKBaseViewController.h"

@interface XKAlertContainerViewController : UIViewController

///default is UIBlurEffectStyleDark
@property (nonatomic, assign) UIBlurEffectStyle effectStyle;

///default is keywindows.frame
@property (nonatomic, assign) CGRect frameOfPresentedView;

@property (nonatomic, strong) IBOutlet UIView *contentView;

///遮罩的透明度，默认0.5
@property (nonatomic, assign) CGFloat maskViewAlpha;

@end
