//
//  TagViewController.h
//  TMS
//
//  Created by kiran babu davis on 23/02/2012.
//  Copyright 2012 entee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCLController.h"
#import "databaseClass.h"
#import "contacts.h"
#import "TMSAppDelegate.h"
#import "PickerControlViewController.h"


@interface TagViewController : UIViewController <MyCLControllerDelegate,UITextFieldDelegate> {
    
    IBOutlet UIView *tagView;
    NSInteger currentStar;
    
    IBOutlet UITextField *userName;
    IBOutlet UITextField *locationName;
    MyCLController *locationController;
    float curLatitude , curLongitude;
    databaseClass    *databaseObj;
    NSInteger shag;
    NSInteger isMale;
    
    IBOutlet UIView *acceptView;
    NSInteger accept;
    IBOutlet UILabel *scorelb;
    
    IBOutlet UILabel *namelb;
    TMSAppDelegate  *deleg;
}
@property (retain, nonatomic) IBOutlet UILabel *lbl_Type;
@property (retain, nonatomic) IBOutlet UITextField *txt_Whom,*txt_Type;
@property (retain, nonatomic) PickerControlViewController *ctrl;
@property (retain, nonatomic) IBOutlet UIWebView *webView;
-(IBAction)showmytag:(id)sender;
-(IBAction)savemytag:(id)sender;
-(IBAction)selectStar:(id)sender;
-(IBAction)locEntry:(id)sender;
-(IBAction)cancel:(id)sender;
- (IBAction)showShagType:(id)sender;

-(IBAction)male:(id)sender;
-(IBAction)fmale:(id)sender;
-(IBAction)iaccept:(id)sender;
-(void) showPoints;
-(void) showSplash;
-(void) hideSplash;
-(void)pickerDone;
-(IBAction)contact:(id)sender;
-(void)pickerSelected:(NSNotification *) notification;
-(void)unlockAchievement:(NSString*)type;

@property (nonatomic,retain) IBOutlet UIView *tagView;


@end
