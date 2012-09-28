//
//  Points.m
//  TMS
//
//  Created by Zachariah Tom on 14/09/2012.
//  Copyright (c) 2012 Mobytz. All rights reserved.
//

#import "Points.h"
#import "Global.h"
@implementation Points


+(int)getPoint:(NSString*)pntStr
{
    int point = 0;
    if ([pntStr isEqualToString:@"m1"]) 
    {
        point = m1;
    }
    else if([pntStr isEqualToString:@"m2"]) 
    {
        point = m2;
    }
    else if([pntStr isEqualToString:@"m3"]) 
    {
        point = m3;
    }
    else if([pntStr isEqualToString:@"m4"]) 
    {
        point = m4;
    }
    else if([pntStr isEqualToString:@"m5"]) 
    {
        point = m5;
    }
    else if([pntStr isEqualToString:@"m6"]) 
    {
        point = m6;
    }
    else if([pntStr isEqualToString:@"m7"]) 
    {
        point = m7;
    }
    else if([pntStr isEqualToString:@"m8"]) 
    {
        point = m8;
    }else if([pntStr isEqualToString:@"m9"]) 
    {
        point = m9;
    }else if([pntStr isEqualToString:@"m10"]) 
    {
        point = m10;
    }
    else if([pntStr isEqualToString:@"m11"]) 
    {
        point = m11;
    }
    else if([pntStr isEqualToString:@"f1"]) 
    {
        point = f1;
    }
    else if([pntStr isEqualToString:@"f2"]) 
    {
        point = f2;
    }
    else if([pntStr isEqualToString:@"f3"]) 
    {
        point = f3;
    }
    else if([pntStr isEqualToString:@"f4"]) 
    {
        point = f4;
    }
    else if([pntStr isEqualToString:@"f5"]) 
    {
        point = f5;
    }
    else if([pntStr isEqualToString:@"f6"]) 
    {
        point = f6;
    }
    else if([pntStr isEqualToString:@"f7"]) 
    {
        point = f7;
    }
    else if([pntStr isEqualToString:@"f8"]) 
    {
        point = f8;
    }
    else if([pntStr isEqualToString:@"f9"]) 
    {
        point = f9;
    }
    else if([pntStr isEqualToString:@"f10"]) 
    {
        point = f10;
    }
    else if([pntStr isEqualToString:@"f11"]) 
    {
        point = f11;
    }
    else if([pntStr isEqualToString:@"f12"]) 
    {
        point = f12;
    }
    else if([pntStr isEqualToString:@"f13"]) 
    {
        point = f13;
    }
    return point;
}

@end
