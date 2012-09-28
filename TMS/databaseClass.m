//
//  databaseClass.m
//  TMS
//
//  Created by kiran babu davis on 29/02/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import "databaseClass.h"


@implementation databaseClass

-(void)Create_Database {
	
	BOOL executed;
	
	
	Manage_File = [NSFileManager defaultManager];
	
	
	Sql_Path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	
	Directory_docs = [Sql_Path objectAtIndex:0];
	
	Db_Path = [Directory_docs stringByAppendingPathComponent:@"TMS_1.sql"];
	
	executed = [Manage_File fileExistsAtPath:Db_Path];
	
	//if(executed) return;
	
	dbPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"TMS_1.sql"];
	
	executed = [Manage_File copyItemAtPath:dbPath toPath:Db_Path error:&error];
	
	//if(!executed)
	//	NSAssert1(0, @"Failed to copy the database. Error: %@.", [error localizedDescription]);
}



-(void) dbInsert :( NSDictionary *) payloadDict
{
    [self Create_Database];
    Sql_Path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	Directory_docs = [Sql_Path objectAtIndex:0];
	dbPath = [Directory_docs stringByAppendingPathComponent:@"TMS_1.sql"];
	
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK)
	{
		
		const char * sql;
        sql = "insert into tms ('name','place','latitude','longitude','stars','time' , 'points','type') values (?,?,?,?,?,?,?,?) ";
        
		sqlite3_stmt *selectStatement;
		
		//prepare the select statement
		int returnValue = sqlite3_prepare_v2(database, sql, -1, &selectStatement, NULL);
		if(returnValue == SQLITE_OK)
		{
			sqlite3_bind_text(selectStatement, 1,[[payloadDict  valueForKey:@"userName"] UTF8String] , [[payloadDict  valueForKey:@"userName"] length],SQLITE_STATIC);
            sqlite3_bind_text(selectStatement, 2,[[payloadDict  valueForKey:@"locName"] UTF8String], [[payloadDict  valueForKey:@"locName"] length],SQLITE_STATIC);
            
            sqlite3_bind_text(selectStatement, 3,[[payloadDict  valueForKey:@"latitude"] UTF8String] , [[payloadDict  valueForKey:@"latitude"] length],SQLITE_STATIC);
            
             sqlite3_bind_text(selectStatement, 4,[[payloadDict  valueForKey:@"longitude"] UTF8String] , [[payloadDict  valueForKey:@"longitude"] length],SQLITE_STATIC);
            
            sqlite3_bind_int(selectStatement, 5, [[payloadDict  valueForKey:@"starCount"] integerValue]);
            
            sqlite3_bind_text(selectStatement, 6,[[payloadDict  valueForKey:@"timedate"] UTF8String] , [[payloadDict  valueForKey:@"timedate"] length],SQLITE_STATIC);
            
             sqlite3_bind_int(selectStatement, 7, [[payloadDict  valueForKey:@"points"] integerValue]);
            sqlite3_bind_text(selectStatement, 8,[[payloadDict  valueForKey:@"type"] UTF8String] , [[payloadDict  valueForKey:@"type"] length],SQLITE_STATIC);
			//loop all the rows returned by the query.
			while(sqlite3_step(selectStatement) == SQLITE_ROW)
			{
                
				NSLog(@"success");
			}
		}
        else {
            printf( "could not prepare statemnt: %s\n", sqlite3_errmsg(database) );
        }
		//Release the select statement memory
		sqlite3_finalize(selectStatement);
	}
	//Close the connection.
	else
		sqlite3_close(database);
    
    
}
-(NSMutableArray *) dbRetrieve

{
    [self Create_Database];
    
    NSMutableArray *tagObjArray = [[NSMutableArray alloc] init];
    
    Sql_Path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	Directory_docs = [Sql_Path objectAtIndex:0];
	dbPath = [Directory_docs stringByAppendingPathComponent:@"TMS_1.sql"];
    
    
    if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK)
	{
		
		const char * sql;
        sql = "select * from tms";
        
		sqlite3_stmt *selectStatement;
		
		//prepare the select statement
		int returnValue = sqlite3_prepare_v2(database, sql, -1, &selectStatement, NULL);
		if(returnValue == SQLITE_OK)
		{
            while(sqlite3_step(selectStatement) == SQLITE_ROW)
			{
                
                tagObj *obj = [[tagObj alloc] init];
				obj.rowid = sqlite3_column_int(selectStatement, 0);
                obj.userName  = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)];
                obj.locationName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 2)];
                obj.latitude =   [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 3)] floatValue];
                
                obj.longitude =   [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 4)] floatValue];
                
                obj.starCount = sqlite3_column_int(selectStatement, 5);
                obj.dateTime = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 6)] ;
                obj.points = sqlite3_column_int(selectStatement, 7);
                obj.type = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 8)] ;
                [tagObjArray addObject:obj];

			}
            
        }
    
    
}
    
    
    else
        sqlite3_close(database);
    return tagObjArray;
}

-(NSMutableDictionary *) dbFieldExist :( NSDictionary *) payloadDict
{
    [self Create_Database];
    
    NSMutableDictionary *returnDict = [[NSMutableDictionary alloc] init];
    
    NSInteger points = 0;
    NSString *nameStr = @"";
    
    Sql_Path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	Directory_docs = [Sql_Path objectAtIndex:0];
	dbPath = [Directory_docs stringByAppendingPathComponent:@"TMS_1.sql"];
    
    
    if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK)
	{
		
		const char * sql;
        sql = "select * from tms where latitude = ? and longitude = ? and place=?";
		sqlite3_stmt *selectStatement;
		
		//prepare the select statement
		int returnValue = sqlite3_prepare_v2(database, sql, -1, &selectStatement, NULL);
		if(returnValue == SQLITE_OK)
		{
            sqlite3_bind_text(selectStatement, 1,[[payloadDict  valueForKey:@"latitude"] UTF8String] , [[payloadDict  valueForKey:@"latitude"] length],SQLITE_STATIC);
            
            sqlite3_bind_text(selectStatement, 2,[[payloadDict  valueForKey:@"longitude"] UTF8String] , [[payloadDict  valueForKey:@"longitude"] length],SQLITE_STATIC);
            
            sqlite3_bind_text(selectStatement, 3,[[payloadDict  valueForKey:@"locName"] UTF8String], [[payloadDict  valueForKey:@"locName"] length],SQLITE_STATIC);
            
            
            while(sqlite3_step(selectStatement) == SQLITE_ROW)
			{
                
			 
              nameStr =   [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 0)]; 
                points = sqlite3_column_int(selectStatement, 6);
			}
		}
		//Release the select statement memory
		sqlite3_finalize(selectStatement);
	}
	//Close the connection.
	else
		sqlite3_close(database);

    NSLog(@"points %d" , points);
    
    [returnDict setValue:nameStr forKey:@"name"];
    [returnDict setValue:[NSString stringWithFormat:@"%d",points] forKey:@"points"]  ;
    
    return  returnDict;
    
}


-(void) updateDB : ( NSDictionary *) payloadDict
{
    [self Create_Database];
    
    BOOL isExist = FALSE;
    
    
    Sql_Path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	Directory_docs = [Sql_Path objectAtIndex:0];
	dbPath = [Directory_docs stringByAppendingPathComponent:@"TMS_1.sql"];
    
    
    if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK)
	{
		
		const char * sql;
        sql = "update tms  set name = ?,place=?,stars=?  where id=?";
        
		sqlite3_stmt *selectStatement;
		
		//prepare the select statement
		int returnValue = sqlite3_prepare_v2(database, sql, -1, &selectStatement, NULL);
		if(returnValue == SQLITE_OK)
		{
            sqlite3_bind_text(selectStatement, 1,[[payloadDict  valueForKey:@"userName"] UTF8String] , [[payloadDict  valueForKey:@"userName"] length],SQLITE_STATIC);
            sqlite3_bind_text(selectStatement, 2,[[payloadDict  valueForKey:@"locName"] UTF8String], [[payloadDict  valueForKey:@"locName"] length],SQLITE_STATIC);
            sqlite3_bind_int(selectStatement, 3, [[payloadDict  valueForKey:@"starCount"] integerValue]);
            int _id = [[payloadDict  valueForKey:@"rowid"] integerValue];
            sqlite3_bind_int(selectStatement, 4, _id);
            int success = sqlite3_step(selectStatement);
            if(success == SQLITE_DONE)
			{
				isExist = TRUE;
			}
            else {
                //NSAssert1(0,@"Error: Failed to Update %s",sqlite3_errmsg(database));
            }
		}
		//Release the select statement memory
		sqlite3_finalize(selectStatement);
	}
}

@end
