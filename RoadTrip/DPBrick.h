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
@property (nonatomic) int frameWidth;
@property (nonatomic) int frameHeight;
@property (nonatomic) int frameX;
@property (nonatomic) int frameY;
@property (strong,nonatomic) UIColor *assignedColor;

@end
