//
//  tagObj.h
//  TMS
//
//  Created by kiran babu davis on 01/03/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tagObj : NSObject
{
    NSString *userName, *locationName, *dateTime,*type;
    float latitude, longitude;
    NSInteger starCount, points,rowid;
}

@property (nonatomic ,retain ) NSString *userName, *locationName, *dateTime,*type;
@property (nonatomic)  float latitude, longitude;
@property (nonatomic)   NSInteger starCount, points,rowid;

@end
