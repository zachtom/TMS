//
//  ProfileView.m
//  TMS
//
//  Created by Zachariah Tom on 31/07/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import "ProfileView.h"
#import "TMSAppDelegate.h"
#import "WebService.h"
@interface ProfileView ()

@end

@implementation ProfileView
@synthesize tableView;

@synthesize cellRePassword;
@synthesize cellFName;
@synthesize cellLName;
@synthesize cellUName;
@synthesize cellAge;
@synthesize txt_UserName;
@synthesize cellPassword;
@synthesize cellSex;
@synthesize cellStatus;
@synthesize cellSexuality;
@synthesize cellBtn;
@synthesize scrollView;
@synthesize seg_Status;
@synthesize txt_Sexuality,ctrl,txt_Age,txt_RePassword,txt_FName,txt_Password,txt_LName,seg_Sex;
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(pickerSelected:) 
                                                 name:NOTIF_PICKERSELECTED object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(pickerDone) 
                                                 name:NOTIF_PICKERDONE object:nil];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    //CGRect *scrollFrame = CGRrectMake(0, 30, 320, 480);
    //[self.scrollView setContentSize:CGSizeMake(320, 480)];
    //[scrollView setContentOffset:CGPointMake(0, -30) animated:YES];
    //self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, 320, 480)]; 
    //[self.scrollView setContentSize:CGSizeMake(0, 115)];
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"account"] isEqual:@"created"])
    {
        //Account already created display saved values
        NSString *profileInfo = [[NSUserDefaults standardUserDefaults] valueForKey:@"profileinfo"];
        NSArray *profileArray = [profileInfo componentsSeparatedByString:@"+"];
        self.txt_FName.text = [profileArray objectAtIndex:0];
        self.txt_LName.text = [profileArray objectAtIndex:1];
        self.txt_Password.text =[profileArray objectAtIndex:2];
        self.txt_RePassword.text = [profileArray objectAtIndex:2];
        self.txt_Age.text = [profileArray objectAtIndex:3];
        if ([[profileArray objectAtIndex:4] isEqualToString:@"Single"])
        {
            self.seg_Status.selectedSegmentIndex = 0;
        }
        else {
            self.seg_Status.selectedSegmentIndex = 1;
        }
        self.txt_Sexuality.text = [profileArray objectAtIndex:5];
        if ([[profileArray objectAtIndex:6] isEqualToString:@"Male"])
        {
            self.seg_Sex.selectedSegmentIndex = 0;
        }
        else 
        {
            self.seg_Sex.selectedSegmentIndex = 1;
        }
        self.txt_UserName.text = [profileArray objectAtIndex:7];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 9) {
        return 64;
    }
    else {
        return 44;
    }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return cellFName;
    }
    else if (indexPath.row == 1) {
        return cellLName;
    }
    else if (indexPath.row == 2) {
        return cellUName;
    }
    else if (indexPath.row == 3) {
        return cellPassword;
    }
    else if (indexPath.row == 4) {
        return cellRePassword;
    }
    else if (indexPath.row == 5) {
        return cellAge;
    }
    else if (indexPath.row == 6) {
        return cellSex;
    }
    else if (indexPath.row == 7) {
        return cellSexuality;
    }
    else if (indexPath.row == 8) {
        return cellStatus;
    }
    else {
        return cellBtn;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self hideKeyBoard];
    if (indexPath.row == 7) {
        [self hideKeyBoard];
        
        
        CGRect frame = CGRectMake(0,0, 320, 216);
        self.ctrl = [[PickerControlViewController alloc] init ];
        ctrl.view.frame = frame;
        ctrl.items = [[NSArray alloc] initWithObjects:@"Straight",
                      @"BiSexual",
                      @"Gay",
                      @"Lesbian",nil];
        int y=0;
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"account"] isEqual:@"created"])
        {
            y=94;
        }
        else {
            y=184;
        }
        
        CGRect _frame = CGRectMake(0,y, 320, 277);
        //[self.view addSubview:ctrl.view];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        frame.origin.x = 0;
        ctrl.view.frame = _frame;
        [self.view addSubview:ctrl.view];
        
        //[ctrl release];
        [UIView commitAnimations]; 
    }
    else if (indexPath.row == 9) {
        [self saveProfile:nil];
    }
}

- (void)viewDidUnload
{
    [self setSeg_Status:nil];
    [self setTxt_UserName:nil];
    [self setScrollView:nil];
    [self setCellRePassword:nil];
    [self setCellFName:nil];
    [self setCellLName:nil];
    [self setCellUName:nil];
    [self setCellPassword:nil];
    [self setCellAge:nil];
    [self setCellSex:nil];
    [self setCellStatus:nil];
    [self setCellSexuality:nil];
    [self setCellBtn:nil];
    
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hideKeyBoard];
}






-(void)pickerSelected:(NSNotification *) notification
{
    [self hideKeyBoard];
    
    NSDictionary *userInfo = notification.userInfo;
    NSString *row = [userInfo objectForKey:@"ROW"];
    NSInteger _row = [row integerValue];
    self.txt_Sexuality.text = [self.ctrl.items objectAtIndex:_row];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //[self hideKeyBoard];
    if ([textField.placeholder isEqualToString:@"Sexuality"] ) 
    {
        [self hideKeyBoard];
        
        
        CGRect frame = CGRectMake(0,0, 320, 216);
        self.ctrl = [[PickerControlViewController alloc] init ];
        ctrl.view.frame = frame;
        ctrl.items = [[NSArray alloc] initWithObjects:@"Straight",
                      @"BiSexual",
                      @"Gay",
                      @"Lesbian",nil];
        int y=0;
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"account"] isEqual:@"created"])
        {
            y=94;
        }
        else {
            y=184;
        }
        
        CGRect _frame = CGRectMake(0,y, 320, 277);
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

-(void)hideKeyBoard
{
    [self.txt_FName resignFirstResponder];
    [self.txt_LName resignFirstResponder];
    [self.txt_Password resignFirstResponder];
    [self.txt_RePassword resignFirstResponder];
    [self.txt_Sexuality resignFirstResponder];
    [self.txt_Age resignFirstResponder];
}

-(NSString *) genRandString:(NSString*) string ofLength: (int) len 
{
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) 
    {
        [randomString appendFormat: @"%C", [string characterAtIndex: arc4random() % [string length]]];
    }
    
    return randomString;
}



- (IBAction)saveProfile:(id)sender 
{
    NSString *status,*sex;
    if(relationIndex == 0)
    {
        status = @"Single";
    }
    else 
    {
        status = @"In Relation";
    }
    
    if(sexIndex == 0)
    {
        sex = @"Male";
    }
    else 
    {
        sex = @"Female";
    }

    
    BOOL flag = false;
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"account"] isEqual:@"created"])
    {
        NSString *profileInfo = [NSString stringWithFormat:@"%@+%@+%@+%@+%@+%@+%@+%@",self.txt_FName.text,self.txt_LName.text,self.txt_RePassword.text,self.txt_Age.text,status,self.txt_Sexuality.text,sex,self.txt_UserName.text];
        [[NSUserDefaults standardUserDefaults] setValue:profileInfo forKey:@"profileinfo"];
        [[NSUserDefaults standardUserDefaults] setValue:sex forKey:@"sex"];
        flag = TRUE;
    }
    else 
    {
        NSString *profileInfo = [NSString stringWithFormat:@"%@+%@+%@+%@+%@+%@+%@+%@",self.txt_FName.text,self.txt_LName.text,self.txt_RePassword.text,self.txt_Age.text,status,self.txt_Sexuality.text,sex,self.txt_UserName.text];
        NSString *pin = [self genRandString:[profileInfo stringByReplacingOccurrencesOfString:@"+" withString:@""] ofLength:4];
        [[NSUserDefaults standardUserDefaults] setValue:profileInfo forKey:@"profileinfo"];
        NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
        [WebService createAccountWithName:self.txt_FName.text lastName:self.txt_LName.text password:self.txt_Password.text age:self.txt_Age.text sex:sex sexuality:self.txt_Sexuality.text pin:[pin uppercaseString] userName:txt_UserName.text deviceID:token andStatus:status];
        [[NSUserDefaults standardUserDefaults] setValue:sex forKey:@"sex"];
        [[NSUserDefaults standardUserDefaults] setValue:@"created" forKey:@"account"];
        [[NSUserDefaults standardUserDefaults] setValue:[pin uppercaseString] forKey:@"pin"];
    }
    
    
    if (!flag) 
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (IBAction)relationChanged:(id)sender 
{
    [self hideKeyBoard];
    relationIndex  = self.seg_Status.selectedSegmentIndex;
}

-(IBAction)sexChanged:(id)sender
{
    [self hideKeyBoard];
    sexIndex = self.seg_Sex.selectedSegmentIndex;
}
- (void)dealloc {
    [seg_Status release];
    [txt_UserName release];
    [scrollView release];
    [cellRePassword release];
    [cellFName release];
    [cellLName release];
    [cellUName release];
    [cellPassword release];
    [cellAge release];
    [cellSex release];
    [cellStatus release];
    [cellSexuality release];
    [cellBtn release];
    
    [tableView release];
    [super dealloc];
}

-(void)pickerDone
{
    CGRect frame = CGRectMake(0,194, 320, 216);
    CGRect _frame = CGRectMake(0,500, 320, 216);
    //[self.view addSubview:ctrl.view];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    frame.origin.x = 0;
    ctrl.view.frame = _frame;
    
    
    //[ctrl release];
    [UIView commitAnimations];
    //[self.ctrl.view removeFromSuperview];
 
}
@end
