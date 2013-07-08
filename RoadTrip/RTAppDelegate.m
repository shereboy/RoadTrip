//
//  RTAppDelegate.m
//  RoadTrip
//
//  Created by Tolga Seremet on 7/4/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import "RTAppDelegate.h"
#import "Reachability.h"

@implementation RTAppDelegate

@synthesize myDevice;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Override point for customization after application launch.
  
  UINavigationController *navigationController;
  
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
  {
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    //UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    //splitViewController.delegate = (id)navigationController.topViewController;
    splitViewController.presentsWithGesture = NO;
    UINavigationController *detailNavigationController = [splitViewController.viewControllers lastObject];
    
    splitViewController.delegate = (id) detailNavigationController.topViewController;
    
    navigationController = [splitViewController.viewControllers objectAtIndex:0];
  }
  else
  {
    navigationController = (UINavigationController *) [[self window] rootViewController];
  }
  
  
  // NETWORK STATUS
  
  NetworkStatus networkStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
  
  if (networkStatus == NotReachable)
  {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"internete bagli degil" message:@"Internet Baglantisi Gerekiyor" delegate:nil cancelButtonTitle:@"Tamam" otherButtonTitles: nil];
    [alert show];
  
  }
  
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:NO];
  
  [navigationController navigationBar].barStyle = UIBarStyleBlack;
  
  [[navigationController navigationBar] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor yellowColor] forKey:UITextAttributeTextColor ]];

  [[UIButton appearance] setTitleColor:[UIColor greenColor] forState: UIControlStateNormal];
  
  [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes: [NSDictionary dictionaryWithObject:[UIColor yellowColor]  forKey:UITextAttributeTextColor] forState:UIControlStateNormal];

  
  
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) applicationDidReceiveMemoryWarning:(UIApplication *)application
{
  // implement later
}

@end
