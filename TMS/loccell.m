//
//  loccell.m
//  TMS
//
//  Created by kiran babu davis on 28/02/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import "loccell.h"

@implementation loccell

@synthesize location,pointslb,datelb,tablb ,star1,star2,star3,star4,star5;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
