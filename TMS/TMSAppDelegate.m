//
//  TMSAppDelegate.m
//  TMS
//
//  Created by kiran babu davis on 23/02/2012.
//  Copyright 2012 entee. All rights reserved.
//

#import "TMSAppDelegate.h"
#import "SideMenuController.h"
#import "MFSideMenu.h"
#import "Appirater.h"
#import "WebService.h"
@implementation TMSAppDelegate


@synthesize window=_window;
@synthesize mapMode,obj,nameSel,contactMode,individualTagMode,navigationController;

@synthesize tabBarController=_tabBarController;

- (BOOL)handleOpenURL:(NSURL*)url
{
    NSString* scheme = [url scheme];
    NSString* prefix = [NSString stringWithFormat:@"fb%@", SHKCONFIG(facebookAppId)];
    if ([scheme hasPrefix:prefix])
        return [SHKFacebook handleOpenURL:url];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation 
{
    return [self handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url 
{
    return [self handleOpenURL:url];  
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	//userId = 1;
	// launchOptions has the incoming notification if we're being launched after the user tapped "view"
	NSLog( @"didFinishLaunchingWithOptions:%@", launchOptions );
	
	//	[self.viewController handleDidReceiveRemoteNotification:userInfo];
	
	
	// other setup tasks here.... 
    [[UIApplication sharedApplication] 
	 registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | 
										 UIRemoteNotificationTypeSound |
										 UIRemoteNotificationTypeAlert)]; 
	
    // [self updateWithRemoteData];  // freshen your app!
	
	// RESET THE BADGE COUNT
    application.applicationIconBadgeNumber = 0; 
	
    // ... 
	// call the original applicationDidFinishLaunching method to handle the basic view setup tasks
    
    
	[self applicationDidFinishLaunching:application];
	
	return YES;
}

- (void)application:(UIApplication *)app 
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken 
{ 
    NSString *inDeviceTokenStr = [devToken description];
	NSString *tokenString = [inDeviceTokenStr stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"< >"]];
	tokenString = [tokenString stringByReplacingOccurrencesOfString:@" " withString:@""];
    [[NSUserDefaults standardUserDefaults] setValue:tokenString forKey:@"token"];
    //[self sendDeviceTokenToRemote:devToken]; // send the token to your server 
}

- (void)application:(UIApplication *)app 
didFailToRegisterForRemoteNotificationsWithError:(NSError *)err { 
    NSLog(@"Failed to register, error: %@", err); 
} 

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
	NSLog( @"didReceiveRemoteNotification:%@", userInfo );
	//[self.viewController handleDidReceiveRemoteNotification:userInfo];
	
}

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
    mapMode = 1;
    obj = [[tagObj alloc] init];
    nameSel = @"";
    [WebService fetchStoryOfDay];
    contactMode = 1;
    [Appirater appLaunched];
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    //return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


-(void) showPoints 
{
    
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}


// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (tabBarController.selectedIndex == 4)
    {
        SideMenuController *sideMenuViewController = [[SideMenuController alloc] initWithNibName:@"SideMenuController" bundle:nil];
        
        // make sure to display the navigation controller before calling this
        [MFSideMenuManager configureWithNavigationController:self.navigationController 
                                          sideMenuController:sideMenuViewController];
    }
}


/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
