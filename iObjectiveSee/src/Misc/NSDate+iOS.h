//
//  NSDate+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (iOS)

- (NSString *)pretty;
- (NSString *)shortStyleStr;
+ (NSDate *)calendarAwareFromHourMin:(NSDate *)date;
+ (NSDate *)dateFromHour:(int)hour min:(int)min;
+ (NSDate *)dateCalendarAware;
- (NSInteger)year;
- (NSInteger)hour;
- (NSInteger)minute;
- (BOOL)laterThan:(NSDate *)date;
+ (NSDate *)dateFromString:(NSString *)dateString;
- (int)numDaysToAdd:(NSDate *)date soLaterThan:(NSDate *)now withDayInterval:(int)dayInterval;
+ (NSDate *)nextDay:(int)inDay hour:(int)inHour minute:(int)inMinute;
+ (NSDate *)nextSunday:(int)hour minute:(int)minute;
+ (NSDate *)nextMonday:(int)hour minute:(int)minute;
+ (NSDate *)nextTuesday:(int)hour minute:(int)minute;
+ (NSDate *)nextWednesday:(int)hour minute:(int)minute;
+ (NSDate *)nextThursday:(int)hour minute:(int)minute;
+ (NSDate *)nextFriday:(int)hour minute:(int)minute;
+ (NSDate *)nextSaturday:(int)hour minute:(int)minute;

@end
