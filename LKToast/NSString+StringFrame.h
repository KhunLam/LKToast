//
//  UILabel+StringFrame.h
//  UIStudy_0926Ingredients
//
//  
//

#import <UIKit/UIKit.h>

@interface NSString (StringFrame)

/**
 *  @brief  根据字符串的宽(或高)和字体的大小计算字符串的size
 *  @return 字符串的宽和高
 */
- (CGSize)boundingRectWithSizeWidth:(CGFloat )width font:(CGFloat )fontNum;

/**  计算字符串的宽度  */
- (CGSize )boundingRectWithFont:(CGFloat)font;

/**
 *  @brief  根据字符串字体的大小(和最大宽度)计算字符串的size
 *  @param  maxWidth    字符串最大的宽度
 *  @return 字符串的宽和高
 */
- (CGSize)boundingRectWithSizeMinHeight:(CGFloat )minHeight font:(CGFloat )fontNum maxWidth:(CGFloat)maxWidth;

@end
