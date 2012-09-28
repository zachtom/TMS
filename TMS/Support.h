//
//  Support.h
//  TMS
//
//  Created by Zachariah Tom on 25/09/2012.
//  Copyright (c) 2012 Mobytz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface Support : UIViewController<MFMailComposeViewControllerDelegate>
- (IBAction)sendmail:(id)sender;

@end
