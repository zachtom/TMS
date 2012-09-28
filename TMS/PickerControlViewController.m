//
//  PickerControlViewController.m
//  TMS
//
//  Created by Zachariah Tom on 01/08/2012.
//  Copyright (c) 2012 Mobytz. All rights reserved.
//

#import "PickerControlViewController.h"
#import "TMSAppDelegate.h"
@interface PickerControlViewController ()

@end

@implementation PickerControlViewController
@synthesize items,picker;
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//PickerViewController.m
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;
}

//PickerViewController.m
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [self.items count];
}

//PickerViewController.m
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.items objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
   // NSLog(@"Selected Color: %@. Index of selected color: %i", [self.items objectAtIndex:row], row);
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:row] forKey:@"ROW"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIF_PICKERSELECTED object:nil userInfo:userInfo];
}

-(IBAction)pressDone:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIF_PICKERDONE object:nil userInfo:nil];
}
@end
