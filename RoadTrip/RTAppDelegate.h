//
//  RTAppDelegate.h
//  RoadTrip
//
//  Created by Tolga Seremet on 7/4/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Device;

@interface RTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property Device *myDevice;

@end
