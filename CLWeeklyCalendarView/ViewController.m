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
#import "CommonUI.h"

static const unsigned int HOURS_IN_DAY                        = 24;
static const unsigned int DAYS_IN_WEEK                        = 7;

static const CGFloat LEFT_TIME_WIDTH                          = 30.0;




@interface ViewController ()<CLWeeklyCalendarViewDelegate>

@property (nonatomic, strong) CLWeeklyCalendarView* calendarView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) MAGridView *gridView;
@end

static CGFloat CALENDER_VIEW_HEIGHT = 120.f;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.calendarView];
    [self.scrollView addSubview:self.gridView];
    [self.view addSubview:self.scrollView];
    CGSize contentSize = CGSizeMake(self.gridView.bounds.size.width, self.gridView.bounds.size.height);
    [self.scrollView setContentSize:contentSize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Initialize
-(CLWeeklyCalendarView *)calendarView
{
    if(!_calendarView){
        _calendarView = [[CLWeeklyCalendarView alloc] initWithFrame:CGRectMake(LEFT_TIME_WIDTH, 0, self.view.bounds.size.width - LEFT_TIME_WIDTH, CALENDER_VIEW_HEIGHT)];
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
        CGFloat cellWidth = rect.size.width/DAYS_IN_WEEK;
        CGFloat gridHeight = HOURS_IN_DAY * cellWidth;
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
