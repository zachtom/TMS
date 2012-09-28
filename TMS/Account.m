//
//  Account.m
//  TMS
//
//  Created by Zachariah Tom on 25/09/2012.
//  Copyright (c) 2012 Mobytz. All rights reserved.
//

#import "Account.h"

@interface Account ()

@end

@implementation Account
@synthesize segment;
@synthesize toggleSwitch;

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

- (void)viewDidUnload
{
    [self setToggleSwitch:nil];
    [self setSegment:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)loginType:(id)sender {
    

}

- (IBAction)loggedIn:(id)sender {
    if(toggleSwitch.on){
        //[toggleSwitch setOn:NO animated:YES];
    }
    else{
        
        //[toggleSwitch setOn:YES animated:YES];
    }
}
- (void)dealloc {
    [toggleSwitch release];
    [segment release];
    [super dealloc];
}
@end
