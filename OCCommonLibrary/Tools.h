//
//  Tools.h
//  NotificationDemo
//
//  Created by 周本健 on 2022/2/10.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tools : NSObject


// 十六进制颜色
+ (UIColor *)colorWithHex:(NSString *)hexColor;

/*********        UILabel        *********/
// UILabel属性（背景颜色 + 字体颜色 + 字体大小 + 文本位置）
+ (void)labelProperty:(UILabel *)label andBGColor:(NSString *)bgColorStr andTxt:(NSString *)txtStr andTxtColor:(NSString *)txtColorStr andTxtFont:(CGFloat)txtFont andTxtAlignment:(NSTextAlignment)txtAlignment;
/*********        UILabel        *********/



/*********        UIButton        *********/
// UIButton属性（背景颜色 + 标题内容 + 标题颜色 + 字体大小（systemFontOfSize）+ 字体排布）
+ (void)btnProperty:(UIButton *)btn andBGColor:(NSString *)bgColorStr andTitleTxt:(NSString *)txtStr andTitleTxtColor:(NSString *)txtColorStr andTitleTxtFont:(CGFloat)txtFont andTitleTxtAlignment:(NSTextAlignment)txtAlignment;

// 圆角Button
+ (void)btnWithRounded:(UIButton *)btn andCornerRadius:(CGFloat)radius;
/*********        UIButton        *********/

@end

NS_ASSUME_NONNULL_END
