//
//  FirstViewController.m
//  TMS
//
//  Created by kiran babu davis on 23/02/2012.
//  Copyright 2012 entee. All rights reserved.
//

#import "FirstViewController.h"
#import "TagEditController.h"
#import "SHK.h"
#import "Points.h"
#import "Types.h"
@implementation FirstViewController
@synthesize tabView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden= TRUE;
    dbObj = [[databaseClass  alloc] init];
    delegate = (TMSAppDelegate *) [[UIApplication sharedApplication] delegate];
    tagArray = [[NSMutableArray alloc] init];
    tagArray = [dbObj dbRetrieve]; 
    tabView.backgroundColor = [UIColor clearColor];
    [tabView reloadData];
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController popToRootViewControllerAnimated:FALSE];
    tagArray = [dbObj dbRetrieve]; 
    [tabView reloadData];
}

#pragma mark - ShareKit Call
-(void) shareClicked
{
    // Create the item to share (in this example, a url)
	SHKItem *item = [SHKItem text:@"Share my Shag"];
    
	// Get the ShareKit action sheet
	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
    
	// Display the action sheet
	[actionSheet showFromToolbar:self.navigationController.toolbar];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 121;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tagArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"loccell";
    
	loccell *stockCell = (loccell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (stockCell == nil) 
	{
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
		
		for (id currentObject in topLevelObjects)
		{
			if ([currentObject isKindOfClass:[UITableViewCell class]])
			{
				stockCell =  (loccell *) currentObject;
				break;
			}
		}
    	
    }
    
    tagObj *obj = [[tagObj alloc] init];
    obj = [tagArray objectAtIndex: indexPath.row];
    stockCell.location.text = obj.locationName;
    stockCell.pointslb.text = [NSString stringWithFormat:@"%d",obj.points];
    stockCell.datelb.text = obj.dateTime;
    int itemPoint = 0;
    NSInteger curpoints = obj.points;
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"sex"] isEqualToString:@"Male"])
    {
        NSInteger index = [[Types getmaleTypes] indexOfObject:obj.type];
        itemPoint = [Points getPoint:[NSString stringWithFormat:@"m%d",index]];
    }
    else 
    {
        NSInteger index = [[Types getFemaleTypes] indexOfObject:obj.type];
        itemPoint = [Points getPoint:[NSString stringWithFormat:@"f%d",index]];
    }
    //curpoints = curpoints - 50;
    NSInteger tagCount = (curpoints-itemPoint) / itemPoint;
    stockCell.tablb.text = [NSString stringWithFormat:@"%d",tagCount + 1];
    NSLog(@"starCount %d" , obj.starCount);
    
    /*
    for (UIButton *bt in stockCell.subviews)
    {
        if (bt.tag <= obj.starCount)
        {
           [bt setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        }
        
        else
        {
            [bt setImage:[UIImage imageNamed:@"unstar.png"] forState:UIControlStateNormal];
        }
    }
     */
    
    if (stockCell.star1.tag <= obj.starCount)
    {
        [stockCell.star1  setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
    
    if (stockCell.star2.tag <= obj.starCount)
    {
        [stockCell.star2  setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
    
    if (stockCell.star3.tag <= obj.starCount)
    {
        [stockCell.star3  setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
    
    if (stockCell.star4.tag <= obj.starCount)
    {
        [stockCell.star4  setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
    
    if (stockCell.star5.tag <= obj.starCount)
    {
        [stockCell.star5  setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
    
    return stockCell;	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    tagObj *obj = [[tagObj alloc] init];
    obj = [tagArray objectAtIndex: indexPath.row];
    delegate.obj = obj;
    delegate.mapMode = 0;
    delegate.contactMode = 0;
    
    contacts *c = [[contacts alloc] init];
    [self.navigationController pushViewController:c animated:FALSE];
    
    //[self.tabBarController setSelectedIndex:2];
    //[[self.tabBarController selectedViewController] loadView];
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    delegate.obj = nil;
    tagObj *obj = [[tagObj alloc] init];
    obj = [tagArray objectAtIndex: indexPath.row];
    
    delegate.obj = obj;
    delegate.mapMode = 0;
    delegate.contactMode = 0;
    
    TagEditController *tg = [[TagEditController alloc] initWithNibName:@"TagEditController" bundle:nil];
    [self.navigationController pushViewController:tg animated:FALSE];
}

-(IBAction)share:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    UITableViewCell *buttonCell = (UITableViewCell*)[[btn superview] superview];
    NSIndexPath *indexPath = [self.tabView indexPathForCell:buttonCell];
    NSInteger section = indexPath.section;
	NSInteger buttonRow = indexPath.row;
    tagObj *obj = (tagObj*)[tagArray objectAtIndex: indexPath.row];
    [self shareClicked];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [super dealloc];
}

@end
