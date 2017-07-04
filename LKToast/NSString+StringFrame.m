//
//  UILabel+StringFrame.m
//  UIStudy_0926Ingredients
//
//
//


#import "NSString+StringFrame.h"

@implementation NSString (StringFrame)

/**
 *  @brief  根据字符串的宽和字体的大小计算字符串的size
 *  @param  size 给定字符串的宽或高
 *  @param  font 字体属性
 *  @return 字符串的宽和高
 */
- (CGSize)boundingRectWithSizeWidth:(CGFloat )width font:(CGFloat )fontNum; {
    UIFont * font = [UIFont systemFontOfSize:fontNum];
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize reSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                             options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return reSize;
}

/**
 *  计算字符串的宽度
 *
 *  @param font 字体大小
 *
 *  @return <#return value description#>
 */
- (CGSize )boundingRectWithFont:(CGFloat)font {
    CGSize size1 = CGSizeMake(9999, 35.);
    NSDictionary * attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    CGSize  a = [self boundingRectWithSize:size1 options:NSStringDrawingUsesDeviceMetrics attributes:attribute context:nil].size;
    return a;
}

/**
 *  @brief  根据字符串字体的大小(和最大宽度)计算字符串的size
 *  @param  size        给定字符串的(最小)高
 *  @param  font        字体属性
 *  @param  maxWidth    字符串最大的宽度
 *  @return 字符串的宽和高
 */
- (CGSize)boundingRectWithSizeMinHeight:(CGFloat )minHeight font:(CGFloat )fontNum maxWidth:(CGFloat)maxWidth {
    CGSize reSize = [self boundingRectWithFont:fontNum];
    if (reSize.width > maxWidth) {
        reSize = [self boundingRectWithSizeWidth:maxWidth font:fontNum];
    }else{
        reSize = [self boundingRectWithSizeWidth:reSize.width font:fontNum];
    }
    
    return reSize;
}



@end
