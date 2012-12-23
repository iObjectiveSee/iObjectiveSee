//
//  NSString+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 9/24/12.
//  Copyright (c) 2012 NYU. All rights reserved.
//

#import "NSString+iOS.h"

NSString * const kNSStringiOSEmptyString = @"";

@implementation NSString (iOS)

- (NSString *)urlEncoded {
    return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                    (CFStringRef) self,
                                                    NULL,
                                                    (CFStringRef) @"!*'();:@&=+$,/?%#[]",
                                                    kCFStringEncodingUTF8);
}

- (NSString *)urlDecoded {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                    (CFStringRef)self,
                                                                    CFSTR(""),
                                                                    kCFStringEncodingUTF8));
}

- (BOOL)containsSubstring:(NSString *)substring {
    return [self rangeOfString:substring].length > 0;
}

- (BOOL)isEmpty {
    return !self || (NSNull *)self == [NSNull null] || [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@"<null>"];
}

@end
