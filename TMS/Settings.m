//
//  Settings.m
//  TMS
//
//  Created by Zachariah Tom on 31/07/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import "Settings.h"
#import "MFSideMenu.h"

@interface Settings ()

@end

@implementation Settings
@synthesize lbl_Pin;

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
    self.lbl_Pin.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"pin"];
    
}

- (void)viewDidUnload
{
    [self setLbl_Pin:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (void)dealloc {
    [lbl_Pin release];
    [super dealloc];
}
@end
