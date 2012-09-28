//
//  Account.h
//  TMS
//
//  Created by Zachariah Tom on 25/09/2012.
//  Copyright (c) 2012 Mobytz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Account : UIViewController
@property (retain, nonatomic) IBOutlet UISegmentedControl *segment;
@property (retain, nonatomic) IBOutlet UISwitch *toggleSwitch;
- (IBAction)loginType:(id)sender;
- (IBAction)loggedIn:(id)sender;

@end
