//
//  NSString+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 9/24/12.
//  Copyright (c) 2012 NYU. All rights reserved.
//

#import "NSString+iOS.h"

@implementation NSString (iOS)

- (id)urlEncoded {
    return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                    (CFStringRef) self,
                                                    NULL,
                                                    (CFStringRef) @"!*'();:@&=+$,/?%#[]",
                                                    kCFStringEncodingUTF8);
}

@end
