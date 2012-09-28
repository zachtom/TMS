//
//  SecondViewController.m
//  TMS
//
//  Created by kiran babu davis on 23/02/2012.
//  Copyright 2012 entee. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController
@synthesize mapView;

-(void) loadAnnotations
{
    
    for (int i = 0; i < [tagArray count]; i++ )
    {
        tagObj *obj = [[tagObj alloc] init];
        obj = [tagArray objectAtIndex:i];
        
        CLLocationCoordinate2D location;
        location.latitude = (double) obj.latitude;
        location.longitude = (double) obj.longitude;
        NSSet *users = [NSSet setWithArray:[obj.userName componentsSeparatedByString:@"+"]];
        NSString *tags=@"";
        for(NSString *user in users)
        {
            tags = [tags stringByAppendingFormat:@"%@,",user];
        }
        tags = [tags substringToIndex:[tags length] - 1];
        MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] initWithTitle:nil andCoordinate:location];
        
        [self.mapView addAnnotation:newAnnotation];
        [newAnnotation release];
        
    }
    
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    tagArray = [[NSMutableArray alloc] init];
    dbObj = [[databaseClass alloc] init];
    
    deleg = (TMSAppDelegate *) [[UIApplication sharedApplication] delegate];
    

   /* 
    CLLocationCoordinate2D location;
	location.latitude = (double) 51.501468;
	location.longitude = (double) -0.141596;
	
	// Add the annotation to our map view
	MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] initWithTitle:nil andCoordinate:location];
    
	[self.mapView addAnnotation:newAnnotation];
	[newAnnotation release];
    */
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated
{
    if (deleg.mapMode == 1)
    {
        tagArray = [dbObj dbRetrieve];
    }
    
    else
    {
        [tagArray addObject:deleg.obj];
    }
    [self loadAnnotations];
}




- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
	MKAnnotationView *annotationView = [views objectAtIndex:0];
	id <MKAnnotation> mp = [annotationView annotation];
    if (deleg.individualTagMode == 1) 
    {
        deleg.individualTagMode = 0;
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate], 1500, 1500);
        [mv setRegion:region animated:YES];
        [mv selectAnnotation:mp animated:YES];
    }
    else
    {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate], 650000, 650000);
        [mv setRegion:region animated:YES];
        [mv selectAnnotation:mp animated:YES];
    }
	
}



- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *AnnotationViewID = @"annotationViewID";
    
   MKAnnotationView * annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    
    if (annotationView == nil)
    {
        annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID] autorelease];
    }
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"sex"]);
    
    if ( [[[NSUserDefaults standardUserDefaults] valueForKey:@"sex"] isEqualToString:@"Male"])
    {
    
    annotationView.image = [UIImage imageNamed:@"man.png"];
    }
    
    else
    {
         annotationView.image = [UIImage imageNamed:@"woman.png"];
    }
    
    annotationView.annotation = annotation;
    
    [annotationView setEnabled:YES];
    [annotationView setCanShowCallout:YES];
    
    return annotationView;
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
