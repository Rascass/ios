#import "RomanTranslator.h"

@implementation RomanTranslator
- (NSString *)romanFromArabic:(NSString *)arabicString {
	int number = [arabicString intValue];
	NSString *newString;
	NSArray *onesRoman = @[@"I", @"II", @"III", @"IV",@"V", @"VI", @"VII", @"VIII", @"IX"];
	NSArray *tensRoman = @[@"X", @"XX", @"XXX", @"XL", @"L", @"LX", @"LXX",@"LXXX", @"XC"];
	NSArray *hundRoman = @[@"C", @"CC", @"CCC", @"CD", @"D", @"DC", @"DCC",@"DCCC", @"CM"];
	NSArray *thouRoman = @[@"M", @"MM", @"MMM"];
	int one = number % 10;
	id ones = onesRoman[one - 1];
	if (number > 1000) {
		int ten = ((number % 100) - one) / 10;
		NSLog(@"%d", ten);
		id  tens = tensRoman[ten - 1];
		int hund = ((number % 1000) - one - ten) / 100;
		NSLog(@"%d", hund);
		id  hunds = hundRoman[hund - 1];
		int thou = (number - hund - one - ten) / 1000;
		NSLog(@"%d", thou);
		id  thous = thouRoman[thou - 1];
		newString = [NSString stringWithFormat:@"%@%@%@%@", thous, hunds, tens, ones];
	}
	if (number > 100 && number < 1000) {
		int ten = ((number % 100) - one) / 10;
		id  tens = tensRoman[ten - 1];
		int hund = ((number % 1000) - one - ten) / 100;
		id  hunds = hundRoman[hund - 1];
		newString = [NSString stringWithFormat:@"%@%@%@",hunds, tens, ones];
	}
	if (number > 10 && number < 100) {
		int ten = ((number % 100) - one) / 10;
		id  tens = tensRoman[ten - 1];
		newString = [NSString stringWithFormat:@"%@%@",tens, ones];
	}
	if (number < 10) {
		newString = [NSString stringWithFormat:@"%@", ones];
	}
return newString;
}
- (NSString *)arabicFromRoman:(NSString *)romanString {
	NSString *result1 = nil;
	NSString *result2 = nil;
	//NSString *result3 = nil;
	//NSString *result4 = nil;
	NSString *result = nil;
	NSRange range;
	NSArray *Roman1 = @[@"I", @"II", @"III", @"IV",@"V", @"VI", @"VII", @"VIII", @"IX"];
	NSArray *Roman2 = @[@"X", @"XX", @"XXX", @"XL", @"L", @"LX", @"LXX",@"LXXX", @"XC"];
	//NSArray *Roman3 = @[@"C", @"CC", @"CCC", @"CD", @"D", @"DC", @"DCC",@"DCCC", @"CM"];
	//NSArray *Roman4 = @[@"M", @"MM", @"MMM"];
	for (int i = 0; i < Roman1.count; i++) {
		bool res = [romanString isEqualToString:Roman1[i]];
		if (res) {
			result = [NSString stringWithFormat:@"%d", i + 1];
		}
	}
		if (result.length == 0) {
			for (int i = 0; i < Roman2.count; i++) {
				if( [romanString rangeOfString:Roman2[i]].location != NSNotFound){
					result1 = [NSString stringWithFormat:@"%d", i + 1];
					range = NSMakeRange(0, [romanString rangeOfString:Roman2[i]].location + 1);
					NSString *delete = [romanString substringWithRange:range];
					romanString = [romanString stringByReplacingOccurrencesOfString:delete withString:@""];
				}
			}
			for (int i = 0; i < Roman1.count; i++) {
				bool res = [romanString isEqualToString:Roman1[i]];
				if (res) {
					result2 = [NSString stringWithFormat:@"%d", i + 1];
				}
				 result = [NSString stringWithFormat:@"%@%@", result1, result2];
		}
		}
	return result;
}

@end
