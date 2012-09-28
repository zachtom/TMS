//
//  TagViewController.m
//  TMS
//
//  Created by kiran babu davis on 23/02/2012.
//  Copyright 2012 entee. All rights reserved.
//

#import "TagViewController.h"
#import "SplashViewController.h"
#import "ProfileView.h"
#import "WebService.h"
#import "Global.h"
#import "Types.h"
#import "Points.h"
@implementation TagViewController
@synthesize lbl_Type;
@synthesize txt_Whom,txt_Type,ctrl;
@synthesize webView;
@synthesize tagView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [txt_Whom release];
    [webView release];
    [lbl_Type release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(IBAction)locEntry:(id)sender
{
    CGRect frame;
    frame = [tagView frame];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
	frame.origin.y=0;
	tagView.frame = frame;
    [UIView commitAnimations];
}

- (void)locationUpdate:(CLLocation *)location {
    
    curLatitude = location.coordinate.latitude;
    curLongitude = location.coordinate.longitude;
	
}

- (void)locationError:(NSError *)error {
	
}

-(IBAction)iaccept:(id)sender;
{
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%d",isMale] forKey:@"male"];
    
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"accept",isMale] forKey:@"accept"];
    
    acceptView.hidden = TRUE;
}

-(IBAction)fmale:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    
    if ([segmentedControl selectedSegmentIndex] == 0 )
    {
        isMale = 1;
    }
    
    else if ([segmentedControl selectedSegmentIndex] == 1 )
    {
        isMale = 0;
    }

}

-(IBAction)contact:(id)sender
{
 
    deleg.contactMode = 1;
    contacts * cn = [[contacts alloc] init];
    [self.navigationController pushViewController:cn animated:NO];
}

-(IBAction)selectStar:(id)sender
{
    UIButton *pbt = (UIButton *) sender;
   
    
    if ([pbt.currentTitle isEqual:@"unstar"])
    {
        NSLog(@"Unstar");
        
        currentStar = pbt.tag;
        
        if (pbt.tag == 1 )
        {
            UIImage  *btnImage = [UIImage imageNamed:@"star.png"];
            [pbt setImage:btnImage forState:UIControlStateNormal];
            [pbt setTitle:@"star" forState:UIControlStateNormal];
           
        }
        else
        {
        
        for (UIButton *bt in self.tagView.subviews)
        {
           if ((bt.tag <= pbt.tag ) && (bt.tag > 0)) 
           {
               UIImage  *btnImage = [UIImage imageNamed:@"star.png"];
               [bt setImage:btnImage forState:UIControlStateNormal];
               [bt setTitle:@"star" forState:UIControlStateNormal];
               
               
           }
            
            else   if ((bt.tag > pbt.tag ) && (bt.tag > 0)) 
            {
                UIImage  *btnImage = [UIImage imageNamed:@"unstar.png"];
                [bt setImage:btnImage forState:UIControlStateNormal];
                [bt setTitle:@"unstar" forState:UIControlStateNormal];
                
            }
         
        }
               
        }
        
    }
    
    else 
        {
            
            NSLog(@"star");
             currentStar = pbt.tag-1;
            
            if (pbt.tag == 5 )
            {
                UIImage  *btnImage = [UIImage imageNamed:@"unstar.png"];
                [pbt setImage:btnImage forState:UIControlStateNormal];
                [pbt setTitle:@"unstar" forState:UIControlStateNormal];
                
            }
            else
            {
                
                for (UIButton *bt in self.tagView.subviews)
                {
                    if ((bt.tag >= pbt.tag )  && (bt.tag > 0))
                    {
                        UIImage  *btnImage = [UIImage imageNamed:@"unstar.png"];
                        [bt setImage:btnImage forState:UIControlStateNormal];
                        [bt setTitle:@"unstar" forState:UIControlStateNormal];
                        
                       
                    }
                    
                    else if ((bt.tag < pbt.tag )  && (bt.tag > 0))
                    {
                        UIImage  *btnImage = [UIImage imageNamed:@"star.png"];
                        [bt setImage:btnImage forState:UIControlStateNormal];
                        [bt setTitle:@"star" forState:UIControlStateNormal];
                        
                    }
                    
                }
                
            }
            
            
        }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event    
{
    CGRect frame;
    frame = [tagView frame];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
	frame.origin.y=71;
	tagView.frame = frame;
    [UIView commitAnimations];
    [txt_Whom resignFirstResponder];
    [userName resignFirstResponder];
    [locationName resignFirstResponder];
    [txt_Type resignFirstResponder];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField.placeholder isEqualToString:@"Type?"]) 
    {
        
    }
    
    
    
}

-(IBAction)showmytag:(id)sender
{
    currentStar = 1;
   tagView.hidden = FALSE; 
    
}



-(IBAction)cancel:(id)sender
{
   tagView.hidden = TRUE; 
}

- (IBAction)showShagType:(id)sender 
{
    
    [txt_Whom resignFirstResponder];
    [userName resignFirstResponder];
    [locationName resignFirstResponder];
    [txt_Type resignFirstResponder];
    CGRect frame = CGRectMake(0,0, 320, 216);
    self.ctrl = [[PickerControlViewController alloc] init ];
    ctrl.view.frame = frame;
    if ( [[[NSUserDefaults standardUserDefaults] valueForKey:@"sex"] isEqualToString:@"Male"])
    {
        ctrl.items = [Types getmaleTypes];
    }
    else 
    {
        ctrl.items = [Types getFemaleTypes];
    }
    CGRect _frame = CGRectMake(0,134, 320, 277);
    //[self.view addSubview:ctrl.view];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    frame.origin.x = 0;
    ctrl.view.frame = _frame;
    [self.view addSubview:ctrl.view];
    
    //[ctrl release];
    [UIView commitAnimations];
}

-(IBAction)savemytag:(id)sender
{
     tagView.hidden = TRUE;
    
    
    
    [userName resignFirstResponder];
    [locationName resignFirstResponder];
    
     NSMutableDictionary *paylodDict = [[NSMutableDictionary  alloc] init];
    
     NSLog(@"%d",currentStar);
    [paylodDict setValue:[NSString stringWithFormat:@"%d",currentStar] forKey:@"starCount"];
    [paylodDict setValue:[NSString stringWithFormat:@"%@",txt_Whom.text] forKey:@"userName"];
    [paylodDict setValue:self.lbl_Type.text forKey:@"type"];
    
    [paylodDict setValue:[NSString stringWithFormat:@"%@",locationName.text] forKey:@"locName"];
    [paylodDict setValue:[NSString stringWithFormat:@"%.4f",curLatitude] forKey:@"latitude"];
    [paylodDict setValue:[NSString stringWithFormat:@"%.4f",curLongitude] forKey:@"longitude"];
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEEE MMMM d, YYYY HH:mm"];
    NSString *dateString = [dateFormat stringFromDate:today];
    [dateFormat release];
    
    [paylodDict setValue:[NSString stringWithFormat:@"%@",dateString] forKey:@"timedate"];
    NSString *pntStr;
    NSInteger shagType;
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"sex"] isEqual:@"Male"])
    {
        // Need to Append point logic
        pntStr = [NSString stringWithFormat:@"m%d",shag+1];
        shagType = shag+13;
    }
    else {
        pntStr = [NSString stringWithFormat:@"f%d",shag+1];
        shagType = shag;
    }
    
    
    [paylodDict setValue:[NSString stringWithFormat:@"%d",[Points getPoint:pntStr]] forKey:@"points"];
    
    NSMutableDictionary *dt = [[NSMutableDictionary alloc] init];
    dt = [databaseObj dbFieldExist:paylodDict];
    
    NSInteger curPoint = [[dt valueForKey:@"points"] integerValue];
	NSString *namestrOld  = [dt valueForKey:@"name"];
    
    if ( curPoint == 0)
    {
    [databaseObj dbInsert:paylodDict];
    
    }
    else
    {
        [paylodDict setValue:[NSString stringWithFormat:@"%d",curPoint+30] forKey:@"points"];
        NSString *namestrNew  = [paylodDict valueForKey:@"userName"];
        
        [paylodDict setValue:[NSString stringWithFormat:@"%@+%@",namestrOld,namestrNew] forKey:@"userName"];
        
        [databaseObj updateDB:paylodDict];
    }
    [paylodDict release];
    [WebService createTagWith:txt_Whom.text place:locationName.text latitude:[NSString stringWithFormat:@"%.4f",curLatitude] longitude:[NSString stringWithFormat:@"%.4f",curLongitude] rating:[NSString stringWithFormat:@"%d",currentStar] andType:shagType];
    [self unlockAchievement:self.lbl_Type.text];
    
    [self showPoints];
    currentStar = 1;
    txt_Whom.text = @"";
    txt_Type.text = @"";
    lbl_Type.text = @"";
    locationName.text = @"";
    
    for (UIButton *bt in self.tagView.subviews)
    {
        if ((bt.tag <= currentStar ) && (bt.tag > 0)) 
        {
            UIImage  *btnImage = [UIImage imageNamed:@"star.png"];
            [bt setImage:btnImage forState:UIControlStateNormal];
            [bt setTitle:@"star" forState:UIControlStateNormal];
            
            
        }
        
        else   if ((bt.tag > currentStar ) && (bt.tag > 0)) 
        {
            UIImage  *btnImage = [UIImage imageNamed:@"unstar.png"];
            [bt setImage:btnImage forState:UIControlStateNormal];
            [bt setTitle:@"unstar" forState:UIControlStateNormal];
            
        }
        
    }
    
}



-(void)unlockAchievement:(NSString *)type
{
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"achievement.plist"]; //3
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"achievement" ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
    }
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    int size = [[data allKeys] count];
    //NSArray *keys = [data allKeys];
    NSMutableSet *unlockedAchievements = [[NSMutableSet alloc] init];
    //here add elements to data file and write data to file
    int value = 1;
    int total = 0;
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"sex"] isEqualToString:@"Male"])
    {
        total = 11;
    }
    else {
        total = 13;
    }
    
    
    if ((size/total) == 1)
    {
        [data setObject:[NSNumber numberWithInt:value] forKey:@"Anti Prudish"];
        [unlockedAchievements addObject:@"Anti Prudish"];
    }
    else if((size/total >=.75))
    {
        [data setObject:[NSNumber numberWithInt:value] forKey:@"Experienced"];
        [unlockedAchievements addObject:@"Experienced"];
    }
    else if((size/total >=.5))
    {
        [data setObject:[NSNumber numberWithInt:value] forKey:@"Try-Sexual"];
        [unlockedAchievements addObject:@"Try-Sexual"];
    }
    else if((size/total >=.25))
    {
        [data setObject:[NSNumber numberWithInt:value] forKey:@"TMS Champion"];
        [unlockedAchievements addObject:@"TMS Champion"];
    }
    [WebService unlockAchievement:0];
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:type] != NULL)
    {
        NSString *date = [[NSUserDefaults standardUserDefaults] valueForKey:type];
        NSDate *curDate = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"ddMMyyyy hh:mm:ss"];
        NSDate *dt = [dateFormat dateFromString:date];
        
        NSTimeInterval secondsBetween = [curDate timeIntervalSinceDate:dt];
        if (secondsBetween <= ((60*60)*3))
        {
            [data setObject:[NSNumber numberWithInt:value] forKey:@"Ultimate Player"];
            [unlockedAchievements addObject:@"Ultimate Player"];
        }
        else if (secondsBetween <= ((60*60)*6)) 
        {
            [data setObject:[NSNumber numberWithInt:value] forKey:@"Easy Pickings"];
            [unlockedAchievements addObject:@"Easy Pickings"];
        }
        else if (secondsBetween <= ((60*60)*12)) 
        {
            [data setObject:[NSNumber numberWithInt:value] forKey:@"Im On it, On it, On it"];
            [unlockedAchievements addObject:@"Im On it, On it, On it"];
        }
        else if ((secondsBetween/86400) <= 7) 
        {
            [data setObject:[NSNumber numberWithInt:value] forKey:@"Me So Horny"];
            [unlockedAchievements addObject:@"Me So Horny"];
        }
        else if ((secondsBetween/86400) <= 14) 
        {
            [data setObject:[NSNumber numberWithInt:value] forKey:@"UK Average"];
            [unlockedAchievements addObject:@"UK Average"];
        }
        else if ((secondsBetween/86400) <= 30) 
        {
            [data setObject:[NSNumber numberWithInt:value] forKey:@"Flirter"];
            [unlockedAchievements addObject:@"Flirter"];
        }
        
        [WebService unlockAchievement:0];
    }
    else 
    {
        NSDate *curDate = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"ddMMyyyy hh:mm:ss"];
        [[NSUserDefaults standardUserDefaults] setValue:[dateFormat stringFromDate:curDate] forKey:type];
    }
    
    if (size == total + 10)
    {
        [data setObject:[NSNumber numberWithInt:value] forKey:@"Ultimate Sex God"];
        [unlockedAchievements addObject:@"Ultimate Sex God"];
        [WebService unlockAchievement:0];
    }
    
    [data setObject:[NSNumber numberWithInt:value] forKey:type];
    [unlockedAchievements addObject:type];
    [WebService unlockAchievement:0];
    
    [data writeToFile: path atomically:YES];
    [data release];
    for(NSString* type in unlockedAchievements)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Achivement Unlocked!" message:[NSString stringWithFormat:@"You have unlocked achievement %@!!",type] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}


-(void) showPoints
{
    NSMutableArray *pointArry = [[NSMutableArray alloc] init];
    pointArry = [databaseObj dbRetrieve];
    NSInteger points = 0;
    
    for ( int i = 0 ; i < [ pointArry  count] ; i++ )
    {
        tagObj *ob = [[tagObj alloc] init];
        ob = [pointArry objectAtIndex:i];
        
        points = points + ob.points;
    }
    
    scorelb.text = [NSString stringWithFormat:@"Score:%d",points];
    
}
-(void) showSplash
{
    SplashViewController *splashViewController = [[SplashViewController alloc] initWithNibName:@"SplashViewController" bundle:nil];
    
    [self presentModalViewController:splashViewController animated:NO];
    [splashViewController release];
    
    [self performSelector:@selector(hideSplash) withObject:nil afterDelay:2.5];
}
-(void) hideSplash
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [self dismissModalViewControllerAnimated:YES];
    
    //[self.view setNeedsDisplay];
    
    
}

-(void)pickerSelected:(NSNotification *) notification
{
    NSDictionary *userInfo = notification.userInfo;
    NSString *row = [userInfo objectForKey:@"ROW"];
    NSInteger _row = [row integerValue];
    shag  = _row;
    self.lbl_Type.text = [self.ctrl.items objectAtIndex:_row];
    
    //[self.ctrl.view removeFromSuperview];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(pickerSelected:) 
                                                 name:NOTIF_PICKERSELECTED object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(pickerDone) 
                                                 name:NOTIF_PICKERDONE object:nil];
    [self showSplash];
    deleg= (TMSAppDelegate *) [[UIApplication sharedApplication] delegate];
    
    if ( ![[[NSUserDefaults standardUserDefaults] valueForKey:@"account"] isEqual:@"created"])
    {
        self.hidesBottomBarWhenPushed = YES;
        ProfileView *pv = [[[ProfileView alloc] initWithNibName:@"ProfileView" bundle:nil] autorelease];
        [self.navigationController pushViewController:pv animated:YES];
        self.hidesBottomBarWhenPushed = NO;
        if ( [[[NSUserDefaults standardUserDefaults] valueForKey:@"accept"] isEqual:@"accept"])
        {
            acceptView.hidden  = TRUE;
        }
        
        else
        {
            acceptView.hidden  = FALSE;
        }
    }
    else {
        //Account exists please login.
    }
    
    
    NSString *path;
	NSBundle *thisBundle = [NSBundle mainBundle];
	path = [thisBundle pathForResource:@"tc" ofType:@"html"];
	
	// make a file: URL out of the path
	NSURL *url = [NSURL fileURLWithPath:path];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    isMale = 1;
    self.navigationController.navigationBar.hidden = TRUE;
    tagView.hidden = TRUE;
    locationController = [[MyCLController alloc] init];
	locationController.delegate = self;
    [locationController.locationManager startUpdatingLocation];
    // Do any additional setup after loading the view from its nib.
    databaseObj  = [[databaseClass alloc] init];
    
    currentStar = 1;
}

-(void) viewWillAppear:(BOOL)animated
{
    txt_Whom.text = deleg.nameSel;
    [self.navigationController popToRootViewControllerAnimated:FALSE];
    [self showPoints];
}

-(void)pickerDone
{
    CGRect frame = CGRectMake(0,194, 320, 216);
    CGRect _frame = CGRectMake(0,480, 320, 216);
    //[self.view addSubview:ctrl.view];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    frame.origin.x = 0;
    ctrl.view.frame = _frame;
    
    
    //[ctrl release];
    [UIView commitAnimations];
    
    
}
- (void)viewDidUnload
{
    [self setTxt_Whom:nil];
    [self setWebView:nil];
    [self setLbl_Type:nil];
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
