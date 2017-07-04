//
//  GLToastTipView.h
//  Carekettle
//
//  Created by lamkhun on 2017/3/15.
//  Copyright © 2017年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LKToastTipViewHUDStyle) {
    /**  头部  */
    LKToastTipViewHUDStyleTop,
    /**  中心  */
    LKToastTipViewHUDStyleCenter,
    /**  底部  */
    LKToastTipViewHUDStyleBottom
};

@interface LKToastTipView : UIView

/**  提示内容  */
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

+ (LKToastTipView *)toastTipViewWithInView:(UIView *)inView HUDStyle:(LKToastTipViewHUDStyle)style content:(NSString *)content;

@end
