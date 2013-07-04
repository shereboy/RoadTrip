//
//  RTMasterViewController.h
//  RoadTrip
//
//  Created by Tolga Seremet on 7/4/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RTDetailViewController;

@interface RTMasterViewController : UITableViewController

@property (strong, nonatomic) RTDetailViewController *detailViewController;

@end
