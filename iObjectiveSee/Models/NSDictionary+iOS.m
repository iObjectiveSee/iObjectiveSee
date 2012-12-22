//
//  NSDictionary+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import "NSDictionary+iOS.h"

@implementation NSDictionary (iOS)

- (id)objectForKeyNullSafe:(id)aKey {
    id ret = [self objectForKey:aKey];
    if ([ret class] == [NSNull class]) {
        return nil;
    }
    return ret;
}

- (BOOL)boolForKey:(id)aKey {
    BOOL result = NO;
    id <NSObject> obj = [self objectForKey:aKey];
    if (obj) {
        if ([obj respondsToSelector:@selector(boolValue)]) {
            result = [obj performSelector:@selector(boolValue)]?YES:NO;
        }
        else if ([obj isKindOfClass:[NSString class]]) {
            result = ([(NSString *)obj caseInsensitiveCompare:@"YES"] == NSOrderedSame);
            if (!result) {
                result = ([(NSString *)obj caseInsensitiveCompare:@"TRUE"] == NSOrderedSame);
            }
        }
    }
    return result;
}

- (NSString *)stringForKey:(id)aKey {
    id obj = [self objectForKeyNullSafe:aKey];
    if (![obj isKindOfClass:[NSString class]]) {
        obj = [obj stringValue];
    }
    return obj;
}

- (NSDate *)dateForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNumber class]]) {
        return [NSDate dateWithTimeIntervalSince1970:[(NSNumber *)obj doubleValue]];
    }
    return nil;
}

@end
