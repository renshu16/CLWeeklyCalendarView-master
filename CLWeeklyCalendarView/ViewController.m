//
//  ViewController.m
//  CLWeeklyCalendarView
//
//  Created by Caesar on 11/12/2014.
//  Copyright (c) 2014 Caesar. All rights reserved.
//

#import "ViewController.h"
#import "CLWeeklyCalendarView.h"
#import "MAGridView.h"
#import "MAGridView+ScheduleView.h"
#import "CommonUI.h"

static const unsigned int HOURS_IN_DAY                        = 24;
static const unsigned int DAYS_IN_WEEK                        = 7;

static const CGFloat LEFT_TIME_WIDTH                          = 38.0;
static const CGFloat STATUS_BAR_HEIGHT                        = 20.0;


@interface ViewController ()<CLWeeklyCalendarViewDelegate>
{
    CGFloat gridCellWidth;
}

@property (nonatomic, strong) CLWeeklyCalendarView* calendarView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) MAGridView *gridView;
@end

static CGFloat CALENDER_VIEW_HEIGHT = 98.f;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.calendarView];
    [self.scrollView addSubview:self.gridView];
    [self.view addSubview:self.scrollView];
    CGSize contentSize = CGSizeMake(self.gridView.bounds.size.width, self.gridView.bounds.size.height);
    [self.scrollView setContentSize:contentSize];
    
    
    CGFloat labelWidth = LEFT_TIME_WIDTH;
    CGFloat labelHeight = 18;
    CGFloat labelStartCenterX = LEFT_TIME_WIDTH/2;
    CGFloat labelStartCenterY = CGRectGetMinY(self.gridView.frame);
    for (int i=0; i<HOURS_IN_DAY; i++) {
        NSString *timeStr  =[NSString stringWithFormat:@"%d:00",i];
        
        UILabel * timeIntervalLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, labelHeight)];
        CGPoint centerP = CGPointMake(labelStartCenterX, labelStartCenterY);
        timeIntervalLabel.center = centerP;
        timeIntervalLabel.font = font_sub_content;
        timeIntervalLabel.textColor = color_font_subtext_black;
        timeIntervalLabel.textAlignment = NSTextAlignmentCenter;
        timeIntervalLabel.text = timeStr;
        labelStartCenterY += gridCellWidth;
        [self.scrollView addSubview:timeIntervalLabel];
    }
    
    for (int i = 0; i< 6; i++) {
        TBScheduleView * scheduleView = [[TBScheduleView alloc] initWithFrame:CGRectZero];
        [self.gridView addScheduleView:scheduleView withOffset:i];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Initialize
-(CLWeeklyCalendarView *)calendarView
{
    if(!_calendarView){
        _calendarView = [[CLWeeklyCalendarView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, self.view.bounds.size.width, CALENDER_VIEW_HEIGHT)];
        _calendarView.delegate = self;
    }
    return _calendarView;
}

-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.calendarView.frame), self.view.bounds.size.width, self.view.bounds.size.height - CALENDER_VIEW_HEIGHT)];
        
    }
    return _scrollView;
}

- (MAGridView *)gridView
{
    if (!_gridView){
        CGRect rect = CGRectMake(LEFT_TIME_WIDTH, 0, self.view.bounds.size.width-LEFT_TIME_WIDTH, 0);
        gridCellWidth = rect.size.width/DAYS_IN_WEEK;
        CGFloat gridHeight = HOURS_IN_DAY * gridCellWidth;
        rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, gridHeight);
        _gridView = [[MAGridView alloc] initWithFrame:rect];
        _gridView.backgroundColor = [UIColor whiteColor];
        _gridView.rows            = HOURS_IN_DAY;
        _gridView.columns         = DAYS_IN_WEEK;
        _gridView.outerBorder     = YES;
        _gridView.verticalLines   = YES;
        _gridView.horizontalLines = YES;
        _gridView.lineColor       = color_line_divide;
        _gridView.lineWidth       = 0.5;
    }
    return _gridView;
}



#pragma mark - CLWeeklyCalendarViewDelegate
-(NSDictionary *)CLCalendarBehaviorAttributes
{
    return @{
             CLCalendarWeekStartDay : @7,                 //Start Day of the week, from 1-7 Mon-Sun -- default 1
//             CLCalendarDayTitleTextColor : [UIColor yellowColor],
//             CLCalendarSelectedDatePrintColor : [UIColor greenColor],
             };
}



-(void)dailyCalendarViewDidSelect:(NSDate *)date
{
    //You can do any logic after the view select the date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSLog(@"%@",[formatter stringFromDate:date]);
}



@end
