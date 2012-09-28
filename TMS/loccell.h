//
//  loccell.h
//  TMS
//
//  Created by kiran babu davis on 28/02/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loccell : UITableViewCell
{
    IBOutlet UILabel *location , *pointslb, *datelb, *tablb ;
    IBOutlet UIButton *star1,*star2,*star3,*star4,*star5;
}

@property (nonatomic,retain)  IBOutlet UILabel *location , *pointslb, *datelb, *tablb ;
@property (nonatomic ,retain) IBOutlet UIButton *star1,*star2,*star3,*star4,*star5;

@end
