//
//  UIDevice+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/23/12.
//
//

#import "UIDevice+iOS.h"

@implementation UIDevice (iOS)

+ (BOOL)isSimulator {
    return [[UIDevice currentDevice].model rangeOfString:@"Simulator"].location != NSNotFound;
}

+ (BOOL)isIphone {
    return [[UIDevice currentDevice].model rangeOfString:@"iPhone"].location != NSNotFound;
}

@end
