//
//  TagEditController.m
//  TMS
//
//  Created by Zachariah Tom on 11/08/2012.
//  Copyright (c) 2012 Mobytz. All rights reserved.
//

#import "TagEditController.h"
#import "contacts.h"
#import "Types.h"
#import "Points.h"
@interface TagEditController ()

@end

@implementation TagEditController
@synthesize txt_Type;
@synthesize star4;
@synthesize star5;
@synthesize txt_Place;
@synthesize txt_Name;
@synthesize star3;
@synthesize ctrl;
@synthesize star1;
@synthesize star2;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    deleg = (TMSAppDelegate*)[[UIApplication sharedApplication] delegate];
    databaseObj  = [[databaseClass alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(pickerDone) 
                                                 name:NOTIF_PICKERDONE object:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.txt_Place.text = deleg.obj.locationName;
    
    self.txt_Type.text = deleg.obj.type;
    NSArray *nameArr  = [ deleg.obj.userName componentsSeparatedByString:@"+"];
    self.txt_Name.text = [nameArr objectAtIndex:0];
    currentStar = deleg.obj.starCount;
    if (star1.tag <= deleg.obj.starCount)
    {
        [star1  setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
    
    if (star2.tag <= deleg.obj.starCount)
    {
        [star2  setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
    
    if (star3.tag <= deleg.obj.starCount)
    {
        [star3  setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
    
    if (star4.tag <= deleg.obj.starCount)
    {
        [star4  setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
    
    if (star5.tag <= deleg.obj.starCount)
    {
        [star5  setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    }
}

- (void)viewDidUnload
{
    [self setTxt_Name:nil];
    [self setTxt_Place:nil];
    [self setTxt_Type:nil];
    [self setStar1:nil];
    [self setStar2:nil];
    [self setStar3:nil];
    [self setStar4:nil];
    [self setStar5:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
            
            for (UIView *v in self.view.subviews)
            {
                if([v isKindOfClass:[UIButton class]])
                {
                    UIButton *bt = (UIButton*)v;
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
            for (UIView *view in self.view.subviews)
            {
                if ([view isKindOfClass:[UIButton class]])
                {
                    UIButton *bt = (UIButton*)view;
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
}

-(void)pickerSelected:(NSNotification *) notification
{
    NSDictionary *userInfo = notification.userInfo;
    NSString *row = [userInfo objectForKey:@"ROW"];
    _row = [row integerValue];
    self.txt_Type.text = [self.ctrl.items objectAtIndex:_row];
       //[self.ctrl.view removeFromSuperview];
}

-(void)pickerDone
{
    self.txt_Type.text = [self.ctrl.items objectAtIndex:_row];
    if (_row == 0)
    {
       // self.txt_Type.text = [self.ctrl.items objectAtIndex:_row];
    }
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

-(IBAction)contact:(id)sender
{
    
    deleg.contactMode = 1;
    contacts * cn = [[contacts alloc] init];
    [self.navigationController pushViewController:cn animated:NO];
}

- (void)dealloc {
    [txt_Name release];
    [txt_Place release];
    [txt_Type release];
    [star1 release];
    [star2 release];
    [star3 release];
    [star4 release];
    [star5 release];
    [super dealloc];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txt_Place resignFirstResponder];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [txt_Type resignFirstResponder];
    [txt_Name resignFirstResponder];
    if (textField.tag == 1) 
    {
        deleg.contactMode = 1;
        contacts * cn = [[contacts alloc] init];
        [self.navigationController pushViewController:cn animated:NO];
    }
    else if (textField.tag == 2) 
    {
        // Add Place
    }
    else if (textField.tag == 3) 
    {
        CGRect frame = CGRectMake(0,0, 320, 216);
        self.ctrl = [[PickerControlViewController alloc] init ];
        ctrl.view.frame = frame;
        _row = 0;
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
    
    
}

- (IBAction)updateTag:(id)sender 
{
    NSMutableDictionary *paylodDict = [[NSMutableDictionary  alloc] init];
    
    NSLog(@"%d",currentStar);
    [paylodDict setValue:[NSString stringWithFormat:@"%d",currentStar] forKey:@"starCount"];
    [paylodDict setValue:[NSString stringWithFormat:@"%@",txt_Name.text] forKey:@"userName"];
    
    
    [paylodDict setValue:[NSString stringWithFormat:@"%@",txt_Place.text] forKey:@"locName"];
    //[paylodDict setValue:[NSString stringWithFormat:@"%.4f",curLatitude] forKey:@"latitude"];
    //[paylodDict setValue:[NSString stringWithFormat:@"%.4f",curLongitude] forKey:@"longitude"];
    [paylodDict setValue:[NSString stringWithFormat:@"%d",deleg.obj.rowid ] forKey:@"rowid"];
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEEE MMMM d, YYYY HH:mm"];
    NSString *dateString = [dateFormat stringFromDate:today];
    [dateFormat release];
    
    [paylodDict setValue:[NSString stringWithFormat:@"%@",dateString] forKey:@"timedate"];
    NSString *pntStr;
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"sex"] isEqual:@"Male"])
    {
        // Need to Append point logic
        pntStr = [NSString stringWithFormat:@"m%d",_row+1];
        
    }
    else {
        pntStr = [NSString stringWithFormat:@"f%d",_row+1];
        
    }
    
    
    [paylodDict setValue:[NSString stringWithFormat:@"%d",[Points getPoint:pntStr]] forKey:@"points"];
    
    NSMutableDictionary *dt = [[NSMutableDictionary alloc] init];
    dt = [databaseObj dbFieldExist:paylodDict];
    
    NSInteger curPoint = [[dt valueForKey:@"points"] integerValue];
	NSString *namestrOld  = [dt valueForKey:@"name"];
    
    if ( curPoint == 0)
        
    {
        [databaseObj updateDB:paylodDict];
        
    }
    else
    {
        [paylodDict setValue:[NSString stringWithFormat:@"%d",curPoint+30] forKey:@"points"];
        NSString *namestrNew  = [paylodDict valueForKey:@"userName"];
        
        [paylodDict setValue:[NSString stringWithFormat:@"%@+%@",namestrOld,namestrNew] forKey:@"userName"];
        
        [databaseObj updateDB:paylodDict];
    }
    [paylodDict release];
}

- (IBAction)back:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
