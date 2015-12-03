//
//  NSArray+NSArray_iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 3/27/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (iOS)

- (void)each:(void (^)(id))block;
- (id)detect:(BOOL (^)(id))block;
- (NSArray *)collect:(id (^)(id obj))block;
- (NSArray *)reject:(BOOL (^)(id obj))block;
- (NSString *)collectString:(NSString * (^)(id obj))block separator:(NSString *)separator;
- (NSArray *)shuffle;
- (BOOL)isEmpty;

@end
