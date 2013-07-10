//
//  DPBrick.h
//  RoadTrip
//
//  Created by Tolga Seremet on 7/10/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPBrick : UIView
@property (nonatomic) int rowNumber;
@property (nonatomic) int colNumber;
@property (strong,nonatomic) UIColor *assignedColor;

@end
