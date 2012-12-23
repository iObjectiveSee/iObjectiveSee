//
//  UIApplication+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/23/12.
//
//

#import "UIApplication+iOS.h"

@implementation UIApplication (iOS)

+ (NSString *)appVersionString {
    return [NSString stringWithFormat:@"%@ (%@)",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
}

@end
