//
//  NSString+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 9/24/12.
//  Copyright (c) 2012 NYU. All rights reserved.
//

#import <Foundation/Foundation.h>

UIKIT_EXTERN NSString * const kNSStringiOSEmptyString;

@interface NSString (iOS)

- (NSString *)urlEncoded;
- (NSString *)urlDecoded;
- (BOOL)containsSubstring:(NSString *)substring;
- (BOOL)isEmpty;

@end
