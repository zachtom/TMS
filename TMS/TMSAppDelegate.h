//
//  TMSAppDelegate.h
//  TMS
//
//  Created by kiran babu davis on 23/02/2012.
//  Copyright 2012 entee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tagObj.h"
#import "SHKConfig.h"
#import "SHKFacebook.h"

#define NOTIF_PICKERSELECTED  @"NOTIF_PICKERSELECTED"
#define NOTIF_PICKERDONE  @"NOTIF_PICKERDONE"
@interface TMSAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

    NSInteger mapMode,contactMode,individualTagMode;
    tagObj *obj;
    
    NSString *nameSel;
}

@property (nonatomic) NSInteger mapMode,contactMode,individualTagMode;
@property (nonatomic,retain) tagObj *obj;
@property (nonatomic ,retain )  NSString *nameSel;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@end
