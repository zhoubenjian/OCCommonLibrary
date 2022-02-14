//
//  Tools.m
//  NotificationDemo
//
//  Created by 周本健 on 2022/2/10.
//

#import "Tools.h"
#import "MBProgressHUD.h"

@implementation Tools


// 十六进制颜色表示
+ (UIColor *)colorWithHex:(NSString *)hexColor {
    
    if (hexColor == nil) {
        return nil;
    }
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 1;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red / 255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}

+ (void)ShowMsg:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //获取主线程
        MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:([UIApplication sharedApplication].delegate).window animated:YES];
        HUD.mode = MBProgressHUDModeText;
        HUD.detailsLabel.text = msg;
        [HUD hideAnimated:NO afterDelay:2];
    });
    
}

#pragma mark - UILabel
// UILabel属性（背景颜色 + 字体颜色 + 字体大小 + 文本位置）
+ (void)labelProperty:(UILabel *)label andBGColor:(NSString *)bgColorStr andTxt:(NSString *)txtStr andTxtColor:(NSString *)txtColorStr andTxtFont:(CGFloat)txtFont andTxtAlignment:(NSTextAlignment)txtAlignment {
    
    label.backgroundColor = (bgColorStr == nil ? [UIColor clearColor] : [Tools colorWithHex:bgColorStr]);
    label.text = txtStr;
    label.textColor = [Tools colorWithHex:txtColorStr];
    label.font = [UIFont systemFontOfSize:txtFont];
    label.textAlignment = txtAlignment;
}
/*********        UILabel        *********/



/*********        UIButton        *********/
// UIButton属性（背景颜色 + 标题内容 + 标题颜色 + 字体大小（systemFontOfSize）+ 字体排布）
+ (void)btnProperty:(UIButton *)btn andBGColor:(NSString *)bgColorStr andTitleTxt:(NSString *)txtStr andTitleTxtColor:(NSString *)txtColorStr andTitleTxtFont:(CGFloat)txtFont andTitleTxtAlignment:(NSTextAlignment)txtAlignment {
    btn.backgroundColor = (bgColorStr == nil ? [UIColor clearColor] : [Tools colorWithHex:bgColorStr]);
    [btn setTitle:txtStr forState:UIControlStateNormal];
    [btn setTitleColor:[Tools colorWithHex:txtColorStr] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:txtFont];
    btn.titleLabel.textAlignment = txtAlignment;
}

// 圆角Button
+ (void)btnWithRounded:(UIButton *)btn andCornerRadius:(CGFloat)radius {
    btn.layer.cornerRadius = radius;
    btn.layer.masksToBounds = YES;
}
/*********        UIButton        *********/

@end
