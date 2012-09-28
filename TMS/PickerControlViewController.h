//
//  PickerControlViewController.h
//  TMS
//
//  Created by Zachariah Tom on 01/08/2012.
//  Copyright (c) 2012 Mobytz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerControlViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,retain) IBOutlet UIPickerView *picker;
@property(nonatomic,retain) NSArray *items;
-(IBAction)pressDone:(id)sender;
@end
