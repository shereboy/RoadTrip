//
//  RTMasterViewController.m
//  RoadTrip
//
//  Created by Tolga Seremet on 7/4/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import "RTMasterViewController.h"

#import "RTDetailViewController.h"

@interface RTMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation RTMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
