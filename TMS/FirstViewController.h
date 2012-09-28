//
//  FirstViewController.h
//  TMS
//
//  Created by kiran babu davis on 23/02/2012.
//  Copyright 2012 entee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "loccell.h"
#import "databaseClass.h"
#import "tagObj.h"
#import "TMSAppDelegate.h"
#import "contacts.h"


@interface FirstViewController : UIViewController<UITableViewDelegate> {
    IBOutlet UITableView *tabView;
    NSMutableArray *tagArray;
    databaseClass  *dbObj;
    TMSAppDelegate *delegate;
}
@property(nonatomic,retain) UITableView *tabView;;
-(IBAction)selectStar:(id)sender;
-(IBAction)contact:(id)sender;
-(void)pickerSelected:(NSNotification *) notification;
-(void)shareClicked;
-(IBAction)share:(id)sender;
@end
