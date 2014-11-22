//
//  UIColor+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIColor+iOS.h"

@implementation UIColor(iOS)

+ (UIColor *)randomColor {
    return [self colorWithRed:((float)rand() / RAND_MAX)
                        green:((float)rand() / RAND_MAX)
                         blue:((float)rand() / RAND_MAX)
                        alpha:1.0f];
}

//  Below taken from Jonas Schnelli's include7 AG
+ (UIColor *)colorWithHexString:(NSString *)hexString {
    /* convert the string into a int */
    unsigned int colorValueR,colorValueG,colorValueB,colorValueA;
    NSString *hexStringCleared = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if(hexStringCleared.length == 3) {
        /* short color form */
        /* im lazy, maybe you have a better idea to convert from #fff to #ffffff */
        hexStringCleared = [NSString stringWithFormat:@"%@%@%@%@%@%@", [hexStringCleared substringWithRange:NSMakeRange(0, 1)],[hexStringCleared substringWithRange:NSMakeRange(0, 1)],
                            [hexStringCleared substringWithRange:NSMakeRange(1, 1)],[hexStringCleared substringWithRange:NSMakeRange(1, 1)],
                            [hexStringCleared substringWithRange:NSMakeRange(2, 1)],[hexStringCleared substringWithRange:NSMakeRange(2, 1)]];
    }
    if(hexStringCleared.length == 6) {
        hexStringCleared = [hexStringCleared stringByAppendingString:@"ff"];
    }

    /* im in hurry ;) */
    NSString *red = [hexStringCleared substringWithRange:NSMakeRange(0, 2)];
    NSString *green = [hexStringCleared substringWithRange:NSMakeRange(2, 2)];
    NSString *blue = [hexStringCleared substringWithRange:NSMakeRange(4, 2)];
    NSString *alpha = [hexStringCleared substringWithRange:NSMakeRange(6, 2)];

    [[NSScanner scannerWithString:red] scanHexInt:&colorValueR];
    [[NSScanner scannerWithString:green] scanHexInt:&colorValueG];
    [[NSScanner scannerWithString:blue] scanHexInt:&colorValueB];
    [[NSScanner scannerWithString:alpha] scanHexInt:&colorValueA];


    return [UIColor colorWithRed:((colorValueR)&0xFF)/255.0 
                           green:((colorValueG)&0xFF)/255.0 
                            blue:((colorValueB)&0xFF)/255.0 
                           alpha:((colorValueA)&0xFF)/255.0];


}

//  Below taken from Jonas Schnelli's include7 AG
+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:r/255.0f 
                           green:g/255.0f 
                            blue:b/255.0f 
                           alpha:alpha];
}

//  Below taken from Jonas Schnelli's include7 AG
+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b {
    return [UIColor colorWithR:r g:g b:b alpha:1];
}

- (UIColor *)colorByDarkeningColor {
	// oldComponents is the array INSIDE the original color
	// changing these changes the original, so we copy it
	CGFloat *oldComponents = (CGFloat *)CGColorGetComponents([self CGColor]);
	CGFloat newComponents[4];
    
	NSInteger numComponents = CGColorGetNumberOfComponents([self CGColor]);
    
	switch (numComponents)
	{
		case 2:
		{
			//grayscale
			newComponents[0] = oldComponents[0]*0.7;
			newComponents[1] = oldComponents[0]*0.7;
			newComponents[2] = oldComponents[0]*0.7;
			newComponents[3] = oldComponents[1];
			break;
		}
		case 4:
		{
			//RGBA
			newComponents[0] = oldComponents[0]*0.7;
			newComponents[1] = oldComponents[1]*0.7;
			newComponents[2] = oldComponents[2]*0.7;
			newComponents[3] = oldComponents[3];
			break;
		}
	}
    
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
	return retColor;
}

+ (UIColor *)twitterBlue {
    return [UIColor colorWithHexString:@"3e8fcb"];
}

+ (UIColor *)facebookBlue {
    return [UIColor colorWithHexString:@"3b5998"];
}

@end
