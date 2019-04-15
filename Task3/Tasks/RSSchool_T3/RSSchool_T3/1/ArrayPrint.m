#import "ArrayPrint.h"
@implementation NSArray (RSSchool_Extension_Name)
- (NSString *)print {
NSMutableString *newString = [NSMutableString new];
NSArray *array = self;
for (int i = 0; i < [array count]; i++) {
		id obj = [array objectAtIndex: i];
		if ([obj isKindOfClass: [NSArray class]]) {
			[newString appendString:[obj print]];
			if (i < [array count] - 1) {
				[newString appendString:@","];
				NSLog(@"%@", newString);
			}
		}
		 else if ([obj isKindOfClass: [NSString class]]) {
			 [newString appendFormat: @"\"%@\"", obj];
			if (i < [array count] - 1) {
				[newString appendString:@","];
				NSLog(@"%@", newString);
			}
		}
		else if ([obj isKindOfClass: [NSNumber class]]) {
			[newString appendString:[obj stringValue]];
			if (i < [array count] - 1 || ![obj  isEqual: @"]"]) {
				[newString appendString:@","];
				NSLog(@"%@", newString);
			}
		}
		else if ([obj isKindOfClass: [NSNull class]]) {
			[newString appendString:@"null"];
			if (i < [array count] - 1) {
				[newString appendString:@","];
				NSLog(@"%@", newString);
			}
		}
		else {
			[newString appendString:@"unsupported"];
			if (i < [array count] - 1) {
				[newString appendString:@","];
				NSLog(@"%@", newString);
			}
		}
}
NSLog(@"%@", newString);
newString = [NSMutableString stringWithFormat:@"[%@]", newString];
NSLog(@"%@", newString);
return newString;
}
@end
