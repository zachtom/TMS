//
//  WebService.h
//  TMS
//
//  Created by Zachariah Tom on 02/09/2012.
//  Copyright (c) 2012 Mobytz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebService : NSObject
+(void)createAccountWithName:(NSString*)fname lastName:(NSString*)lname password:(NSString*)password age:(NSString*)age sex:(NSString*)sex sexuality:(NSString*)sexuality pin:(NSString*)pin userName:(NSString*)userName deviceID:(NSString*)token andStatus:(NSString*)status;
+(void) createTagWith:(NSString*)name place:(NSString*)place latitude:(NSString*)latitude longitude:(NSString*)longitude rating:(NSString*)rating andType:(int)type;
+(void) editTagWith:(NSString*)name place:(NSString*)place latitude:(NSString*)latitude longitude:(NSString*)longitude andType:(int)type toName:(NSString*)name1 place:(NSString*)place1 latitude:(NSString*)latitude1 longitude:(NSString*)longitude1 rating:(NSString*)rating andType:(int)type1;
+(void)fetchStoryOfDay;
+(void)unlockAchievement:(int)achId;
@end
