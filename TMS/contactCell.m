//
//  contactCell.m
//  TMS
//
//  Created by kiran babu davis on 04/03/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import "contactCell.h"

@implementation contactCell

@synthesize  name, img;

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
