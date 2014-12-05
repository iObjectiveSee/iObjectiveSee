//
//  NSDate+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (iOS)

+ (long)currentMillis;
- (NSString *)pretty;
- (NSString *)shortStyleStr;
+ (NSDate *)calendarAwareFromHourMin:(NSDate *)date;
+ (NSDate *)dateFromHour:(NSInteger)hour min:(NSInteger)min;
+ (NSDate *)dateCalendarAware;
- (NSInteger)year;
- (NSInteger)hour;
- (NSInteger)minute;
- (BOOL)laterThan:(NSDate *)date;
+ (NSDate *)dateFromString:(NSString *)dateString;
- (NSInteger)numDaysToAdd:(NSDate *)date soLaterThan:(NSDate *)now withDayInterval:(NSInteger)dayNSIntegererval;
+ (NSDate *)nextDay:(NSInteger)inDay hour:(NSInteger)inHour minute:(NSInteger)inMinute;
+ (NSDate *)nextSunday:(NSInteger)hour minute:(NSInteger)minute;
+ (NSDate *)nextMonday:(NSInteger)hour minute:(NSInteger)minute;
+ (NSDate *)nextTuesday:(NSInteger)hour minute:(NSInteger)minute;
+ (NSDate *)nextWednesday:(NSInteger)hour minute:(NSInteger)minute;
+ (NSDate *)nextThursday:(NSInteger)hour minute:(NSInteger)minute;
+ (NSDate *)nextFriday:(NSInteger)hour minute:(NSInteger)minute;
+ (NSDate *)nextSaturday:(NSInteger)hour minute:(NSInteger)minute;

@end
