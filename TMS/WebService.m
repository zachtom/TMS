//
//  WebService.m
//  TMS
//
//  Created by Zachariah Tom on 02/09/2012.
//  Copyright (c) 2012 Mobytz. All rights reserved.
//

#import "WebService.h"
#import "ASIFormDataRequest.h"
#import "Global.h"
#import "CJSONSerializer.h"
@implementation WebService

+(void)createAccountWithName:(NSString *)fname lastName:(NSString *)lname password:(NSString *)password age:(NSString *)age sex:(NSString *)sex sexuality:(NSString*)sexuality pin:(NSString*)pin userName:(NSString*)userName deviceID:(NSString*) token andStatus:(NSString *)status
{
    int _sexuality;
    if ([sexuality isEqualToString:@"Straight"]) 
    {
        _sexuality = 6;
    }
    else if([sexuality isEqualToString:@"BiSexual"])
    {
         _sexuality = 7;
    }
    else if([sexuality isEqualToString:@"Gay"])
    {
         _sexuality = 8;
    }
    else if([sexuality isEqualToString:@"Lesbian"])
    {
        _sexuality = 9;
    }
    NSData *response;
    NSString *service = @"createAccount";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:fname forKey:@"fName"];
    [dict setValue:lname forKey:@"lName"];
    [dict setValue:password forKey:@"password"];
    [dict setValue:age forKey:@"age"];
    [dict setValue:sex forKey:@"sex"];
    [dict setValue:status forKey:@"status"];
    [dict setValue:[NSNumber numberWithInt:_sexuality] forKey:@"sexuality"];
    [dict setValue:pin forKey:@"pin"];
    [dict setValue:userName forKey:@"userName"];
    [dict setValue:token forKey:@"token"];
    //NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@,%@,%@,%@,%@,%@,%d,%@",webServiceLink,service,fname,lname,password,age,sex,status,_sexuality,pin];
    NSString *urlString = [NSString stringWithFormat:@"%@/%@",webServiceLink,service];
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"URL = %@",urlString);
    NSError *error = NULL;
    NSData *jsonData = [[CJSONSerializer serializer] serializeObject:dict error:&error];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json;charset=utf-8"];
    [request appendPostData:jsonData];
    [request setContentLength:[jsonData length]];
    [request startSynchronous];
   // NSError *error = [request error];
    if (!error) 
    {
        response = [request responseData];
        NSString *res = [request responseString];
        NSLog(@"Response = %@",res);
        
    }
    //return response;
}

+(void) createTagWith:(NSString*)name place:(NSString*)place latitude:(NSString*)latitude longitude:(NSString*)longitude rating:(NSString*)rating andType:(int)type
{
    NSData *response;
    NSString *service = @"createShag";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"sex"] forKey:@"maleorfemale"];
    [dict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"pin"] forKey:@"tmsid"];
    [dict setValue:latitude forKey:@"latitude"];
    [dict setValue:longitude forKey:@"longitude"];
    [dict setValue:rating forKey:@"rating"];
    [dict setValue:[NSNumber numberWithInt:type] forKey:@"type"];
    
    //NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@,%@,%@,%@,%@,%@,%d,%@",webServiceLink,service,fname,lname,password,age,sex,status,_sexuality,pin];
    NSString *urlString = [NSString stringWithFormat:@"%@/%@",webServiceLink,service];
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"URL = %@",urlString);
    NSError *error = NULL;
    NSData *jsonData = [[CJSONSerializer serializer] serializeObject:dict error:&error];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json;charset=utf-8"];
    [request appendPostData:jsonData];
    [request setContentLength:[jsonData length]];
    [request startSynchronous];
    // NSError *error = [request error];
    if (!error) 
    {
        response = [request responseData];
        NSString *res = [request responseString];
        NSLog(@"Response = %@",res);
        
    }


}

+(void)fetchStoryOfDay
{
    NSString *service  = @"storyofDay";
    NSString *urlString = [NSString stringWithFormat:@"%@/%@",webServiceLink,service];
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"URL = %@",urlString);
    NSError *error = NULL;
    
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    // NSError *error = [request error];
    if (!error) 
    {
        
        NSString *res = [request responseString];
        NSLog(@"Response = %@",res);
        if (res != NULL && ![res isEqualToString:@""]) 
        {
            [[NSUserDefaults standardUserDefaults] setValue:res forKey:@"story"];
        }
        
    }
}

+(void) editTagWith:(NSString*)name place:(NSString*)place latitude:(NSString*)latitude longitude:(NSString*)longitude andType:(int)type toName:(NSString*)name1 place:(NSString*)place1 latitude:(NSString*)latitude1 longitude:(NSString*)longitude1 andType:(int)type1
{
    
}

+(void)unlockAchievement:(int)achId
{
    NSString *service = @"unlockAchievement";
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"sex"] forKey:@"maleorfemale"];
    [dict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"pin"] forKey:@"tmsid"];
    [dict setValue:[NSNumber numberWithInt:achId] forKey:@"achId"];
    
    //NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@,%@,%@,%@,%@,%@,%d,%@",webServiceLink,service,fname,lname,password,age,sex,status,_sexuality,pin];
    NSString *urlString = [NSString stringWithFormat:@"%@/%@",webServiceLink,service];
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"URL = %@",urlString);
    NSError *error = NULL;
    NSData *jsonData = [[CJSONSerializer serializer] serializeObject:dict error:&error];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json;charset=utf-8"];
    [request appendPostData:jsonData];
    [request setContentLength:[jsonData length]];
    [request startSynchronous];
    // NSError *error = [request error];
    if (!error) 
    {
        NSString *res = [request responseString];
        NSLog(@"Response = %@",res);
    }
}

@end
