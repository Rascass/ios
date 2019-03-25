#import "SummArray.h"

@implementation SummArray
// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
	//NSLog(@"%lu", (unsigned long)array.count);
	int i = 0;
	int object = 0;
	while (i < array.count) {
		object += [[array objectAtIndex:i] integerValue];
		i++;
	}
    return [NSNumber numberWithInteger:object];
}
@end
