#import "Encryption.h"
#import <math.h>

@implementation Encryption

// Complete the encryption function below
- (NSString *)encryption:(NSString *)string {
	NSString *result;
	NSMutableArray *array;
	float length =sqrt(string.length);
	int floor = floorf(length);
	int ceil = ceilf(length);
	int columns = arc4random_uniform(ceil);
	int rows = arc4random_uniform(floor);
	if (rows * columns < string.length) {
		columns = ceil;
		rows = columns;
	}
	if (rows <= floor || rows == 0) {
		rows++;
	}
	NSLog(@"%d", rows);
	NSLog(@"%d", columns);
	id table[columns][rows];
	for (int i = 0; i < string.length; i++) {
	    char c = [string characterAtIndex: i];
	    result = [NSString stringWithFormat:@"%c", c];
		[array addObject:result];
	}
	return result;
}
@end
