//
//  NSDictionary+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (iOS)

- (id)objectForKeyNullSafe:(id)aKey;
- (BOOL)boolForKey:(id)aKey;
- (NSString *)stringForKey:(id)aKey;
- (NSDate *)dateForKey:(id)aKey;

@end
