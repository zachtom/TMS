//
//  contactCell.h
//  TMS
//
//  Created by kiran babu davis on 04/03/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contactCell : UITableViewCell
{
    IBOutlet UILabel *name;
    IBOutlet UIImageView *img;
}

@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic ,retain) IBOutlet UIImageView *img;

@end
