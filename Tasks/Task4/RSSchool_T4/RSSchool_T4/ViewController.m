//
//  ViewController.m
//  RSSchool_T4
//
//  Created by Mike Veber on 18.04.2019.
//  Copyright © 2019 iOSLab. All rights reserved.
//
#import "ViewController.h"
@interface ViewController ()
@end
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
	self.input.delegate = self;
	[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(limit) userInfo:nil repeats:YES];
	self.flags = [[UIView alloc] initWithFrame:CGRectMake(30, 70, 50, 35)];
	self.input = [[UITextField alloc] initWithFrame:CGRectMake(100, 70, 185, 35)];
	self.input.borderStyle = 1.0;
	self.input.keyboardType = UIKeyboardTypePhonePad;
	[self.view addSubview:_input];
	[self.view addSubview:self.flags];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	int x = 4;
	[self.input resignFirstResponder];
	unsigned long length = self.input.text.length;
	if(length >= 11 && length <= 14){
		if(![[self.input.text substringToIndex:1] isEqualToString:@"+"]){
			self.input.text = [NSMutableString stringWithFormat:@"+%@", self.input.text];
			length++;
		}
	if([[self.input.text substringToIndex:2] isEqualToString:@"+7"]){
		if([[self.input.text substringToIndex:3] isEqualToString:@"+77"]){
	   	x = 2;
		NSMutableString *new = [NSMutableString stringWithString:self.input.text];
		[new insertString:@"(" atIndex:2];
		[new insertString:@")" atIndex:6];
		[new insertString:@" " atIndex:10];
		[new insertString:@" " atIndex:13];
		self.input.text = new;
		self.flags.layer.contents = (id)[UIImage imageNamed:@"flag_KZ"].CGImage;
		}
		else{
				x = 2;
				NSMutableString *new = [NSMutableString stringWithString:self.input.text];
				[new insertString:@"(" atIndex:2];
				[new insertString:@")" atIndex:6];
				[new insertString:@" " atIndex:10];
				[new insertString:@" " atIndex:13];
				self.input.text = new;
				self.flags.layer.contents = (id)[UIImage imageNamed:@"flag_RU"].CGImage;
		}
	}
	else if([[self.input.text substringToIndex:4] isEqualToString:@"+993"]){
		self.flags.layer.contents = (id)[UIImage imageNamed:@"flag_TM"].CGImage;
	}
	else if([[self.input.text substringToIndex:4] isEqualToString:@"+373"]){
		self.flags.layer.contents = (id)[UIImage imageNamed:@"flag_MD"].CGImage;
	}
	else if([[self.input.text substringToIndex:4] isEqualToString:@"+374"]){
		self.flags.layer.contents = (id)[UIImage imageNamed:@"flag_AM"].CGImage;
	}
	if([[self.input.text substringToIndex:4] isEqualToString:@"+375"]){
			self.flags.layer.contents = (id)[UIImage imageNamed:@"flag_BY"].CGImage;
		}
	else if([[self.input.text substringToIndex:4] isEqualToString:@"+380"]){
		self.flags.layer.contents = (id)[UIImage imageNamed:@"flag_UA"].CGImage;
	}
	else if([[self.input.text substringToIndex:4] isEqualToString:@"+992"]){
		self.flags.layer.contents = (id)[UIImage imageNamed:@"flag_TJ"].CGImage;
	}
	else if([[self.input.text substringToIndex:4] isEqualToString:@"+994"]){
		self.flags.layer.contents = (id)[UIImage imageNamed:@"flag_AZ"].CGImage;
	}
	else if([[self.input.text substringToIndex:4] isEqualToString:@"+996"]){
		self.flags.layer.contents = (id)[UIImage imageNamed:@"flag_KG"].CGImage;
	}
	else if([[self.input.text substringToIndex:4] isEqualToString:@"+998"]){
		self.flags.layer.contents = (id)[UIImage imageNamed:@"flag_UZ"].CGImage;
	}
	if (length - x == 9 && x == 4) {
		NSMutableString *new = [NSMutableString stringWithString:self.input.text];
		[new insertString:@"(" atIndex:4];
		[new insertString:@")" atIndex:7];
		[new insertString:@"-" atIndex:11];
		[new insertString:@"-" atIndex:14];
		self.input.text = new;
	}
		if (length - x == 8 && x == 4) {
			NSMutableString *new = [NSMutableString stringWithString:self.input.text];
			[new insertString:@"(" atIndex:4];
			[new insertString:@")" atIndex:7];
			[new insertString:@"-" atIndex:11];
			self.input.text = new;
		}
    }
		else if (length == 0) {
			self.flags.layer.contents = nil;
		}
}
-(void)limit{
if([self.input.text length] >= 14){
	NSRange match = [self.input.text rangeOfString: @"(" options: NSLiteralSearch ||
			 NSCaseInsensitiveSearch];
	if(match.length == 0){
	self.input.text = [self.input.text substringWithRange:NSMakeRange(0, 13)];
    }
}
}
-(void)dealloc{
	[self.input release];
	[self.flags release];
	[super dealloc];
}
@end
