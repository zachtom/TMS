//
//  SecondViewController.h
//  TMS
//
//  Created by kiran babu davis on 23/02/2012.
//  Copyright 2012 entee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapViewAnnotation.h"
#import "databaseClass.h"
#import "tagObj.h"
#import "TMSAppDelegate.h"



@interface SecondViewController : UIViewController {
   MKMapView *mapView;
    NSMutableArray *tagArray;
    databaseClass   *dbObj;
    TMSAppDelegate *deleg;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
-(void) loadAnnotations;

@end
