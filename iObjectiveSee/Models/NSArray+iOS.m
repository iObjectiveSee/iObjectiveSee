//
//  NSArray+NSArray_iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 3/27/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "NSArray+iOS.h"

@implementation NSArray (iOS)

- (void)each:(void (^)(id obj))block {
    for (id _inObj in self) {
        block(_inObj);
    }
}

- (id)detect:(BOOL (^)(id obj))block {
    for (id _inObj in self) {
        if (block(_inObj)) {
            return _inObj;
        }
    }
    return nil;
}

- (NSArray *)collect:(id (^)(id obj))block {
    NSMutableArray *ret = [NSMutableArray array];
    for (id _inObj in self) {
        id toAdd = block(_inObj);
        if (toAdd) {
            [ret addObject:toAdd];
        }
    }
    return ret;
}

- (NSArray *)reject:(BOOL (^)(id obj))block {
    NSMutableArray *ret = [NSMutableArray array];
    for (id _inObj in self) {
        if (!block(_inObj)) {
            [ret addObject:_inObj];
        }
    }
    return ret;
}

- (NSString *)collectString:(NSString * (^)(id obj))block separator:(NSString *)separator {
    NSMutableString *ret = [NSMutableString string];
    for (id _inObj in self) {
        NSString *str = block(_inObj);
        if (str) {
            if (ret.length > 0) {
                [ret appendString:separator];
            }
            [ret appendString:str];
        }
    }
    return ret;
}

@end
