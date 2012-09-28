//
//  contacts.h
//  TMS
//
//  Created by kiran babu davis on 04/03/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "loccell.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "contactCell.h"
#import "TMSAppDelegate.h"
#import "tagObj.h"


@interface contacts : UIViewController
{
    NSArray *contactArray;
    NSMutableArray *arrContact;
    
    IBOutlet UITableView *tbView;
    TMSAppDelegate *deleg;
    
    IBOutlet UIToolbar *tb;
}

-(IBAction)back:(id)sender;

@end
