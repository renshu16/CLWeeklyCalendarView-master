//
//  MAGridView+ScheduleView.m
//  CLWeeklyCalendarView
//
//  Created by ToothBond on 15/11/25.
//  Copyright © 2015年 Caesar. All rights reserved.
//

#import "MAGridView+ScheduleView.h"

//static const unsigned int HOURS_IN_DAY                        = 24;
//static const unsigned int DAYS_IN_WEEK                        = 7;
static const unsigned int MINUTES_IN_HOUR                     = 60;

@implementation MAGridView (ScheduleView)

- (void)addScheduleView:(TBScheduleView *)view withOffset:(NSInteger)offset
{
    TBScheduleView *eventView = [[TBScheduleView alloc] init];

    eventView.xOffset = offset;
    
    [self addSubview:eventView];
}

- (void)layoutSubviews
{
    CGFloat cellWidth = self.cellWidth;
    CGFloat cellHeight = self.cellHeight;
    
    for (id view in self.subviews) {
        if (![NSStringFromClass([view class])isEqualToString:@"TBScheduleView"]) {
            continue;
        }
        TBScheduleView *eventView = (TBScheduleView *) view;
        eventView.frame = CGRectMake(cellWidth * eventView.xOffset,
//                                     cellHeight / MINUTES_IN_HOUR * [eventView.event minutesSinceMidnight],
                                     cellHeight / MINUTES_IN_HOUR * 60 * eventView.xOffset,
                                     cellWidth,
//                                     cellHeight / MINUTES_IN_HOUR * [eventView.event durationInMinutes]);
                                     cellHeight / MINUTES_IN_HOUR * 60 * eventView.xOffset);
        [eventView setNeedsDisplay];
    }
}
@end
