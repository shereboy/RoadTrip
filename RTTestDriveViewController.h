//
//  RTTestDriveViewController.h
//  RoadTrip
//
//  Created by Tolga Seremet on 7/5/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTTestDriveViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *TestTextBox;
- (IBAction)TestDriveButton:(id)sender;

@end
