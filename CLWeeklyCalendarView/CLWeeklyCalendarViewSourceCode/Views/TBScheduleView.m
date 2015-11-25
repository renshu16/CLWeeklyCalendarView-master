//
//  TBScheduleView.m
//  CLWeeklyCalendarView
//
//  Created by ToothBond on 15/11/25.
//  Copyright © 2015年 Caesar. All rights reserved.
//

#import "TBScheduleView.h"

@implementation TBScheduleView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initControls];
    }
    return self;
}

-(void)initControls
{
    self.backgroundColor = RGBCOLOR(252, 243, 173);
}

@end
