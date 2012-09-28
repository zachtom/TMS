//
//  PrivacyPolicy.m
//  TMS
//
//  Created by Zachariah Tom on 25/09/2012.
//  Copyright (c) 2012 Mobytz. All rights reserved.
//

#import "PrivacyPolicy.h"

@interface PrivacyPolicy ()

@end

@implementation PrivacyPolicy
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *path;
	NSBundle *thisBundle = [NSBundle mainBundle];
	path = [thisBundle pathForResource:@"pp" ofType:@"html"];
	
	// make a file: URL out of the path
	NSURL *url = [NSURL fileURLWithPath:path];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [webView release];
    [super dealloc];
}
@end
