//
//  Achievements.h
//  TMS
//
//  Created by Zachariah Tom on 31/07/2012.
//  Copyright (c) 2012 entee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TapkuLibrary/TapkuLibrary.h>
#import "MFSideMenu.h"
@interface Achievements : UIViewController<TKCoverflowViewDelegate,TKCoverflowViewDataSource>
@property(nonatomic,retain) IBOutlet UIView * flip,*details;
@property(nonatomic,retain) TKCoverflowView *coverFlow;
@property(nonatomic,retain) NSMutableArray *covers,*achievements;
@property (retain, nonatomic) IBOutlet UILabel *achievementStatus;
@property(nonatomic,retain) NSMutableDictionary *savedAchievements;
@property(nonatomic,retain) IBOutlet UILabel *achievementName;
@end
