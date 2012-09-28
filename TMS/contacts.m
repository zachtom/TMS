//
//  contacts.m
//  TMS
//
//  Created by kiran babu davis on 04/03/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import "contacts.h"

@implementation contacts

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 62;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arrContact count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"contactCell";
    
	contactCell *stockCell = (contactCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (stockCell == nil) 
	{
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
		
		for (id currentObject in topLevelObjects)
		{
			if ([currentObject isKindOfClass:[UITableViewCell class]])
			{
				stockCell =  (contactCell *) currentObject;
				break;
			}
		}
    	
    }
    
    NSMutableDictionary *dicContact=[[NSMutableDictionary alloc] init];
    dicContact = [arrContact objectAtIndex:indexPath.row];
    stockCell.name.text = [dicContact objectForKey:@"name"];
    
    UIImage* image;
  
    
    for (int i = 0 ; i < [contactArray count] ; i ++ )
    {
    
        ABRecordRef person = [contactArray objectAtIndex:i];
        
        NSString *str=(NSString *) ABRecordCopyValue([contactArray objectAtIndex:i], kABPersonFirstNameProperty);
        
        if ( [str isEqual:stockCell.name.text])
        {
        
            if(ABPersonHasImageData(person))
            {
                image = [UIImage imageWithData:(NSData *)ABPersonCopyImageDataWithFormat(person,kABPersonImageFormatThumbnail )];
                stockCell.img.image = image;
                break;
            }
            break;
        }
    
    }
    
   
    
    
    return stockCell;	
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (deleg.contactMode == 1 )
    {
    NSMutableDictionary *dicContact=[[NSMutableDictionary alloc] init];
    dicContact = [arrContact objectAtIndex:indexPath.row];
    deleg.nameSel = [dicContact objectForKey:@"name"];
    [self.navigationController popViewControllerAnimated:FALSE];
   
    }
    
    else 
    {
        deleg.individualTagMode = 1;
        [self.tabBarController setSelectedIndex:2];
        [self.navigationController popViewControllerAnimated:FALSE];
        
    }
}



-(IBAction)back:(id)sender

{
    [self.navigationController popViewControllerAnimated:FALSE];
    
}


-(void) viewWillAppear:(BOOL)animated
{
    
 
 
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    deleg = (TMSAppDelegate *) [[UIApplication sharedApplication] delegate];
    
    ABAddressBookRef ab=ABAddressBookCreate();
    contactArray =(NSArray *)ABAddressBookCopyArrayOfAllPeople(ab);
    
    [contactArray sortUsingFunction:(int (*)(id, id, void *) ) ABPersonComparePeopleByName context:(void*)ABPersonGetSortOrdering()];
    
    arrContact=[[NSMutableArray alloc] init];
    
    if (deleg.contactMode == 1) 
    {
    
    for (int i=0;i<[contactArray count];i++) 
    {
        NSMutableDictionary *dicContact=[[NSMutableDictionary alloc] init];
        NSString *fName=(NSString *) ABRecordCopyValue([contactArray objectAtIndex:i], kABPersonFirstNameProperty);
        NSString *lName=(NSString *) ABRecordCopyValue([contactArray objectAtIndex:i], kABPersonLastNameProperty);
        NSString *name;
        if (lName != Nil) {
            name = [NSString stringWithFormat:@"%@ %@",fName,lName];
        }
        else {
            name = fName;
        }
        @try 
        {
            [dicContact setObject:name forKey:@"name"];
        }
        @catch (NSException * e) {
            [dicContact release];
            continue;
        }
        [arrContact addObject:dicContact];
        [dicContact release];
    }
        
    }
    
    else
    {
        tagObj *obj = deleg.obj;
        NSString *str = obj.userName;
        NSArray *nameArr  = [ str componentsSeparatedByString:@"+"];
        NSMutableArray *nmArr = [[NSMutableArray alloc] init];
        nmArr = [nameArr mutableCopy];
        
        for (int i = 0 ; i < [nmArr count] ; i++ )
        {
              NSMutableDictionary *dicContact=[[NSMutableDictionary alloc] init];
            @try 
            {
                [dicContact setObject:[nmArr objectAtIndex:i] forKey:@"name"];
            }
            @catch (NSException * e) {
                [dicContact release];
                continue;
            }
            [arrContact addObject:dicContact];
            [dicContact release];
        }
        
    }
    
    
    [tbView reloadData];
    

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
