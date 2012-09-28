//
//  SideMenuController.m
//  TMS
//
//  Created by Zachariah Tom on 31/07/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import "SideMenuController.h"
#import "MFSideMenu.h"
#import "Settings.h"
#import "ProfileView.h"
#import "Achievements.h"
#import "PrivacyPolicy.h"
#import "Support.h"
#import "Account.h"
@interface SideMenuController ()

@end

@implementation SideMenuController
@synthesize items;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.items = [NSArray arrayWithObjects:@"Achievements",@"Profile",@"TMS ID",@"Account",@"Privacy Policy",@"Support", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{
    return [NSString stringWithFormat:@"Select Option"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    UIImageView *separator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line.png"]]; 
    [cell.contentView addSubview: separator];
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    NSArray *controllers;
    switch (indexPath.row)
    {
        case 0:
        {
            Achievements *ac = [[Achievements alloc] initWithNibName:@"Achievements" bundle:nil];
            controllers = [NSArray arrayWithObject:ac];
            ac.title = [NSString stringWithFormat:@"Achievements"];
            break;
            
        }
            
        
        case 1:
        {
            ProfileView *pv = [[[ProfileView alloc] initWithNibName:@"ProfileView" bundle:nil] autorelease];
            controllers = [NSArray arrayWithObject:pv];
            pv.title = [NSString stringWithFormat:@"Profile"];
            break;
        }
        case 2:
        {
            Settings *demoController = [[[Settings alloc] initWithNibName:@"Settings" bundle:nil] autorelease];
            controllers = [NSArray arrayWithObject:demoController];
            demoController.title = [NSString stringWithFormat:@"TMS ID"];
            break;
        }
        case 4:
        {
            PrivacyPolicy *demoController = [[[PrivacyPolicy alloc] initWithNibName:@"PrivacyPolicy" bundle:nil] autorelease];
            controllers = [NSArray arrayWithObject:demoController];
            demoController.title = [NSString stringWithFormat:@"Privacy Policy"];
            break;
        }
        case 5:
        {
            Support *demoController = [[[Support alloc] initWithNibName:@"Support" bundle:nil] autorelease];
            controllers = [NSArray arrayWithObject:demoController];
            demoController.title = [NSString stringWithFormat:@"Support"];
            break;
        }
        case 3:
        {
            Account *demoController = [[[Account alloc] initWithNibName:@"Account" bundle:nil] autorelease];
            controllers = [NSArray arrayWithObject:demoController];
            demoController.title = [NSString stringWithFormat:@"Account"];
            break;
        }
        default:
        {
            Settings *demoController = [[[Settings alloc] initWithNibName:@"Settings" bundle:nil] autorelease];
            controllers = [NSArray arrayWithObject:demoController];
            demoController.title = [NSString stringWithFormat:@"Privacy Policy"];
            break;
        }
    }
    //Settings *demoController = [[[Settings alloc] initWithNibName:@"Settings" bundle:nil] autorelease];
    //demoController.title = [NSString stringWithFormat:@"Demo Controller #%d-%d", indexPath.section, indexPath.row];
    
    
    [MFSideMenuManager sharedManager].navigationController.viewControllers = controllers;
    [MFSideMenuManager sharedManager].navigationController.menuState = MFSideMenuStateHidden;
}

@end
