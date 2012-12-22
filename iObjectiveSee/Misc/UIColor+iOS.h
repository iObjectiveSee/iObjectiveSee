//
//  UIColor+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(iOS)

+ (UIColor *)randomColor;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha;
+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b; 
- (UIColor *)colorByDarkeningColor;

+ (UIColor *)twitterBlue;
+ (UIColor *)facebookBlue;

@end
