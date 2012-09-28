//
//  Achievements.m
//  TMS
//
//  Created by Zachariah Tom on 31/07/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import "Achievements.h"
#import "Types.h"
@interface Achievements ()

@end

@implementation Achievements
@synthesize achievementStatus;
@synthesize flip,details,covers,coverFlow,achievementName,achievements,savedAchievements;
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
    [self setupSideMenuBarButtonItem];
    if ( [[[NSUserDefaults standardUserDefaults] valueForKey:@"sex"] isEqualToString:@"Male"])
    {
        self.achievements = [Types getMaleAchievements];
    }
    else 
    {
        self.achievements = [Types getFemaleAchievements];
    }
    self.covers = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"cover_1.png"],
                   [UIImage imageNamed:@"cover_2.png"],
                   [UIImage imageNamed:@"cover_3.png"],
                   [UIImage imageNamed:@"cover_4.png"],
                   nil];
    
    self.coverFlow = [[TKCoverflowView alloc] initWithFrame:self.flip.bounds];
    self.coverFlow.coverflowDelegate = self;
    self.coverFlow.dataSource = self;
    [self.flip addSubview:self.coverFlow];
    [coverFlow setNumberOfCovers:[self.achievements count]];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
    self.savedAchievements = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
}

- (void)viewDidUnload
{
    [self setAchievementStatus:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma Coverflow delegate methods
- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasBroughtToFront:(int)index{
    self.achievementName.text = [self.achievements objectAtIndex:index];
    if ([[self.savedAchievements valueForKey:[self.achievements objectAtIndex:index]] intValue] == 1)
    {
        self.achievementStatus.text = @"Unlocked";
    }
    else {
        self.achievementStatus.text = @"Locked";
    }
    	//NSLog(@"Front %@",[NSString stringWithFormat:@"%@",[self.covers objectAtIndex:index]]);
}

- (TKCoverflowCoverView*) coverflowView:(TKCoverflowView*)coverflowView coverAtIndex:(int)index{
	
	TKCoverflowCoverView *cover = [coverflowView dequeueReusableCoverView];
	
	if(cover == nil){
		// Change the covers size here
		cover = [[[TKCoverflowCoverView alloc] initWithFrame:CGRectMake(20, 20, 224, 200)] autorelease]; // 224
		cover.baseline = 240;
		
	}
	cover.image = [covers objectAtIndex:index % [covers count]];
	
	return cover;
	
}
- (void) coverflowView:(TKCoverflowView*)coverflowView coverAtIndexWasDoubleTapped:(int)index{
	
	
	TKCoverflowCoverView *cover = [coverflowView coverAtIndex:index];
	if(cover == nil) return;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:cover cache:YES];
	[UIView commitAnimations];
	
    //	NSLog(@"Index: %d",index);
}



- (void)dealloc {
    [achievementStatus release];
    [super dealloc];
}
@end
