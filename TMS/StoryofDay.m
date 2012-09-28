//
//  StoryofDay.m
//  TMS
//
//  Created by Zachariah Tom on 31/07/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import "StoryofDay.h"

@interface StoryofDay ()

@end

@implementation StoryofDay
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
}

-(void)viewWillAppear:(BOOL)animated
{
    NSString *htmlString = @"<html><body><h1></h1><p>%@</p></body></html>";
    NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:@"story"];
    //I have a very large HTML content here.. For sample I have given a small content       
    [webView loadHTMLString:[NSString stringWithFormat:htmlString,str] baseURL:nil];
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
