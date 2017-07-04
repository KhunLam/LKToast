//
//  ViewController.m
//  LKToast
//
//  Created by lamkhun on 2017/7/4.
//  Copyright © 2017年 lamkhun. All rights reserved.
//
#import "LKToastTipView.h"
#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)topClick:(UIButton *)sender {
    [LKToastTipView toastTipViewWithInView:self.view HUDStyle:LKToastTipViewHUDStyleTop content:@"TopTopTopTopTopTopTopTopTopTopTopTopTopTopTopTopTopTopTopTop"];
    
}

- (IBAction)zhongjianClick:(UIButton *)sender {
   [LKToastTipView toastTipViewWithInView:self.view HUDStyle:LKToastTipViewHUDStyleCenter content:@"CenterCenterCenterCenterCenterCenterCenterCenterCenterCenter"];
}

- (IBAction)bottomClick:(UIButton *)sender {
    [LKToastTipView toastTipViewWithInView:self.view HUDStyle:LKToastTipViewHUDStyleBottom content:@"BottomBottomBottomBottomBottomBottomBottomBottomBottomBottomBottom"];
}

@end
