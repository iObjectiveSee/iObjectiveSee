//
//  NSDate+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import "NSDate+iOS.h"

@implementation NSDate (iOS)

+ (long)currentMillis {
    return (long)([[NSDate date] timeIntervalSince1970] * 1000.0);
}

- (NSString *)pretty {
    double ti = [self timeIntervalSinceNow];
    ti = ti * -1;
    if(ti < 1) {
        return NSLocalizedString(@"date-right-now", nil);
    } else if (ti < 60) {  //60 seconds
        return NSLocalizedString(@"date-less-minute", nil);
    } else if (ti < 3600) { //60 sec x 60 min
        int diff = round(ti / 60);
        return [NSString stringWithFormat:diff>1?NSLocalizedString(@"date-mins", nil):NSLocalizedString(@"date-min", nil), diff];
    } else if (ti < 86400) { //60 sec x 60 min x 24 hrs
        int diff = round(ti / 60 / 60);
        return [NSString stringWithFormat:diff>1?NSLocalizedString(@"date-hours", nil):NSLocalizedString(@"date-hour", nil), diff];
    } else if (ti < 604800) { //60 sec x 60 min x 24 hrs x 7 days
        int diff = round(ti / 60 / 60 / 24);
        return [NSString stringWithFormat:diff>1?NSLocalizedString(@"date-days", nil):NSLocalizedString(@"date-day", nil), diff];
    } else if (ti < 2419200) { //60 sec x 60 min x 24 hrs x 7 days x 4 weeks
        int diff = round(ti / 60 / 60 / 24 / 7);
        return [NSString stringWithFormat:diff>1?NSLocalizedString(@"date-weeks", nil):NSLocalizedString(@"date-week", nil), diff];
    } else if (ti < 29030400) { //60 sec x 60 min x 24 hrs x 7 days x 4 weeks x 12 months
        int diff = round(ti / 60 / 60 / 24 / 7 / 4);
        return [NSString stringWithFormat:diff>1?NSLocalizedString(@"date-months", nil):NSLocalizedString(@"date-month", nil), diff];
    } else if (ti < 145152000) { //60 sec x 60 min x 24 hrs x 7 days x 4 weeks x 12 months x 5years
        int diff = round(ti / 60 / 60 / 24 / 7 / 4 / 12);
        return [NSString stringWithFormat:diff>1?NSLocalizedString(@"date-years", nil):NSLocalizedString(@"date-year", nil), diff];
    }
    else {
        return NSLocalizedString(@"date-ages", nil);
    }
}

- (NSDateComponents *)dateComponentsForCalendar:(NSCalendar *)calendar {
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:self];
    return components;
}

- (NSString *)shortStyleStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    return [formatter stringFromDate:self];
}

+ (NSDate *)calendarAwareFromHourMin:(NSDate *)date {
    NSDateComponents *components = [date dateComponentsForCalendar:[NSCalendar currentCalendar]];
    return [NSDate dateFromHour:components.hour min:components.minute];
    
}

+ (NSDate *)dateFromHour:(NSInteger)hour min:(NSInteger)min forwardThinking:(BOOL)forwardThinking {
    NSDate *now = [NSDate date];
    NSDateComponents *components = [now dateComponentsForCalendar:[NSCalendar currentCalendar]];
    [components setHour:hour];
    [components setMinute:min];
    NSDate *potentialRet = [[NSCalendar currentCalendar] dateFromComponents:components];
    if (forwardThinking && [now laterThan:potentialRet]) {
        components.day += 1;
    }
    //find next date that is at least later than date right NOW
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

+ (NSDate *)dateFromHour:(NSInteger)hour min:(NSInteger)min {
    return [NSDate dateFromHour:hour min:min forwardThinking:YES];
}

+ (NSDate *)dateCalendarAware {
    NSDateComponents *components = [[NSDate date] dateComponentsForCalendar:[NSCalendar currentCalendar]];
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSInteger)year {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:self];
    return [components year];
}

- (NSInteger)hour {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit fromDate:self];
    return components.hour;
}

- (NSInteger)minute {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSMinuteCalendarUnit fromDate:self];
    return components.minute;
}

- (BOOL)laterThan:(NSDate *)date {
    return [self timeIntervalSinceDate:date] > 0;
}

- (NSInteger)numDaysToAdd:(NSDate *)date soLaterThan:(NSDate *)now withDayInterval:(NSInteger)dayInterval {
    float interval = 60*60*24*dayInterval;
    NSInteger ret = dayInterval;
    date = [date dateByAddingTimeInterval:interval];
    
    while ([now laterThan:date]) {
        date = [date dateByAddingTimeInterval:interval];
        ret +=dayInterval;
    }
    return ret;
}

+ (NSDate *)dateFromString:(NSString *)dateString {
    if ([dateString class] == [NSNull class])
        return nil;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSDate *dateFromString = [dateFormatter dateFromString:dateString];
    if (!dateFromString) {
        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
        dateFromString = [dateFormatter dateFromString:dateString];
    }
    return dateFromString;
}

+ (NSDate *)nextDay:(NSInteger)inDay hour:(NSInteger)inHour minute:(NSInteger)inMinute {
    NSDate *now = [NSDate date];
    NSDateComponents *nowComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSWeekdayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:now];
    nowComponents.hour = inHour;
    nowComponents.minute = inMinute;
    
    NSInteger day = nowComponents.weekday;
    NSInteger deltaDay = inDay - day;
    nowComponents.day += deltaDay;
    return [[NSCalendar currentCalendar] dateFromComponents:nowComponents];
}

+ (NSDate *)nextSunday:(NSInteger)hour minute:(NSInteger)minute {
    return [NSDate nextDay:1 hour:hour minute:minute];
}

+ (NSDate *)nextMonday:(NSInteger)hour minute:(NSInteger)minute {
    return [NSDate nextDay:2 hour:hour minute:minute];
}

+ (NSDate *)nextTuesday:(NSInteger)hour minute:(NSInteger)minute {
    return [NSDate nextDay:3 hour:hour minute:minute];
}

+ (NSDate *)nextWednesday:(NSInteger)hour minute:(NSInteger)minute {
    return [NSDate nextDay:4 hour:hour minute:minute];
}

+ (NSDate *)nextThursday:(NSInteger)hour minute:(NSInteger)minute {
    return [NSDate nextDay:5 hour:hour minute:minute];
}

+ (NSDate *)nextFriday:(NSInteger)hour minute:(NSInteger)minute {
    return [NSDate nextDay:6 hour:hour minute:minute];
}

+ (NSDate *)nextSaturday:(NSInteger)hour minute:(NSInteger)minute {
    return [NSDate nextDay:7 hour:hour minute:minute];
}

@end
