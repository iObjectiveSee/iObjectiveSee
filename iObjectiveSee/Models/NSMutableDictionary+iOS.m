//
//  NSMutableDictionary+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import "NSMutableDictionary+iOS.h"

@implementation NSMutableDictionary (iOS)

- (NSMutableDictionary *)unionOfDictionary:(NSMutableDictionary *)dict {
    for (id key in [dict allKeys]) {
        id dictObj = [dict objectForKey:key];
        id myObj = [self objectForKey:key];
        
        if ([self objectForKey:key] && ([myObj isKindOfClass:[NSArray class]] || [myObj isKindOfClass:[NSDictionary class]])) {
            if ([dictObj isKindOfClass:[myObj class]]) {
                if ([dictObj respondsToSelector:@selector(addEntriesFromDictionary:)]) { //is a mutable dictionary
                    [(NSMutableDictionary *)myObj addEntriesFromDictionary:(NSMutableDictionary *)dictObj];
                }
                else if ([dictObj respondsToSelector:@selector(setObject:forKey:)]) {
                    myObj = [myObj mutableCopy];
                    [(NSMutableDictionary *)myObj addEntriesFromDictionary:(NSDictionary *)dictObj];
                    myObj = [NSDictionary dictionaryWithDictionary:myObj];
                    [self setObject:myObj forKey:key];
                }
                else if ([dictObj respondsToSelector:@selector(addObjectsFromArray:)]) {
                    [(NSMutableArray *)myObj addObjectsFromArray:(NSMutableArray *)dictObj];
                }
                else if ([dictObj respondsToSelector:@selector(arrayByAddingObjectsFromArray:)]) {
                    myObj = [(NSArray *)myObj arrayByAddingObjectsFromArray:(NSArray *)dictObj];
                    [self setObject:myObj forKey:key];
                }
            }
        }
        else {
            [self setObject:dictObj forKey:key];
        }
    }
    return self;
}

@end
