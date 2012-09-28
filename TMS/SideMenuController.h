//
//  SideMenuController.h
//  TMS
//
//  Created by Zachariah Tom on 31/07/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideMenuController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain) NSArray *items;
@end
