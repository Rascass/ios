#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
int count = 0;
int count1 = 0;
int n;
for (int i = 0; i < array.count; i++) {
	NSString *str = array[i];
	NSArray *numbers = [str componentsSeparatedByString:@" "];
	count += [numbers[i] intValue];
}
    for (int i = 0; i < array.count; i++) {
		NSString *str = array[i];
		NSArray *numbers = [str componentsSeparatedByString:@" "];
		n = numbers.count - 1 - i;
		count1 += [numbers[n] intValue];
		NSLog(@" count1 += %d", count1);
	}
if (count - count1 < 0) {
	return [NSNumber numberWithInteger:(count - count1) * (-1)];
}
	else{
return [NSNumber numberWithInteger:(count - count1)];
	}
}

@end
