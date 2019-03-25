#import "Pangrams.h"

@implementation Pangrams

- (BOOL)pangrams:(NSString *)string {
	int i;
	int n = 0;
	NSArray *arrayOfString = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q" , @"R" , @"S" , @"T" , @"U" , @"V" , @"W" , @"X" , @"Y" , @"Z"];
	NSUInteger length = [string length];
    NSRange match = NSMakeRange(0, length);
	for (i = 0; i < arrayOfString.count; i++) {
		match = [string rangeOfString: arrayOfString[i] options: NSLiteralSearch ||
				 NSCaseInsensitiveSearch];
		if(match.length > 0){
			NSLog(@"найдено соответсвие");
			n++;
		}
	}
	if(n == arrayOfString.count){
		NSLog(@"pangram");
		return YES;
	}
	else {
		NSLog(@"not pangram");
		return NO;
	}
}

@end
