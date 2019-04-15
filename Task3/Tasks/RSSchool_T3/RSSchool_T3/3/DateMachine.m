#import "DateMachine.h"

@implementation DateMachine
- (void)viewDidLoad {
	[super viewDidLoad];
	self.labelForlabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 60, 200, 50)];
	self.labelForlabel.text = @"Current date: ";
	self.labelForlabel.textColor = [UIColor blackColor];
	self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 90, 200, 50)];
	self.label.numberOfLines = 2;
	_curdate = [[NSDate alloc] init];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSString *dateString = [dateFormatter stringFromDate:_curdate];
	self.label.text = dateString;
	[self.view addSubview: self.label];
	[self.view addSubview: self.labelForlabel];
	
	self.StartDate = [[UITextField alloc] initWithFrame:CGRectMake(50, 140, 200, 35)];
	self.StartDate.placeholder = @"Enter a start date";
	self.StartDate.borderStyle = 1;
	self.StartDate.delegate = self;
	[self.view addSubview: self.StartDate];
	
	_Step = [[UITextField alloc] initWithFrame:CGRectMake(50, 190, 200, 35)];
	_Step.placeholder = @"Enter a number";
	_Step.borderStyle = 1;
	_Step.delegate = self;
	[self.view addSubview: _Step];
	
	_DateUnit = [[UITextField alloc] initWithFrame:CGRectMake(50, 240, 200, 35)];
	_DateUnit.placeholder = @"Enter a type of date";
    _DateUnit.borderStyle = 1;
	_DateUnit.delegate = self;
	[self.view addSubview: _DateUnit];
	
	_AddButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 320, 70, 35)];
	[_AddButton addTarget:self action:@selector(addDate:) forControlEvents:UIControlEventTouchUpInside];
	[_AddButton setTitle:@"Add" forState:UIControlStateNormal];
	_AddButton.backgroundColor = [UIColor greenColor];
	[self.view addSubview:_AddButton];
	
	_SubButton = [[UIButton alloc] initWithFrame:CGRectMake(180, 320, 70, 35)];
	[_SubButton addTarget:self action:@selector(addTimes:) forControlEvents:UIControlEventTouchUpInside];
	[_SubButton setTitle:@"Sub" forState:UIControlStateNormal];
	_SubButton.backgroundColor = [UIColor redColor];
	[self.view addSubview:_SubButton];
	
	_Result = [[UITextView alloc] initWithFrame:CGRectMake(50, 450, 200, 70)];
	_Result.backgroundColor = [UIColor grayColor];
	[self.view addSubview:_Result];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	[self.view endEditing:YES];
	return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
	
	textField = self.StartDate;
	if(textField.text.length > 1){
	_label.text = textField.text;
	}
}
NSDate * addDaysToDate(NSDate * date, int days)
{
	NSDateComponents * components = [[NSDateComponents alloc] init];
	[components setDay:days];
	NSDate * result = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	[components release];
	return result;
}
NSDate * addHoursToDate(NSDate * date, int hours)
{
	NSDateComponents * components = [[NSDateComponents alloc] init];
	[components setHour: hours];
	NSDate * result = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	[components release];
	return result;
}
NSDate * addMinutesToDate(NSDate * date, int minutes)
{
	NSDateComponents * components = [[NSDateComponents alloc] init];
	[components setMinute: minutes];
	NSDate * result = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	[components release];
	return result;
}
NSDate * addSecondsToDate(NSDate * date, int seconds)
{
	NSDateComponents * components = [[NSDateComponents alloc] init];
	[components setSecond:seconds];
	NSDate * result = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	[components release];
	return result;
}
NSDate * addMonthsToDate(NSDate * date, int months)
{
	NSDateComponents * components = [[NSDateComponents alloc] init];
	[components setMonth:months];
	NSDate * result = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	[components release];
	return result;
}
NSDate * addYearsToDate(NSDate * date, int years)
{
	NSDateComponents * components = [[NSDateComponents alloc] init];
	[components setYear:years];
	NSDate * result = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	[components release];
	return result;
}
-(void)addDate:(id)sender{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	_date = [dateFormatter dateFromString:self.label.text];
	if ([_DateUnit.text  isEqual: @"year"]) {
		_date = addYearsToDate(_date, [_Step.text integerValue]);
	}
	if ([_DateUnit.text  isEqual: @"month"]) {
		_date = addMonthsToDate(_date, [_Step.text integerValue]);
	}
	if ([_DateUnit.text  isEqual: @"day"]) {
		_date = addDaysToDate(_date, [_Step.text integerValue]);
	}
	if ([_DateUnit.text  isEqual: @"hour"]) {
		_date = addHoursToDate(_date, [_Step.text integerValue]);
	}
	if ([_DateUnit.text  isEqual: @"minute"]) {
		_date = addMinutesToDate(_date, [_Step.text integerValue]);
	}
	if ([_DateUnit.text  isEqual: @"second"]) {
		_date = addSecondsToDate(_date, [_Step.text integerValue]);
	}
	_Result.text = [dateFormatter stringFromDate:_date];
	[dateFormatter release];
	//NSTimeInterval diff = [_date timeIntervalSinceDate:_curdate];

}
-(void)addTimes:(id)sender{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	if ([_DateUnit.text  isEqual: @"year"]) {
		_date = addYearsToDate(_date, [_Step.text integerValue]);
	}
	if ([_DateUnit.text  isEqual: @"month"]) {
		_date = addMonthsToDate(_date, [_Step.text integerValue]);
	}
	if ([_DateUnit.text  isEqual: @"day"]) {
		_date = addDaysToDate(_date, [_Step.text integerValue]);
	}
	if ([_DateUnit.text  isEqual: @"hour"]) {
		_date = addHoursToDate(_date, [_Step.text integerValue]);
	}
	if ([_DateUnit.text  isEqual: @"minute"]) {
		_date = addMinutesToDate(_date, [_Step.text integerValue]);
	}
	if ([_DateUnit.text  isEqual: @"second"]) {
		_date = addSecondsToDate(_date, [_Step.text integerValue]);
	}
	NSString *newString = nil;
	newString = [dateFormatter stringFromDate:_date];
	_Result.text = [_Result.text stringByAppendingString:@"         "];
	_Result.text = [_Result.text stringByAppendingString:newString];
	[dateFormatter release];
	
}
-(void)dealloc {
	[_label release];
	[_labelForlabel release];
	[_StartDate release];
	[_Step release];
	[_date release];
	[_DateUnit release];
	[_AddButton release];
	[_SubButton release];
	[_curdate release];
	[super dealloc];
}
@end


