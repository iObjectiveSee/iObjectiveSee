//
//  NSDate+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import "NSDate+iOS.h"

@implementation NSDate (iOS)

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

@end
