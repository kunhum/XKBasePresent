//
//  XKAlertContainerViewController.m
//  TestDemo
//
//  Created by Nicholas on 2018/3/27.
//  Copyright © 2018年 nicholas. All rights reserved.
//

#import "XKAlertContainerViewController.h"
#import "XKAlertPresentController.h"

@interface XKAlertContainerViewController () <UIViewControllerTransitioningDelegate> {
    
    BOOL _hasStyle;
    BOOL _hasFrame;
}

@end

@implementation XKAlertContainerViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initAction];
    }
    return self;
    
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self initAction];
    }
    return self;
}
- (instancetype)init {
    if (self = [super init]) {
        [self initAction];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    
}

- (void)initAction {
    self.transitioningDelegate  = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.maskViewAlpha = 0.5;
}

- (void)setFrameOfPresentedView:(CGRect)frameOfPresentedView {
    _frameOfPresentedView = frameOfPresentedView;
    _hasFrame             = YES;
}

- (void)setEffectStyle:(UIBlurEffectStyle)effectStyle {
    _effectStyle = effectStyle;
    _hasStyle    = YES;
}

- (void)setMaskViewAlpha:(CGFloat)maskViewAlpha {
    _maskViewAlpha = maskViewAlpha;
    
}

#pragma mark UIViewControllerTransitioningDelegate
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    
    XKAlertPresentController *presentController = [[XKAlertPresentController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    
    presentController.maskViewAlpha = self.maskViewAlpha;
    
    if (_hasStyle) {
        presentController.effectStyle = self.effectStyle;
    }
    if (_hasFrame) {
        presentController.frameOfPresentedView = self.frameOfPresentedView;
    }
    
    return presentController;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.contentView == nil) {
        return;
    }
    UITouch *touch = touches.anyObject;
    CGPoint point  = [touch locationInView:self.view];
    if (CGRectContainsPoint(self.contentView.frame, point) == NO) {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
