//
//  ProfileView.h
//  TMS
//
//  Created by Zachariah Tom on 31/07/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerControlViewController.h"

@interface ProfileView : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    int relationIndex,sexIndex;
    CGRect keyboardBounds;
}

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,retain) IBOutlet UITextField *txt_FName,*txt_LName,*txt_Password,*txt_RePassword,*txt_Age,*txt_Sexuality;
@property (retain, nonatomic) PickerControlViewController *ctrl;
@property(nonatomic,retain) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) IBOutlet UISegmentedControl *seg_Status,*seg_Sex;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellRePassword;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellFName;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellLName;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellUName;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellAge;
@property (retain, nonatomic) IBOutlet UITextField *txt_UserName;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellPassword;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellSex;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellStatus;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellSexuality;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellBtn;
- (IBAction)saveProfile:(id)sender;
- (IBAction)relationChanged:(id)sender;
- (IBAction)sexChanged:(id)sender;
-(void)hideKeyBoard;
-(NSString *) genRandString:(NSString*) string ofLength: (int) len;
-(void)pickerDone;
- (void)scrollViewToCenterOfScreen:(UIView *)theView; 
@end
