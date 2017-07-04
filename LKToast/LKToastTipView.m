//
//  GLToastTipView.m
//  Carekettle
//
//  Created by lamkhun on 2017/3/15.
//  Copyright © 2017年 Gavin. All rights reserved.
//


#import "AppDelegate.h"
#import "NSString+StringFrame.h"
#import "UIView+Utils.h"
#import "LKToastTipView.h"

@implementation LKToastTipView

+ (LKToastTipView *)toastTipViewWithInView:(UIView *)inView HUDStyle:(LKToastTipViewHUDStyle)style content:(NSString *)content {
    if (inView == nil) {
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        inView = appDelegate.window;
    }
    
    //创建toast
    LKToastTipView *infoView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LKToastTipView class]) owner:nil options:nil] lastObject];
    infoView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    infoView.contentLabel.text = content;
    infoView.hidden = true;
    infoView.layer.masksToBounds = true;
    infoView.layer.cornerRadius = 4.0;
    CGFloat infoViewY = -infoView.height;
    if (style == LKToastTipViewHUDStyleBottom) {
        infoViewY = inView.bottom + infoView.height;
    }else if (style == LKToastTipViewHUDStyleCenter) {
//        infoView.top = -infoView.height;
    }else{
//        infoView.top = -infoView.height;
    }
    //update toast UI
    CGSize contentSize = [infoView.contentLabel.text boundingRectWithSizeMinHeight:44.0 font:18.0 maxWidth:inView.width - 8.0];
    CGFloat infoViewWidth = contentSize.width + 48.0 > inView.width - 8.0 ? contentSize.width : contentSize.width + 48.0;
    infoView.frame = CGRectMake((inView.width - infoViewWidth)/2.0, infoViewY, infoViewWidth, contentSize.height);
    [inView addSubview:infoView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (style == LKToastTipViewHUDStyleBottom) {
            [infoView showStyleTopWithAnimation:false inView:inView HUDStyle:style];
        }else if (style == LKToastTipViewHUDStyleCenter) {
            [infoView showStyleTopWithAnimation:false inView:inView HUDStyle:style];
        }else{
            [infoView showStyleTopWithAnimation:true inView:inView HUDStyle:style];
        }
    });
    
    [infoView layoutIfNeeded];

    if ([inView isKindOfClass:[UIWindow class]]) {
        [inView addSubview:infoView];
    }else if ([inView isKindOfClass:[UIView class]]) {
        [inView.window addSubview:infoView];
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self displayDurationForString:infoView.contentLabel.text] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (style == LKToastTipViewHUDStyleBottom) {
            [infoView hideToastTipViewWithAnimation:false inView:inView HUDStyle:style];
        }else if (style == LKToastTipViewHUDStyleCenter) {
            [infoView hideToastTipViewWithAnimation:false inView:inView HUDStyle:style];
        }else{
            [infoView hideToastTipViewWithAnimation:true inView:inView HUDStyle:style];
        }
    });

    return infoView;
}

- (void)showStyleTopWithAnimation:(BOOL)animation inView:(UIView *)inView HUDStyle:(LKToastTipViewHUDStyle)style {
    CGFloat top = 0.0;
    if ([inView isKindOfClass:[UIWindow class]] || inView == nil) {
        if (style == LKToastTipViewHUDStyleBottom) {
            top += inView.bottom - self.height -20.0;
        }else if (style == LKToastTipViewHUDStyleCenter) {
            top += inView.height *0.5;
        }else{
            top += self.height + 20.0;
        }
    }else if ([inView isKindOfClass:[UIView class]]) {
        if (style == LKToastTipViewHUDStyleBottom) {
            top += inView.bottom - self.height -20.0;
        }else if (style == LKToastTipViewHUDStyleCenter) {
            top += inView.height *0.5;
        }else{
            if (inView.top == 0) {
                top += 20.0;
            }else{
                top += self.height + 20.0;
            }
        }
    }

    if (animation) {
        self.hidden = false;
        [UIView animateWithDuration:0.30f animations:^{
            self.top = top;
        }completion:^(BOOL finished) {
        }];
    }else{
        self.top = top;
        self.hidden = false;
    }
}

+ (NSTimeInterval)displayDurationForString:(NSString*)string {
    if (string.length*0.2 > 4.0) {
        return 4.0;
    }else if (string.length*0.2 < 2.0) {
        return 2.0;
    }else{
        return string.length*0.2;
    }
}

- (void)hideToastTipViewWithAnimation:(BOOL)animation inView:(UIView *)inView HUDStyle:(LKToastTipViewHUDStyle)style {
    CGFloat top = 0.0;
    if (style == LKToastTipViewHUDStyleBottom) {
        top = inView.bottom + self.height;
    }else if (style == LKToastTipViewHUDStyleCenter) {
        top = -self.height;
    }else{
        top = -self.height;
    }
    
    if (animation) {
        [UIView animateWithDuration:0.10 animations:^{
            self.top = top;
            self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.0];
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }else{
        self.top = top;
        [self removeFromSuperview];
    }
}


@end
