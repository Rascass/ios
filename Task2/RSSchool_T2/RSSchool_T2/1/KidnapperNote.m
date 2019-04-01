#import "KidnapperNote.h"
@implementation KidnapperNote
- (BOOL)checkMagazine:(NSString *)magaine note:(NSString *)note {
	NSArray *words1 = [note componentsSeparatedByString:@" "];
	for (int i = 0; i < words1.count; i++) {
		if ([magaine rangeOfString: words1[i] options: NSLiteralSearch || NSCaseInsensitiveSearch].location == NSNotFound){
			return NO;
		}
		    else{
		    NSUInteger location = [magaine rangeOfString: words1[i] options: NSLiteralSearch || NSCaseInsensitiveSearch].location;
		    NSUInteger numberOfCharacters = [magaine rangeOfString: words1[i] options: NSLiteralSearch || NSCaseInsensitiveSearch].length;
		    NSRange range = NSMakeRange(location, numberOfCharacters);
		    NSString *result = [magaine substringWithRange:range];
		    magaine = [magaine stringByReplacingOccurrencesOfString:result withString:@""];
		    }
	}
	return YES;
}
@end
