#import "DoomsdayMachine.h"
@interface AssimilationInfoCategory: NSObject <AssimilationInfo>
@property (nonatomic, readwrite) NSInteger years;
@property (nonatomic, readwrite) NSInteger months;
@property (nonatomic, readwrite) NSInteger weeks;
@property (nonatomic, readwrite) NSInteger days;
@property (nonatomic, readwrite) NSInteger hours;
@property (nonatomic, readwrite) NSInteger minutes;
@property (nonatomic, readwrite) NSInteger seconds;
- (void)setPr:(NSDateComponents *)compns;
@end

@implementation AssimilationInfoCategory
- (void)setPr:(NSDateComponents *)compns {
	self.years = compns.year;
	self.months = compns.month;
	self.days = compns.day;
	self.hours = compns.hour;
	self.minutes = compns.minute;
	self.seconds = compns.second;
}
@end

@implementation DoomsdayMachine
- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString{
	//NSArray *array;
	NSDateFormatter *format = [[NSDateFormatter alloc] init];
    dateString= [dateString stringByReplacingOccurrencesOfString:@":" withString:@" "];
    dateString= [dateString stringByReplacingOccurrencesOfString:@"@" withString:@" "];
    dateString= [dateString stringByReplacingOccurrencesOfString:@"\\" withString:@" "];
    dateString= [dateString stringByReplacingOccurrencesOfString:@"/" withString:@" "];
	[format setDateFormat:@"yyyy MM dd HH mm ss"];
	NSDate *date = [format dateFromString:dateString];
	NSLog(@" date = %@",date);
	NSDate *hourX = [format dateFromString:@"2208 08 14 03 13 37"];
	NSLog(@"hourX = %@",hourX);

	NSCalendar *gregorian = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
	unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay| NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
	NSDateComponents *comps = [gregorian components: unitFlags fromDate: date  toDate:hourX  options:0];
	AssimilationInfoCategory *information = [[AssimilationInfoCategory alloc] init];
	[information setPr:comps];
	NSLog(@"%@", information);
	return [information autorelease];
	}
- (NSString *)doomsdayString{
	return @"Sunday, August 14, 2208";
}
@end




