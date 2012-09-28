//
//  databaseClass.h
//  TMS
//
//  Created by kiran babu davis on 29/02/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "tagObj.h"

@interface databaseClass : NSObject
{
NSError *error;
NSFileManager *manageFile ;
NSArray *Sql_Path;
NSString *Directory_docs;
NSString *Db_Path;
NSString *dbPath;
NSString *tempdbPath;
sqlite3	*database;
NSFileManager *Manage_File ;
}

-(void) dbInsert :( NSDictionary *) payloadDict;
-(NSMutableArray *) dbRetrieve;
-(NSMutableDictionary *) dbFieldExist :( NSDictionary *) payloadDict;
-(void) updateDB : ( NSDictionary *) payloadDict;
-(void)Create_Database;
@end
