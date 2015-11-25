//
//  MAGridView+ScheduleView.h
//  CLWeeklyCalendarView
//
//  Created by ToothBond on 15/11/25.
//  Copyright © 2015年 Caesar. All rights reserved.
//

#import "MAGridView.h"
#import "TBScheduleView.h"

@interface MAGridView (ScheduleView)

- (void)addScheduleView:(TBScheduleView *)view withOffset:(NSInteger)offset;



@end
