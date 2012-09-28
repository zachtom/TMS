//
//  TagEditController.h
//  TMS
//
//  Created by Zachariah Tom on 11/08/2012.
//  Copyright (c) 2012 Mobytz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerControlViewController.h"
#import "MyCLController.h"
#import "TMSAppDelegate.h"
#import "databaseClass.h"

@interface TagEditController : UIViewController<MyCLControllerDelegate,UITextFieldDelegate>
{
    NSInteger currentStar;
    TMSAppDelegate  *deleg;
    databaseClass    *databaseObj;
    NSInteger _row;
}
@property (retain, nonatomic) IBOutlet UITextField *txt_Type;
@property (retain, nonatomic) IBOutlet UIButton *star4;
@property (retain, nonatomic) IBOutlet UIButton *star5;
@property (retain, nonatomic) IBOutlet UITextField *txt_Place;
@property (retain, nonatomic) IBOutlet UITextField *txt_Name;
@property (retain, nonatomic) IBOutlet UIButton *star3;
@property (retain, nonatomic) PickerControlViewController *ctrl;
@property (retain, nonatomic) IBOutlet UIButton *star1;
@property (retain, nonatomic) IBOutlet UIButton *star2;
- (IBAction)updateTag:(id)sender;
- (IBAction)back:(id)sender;
-(void)pickerDone;
@end
