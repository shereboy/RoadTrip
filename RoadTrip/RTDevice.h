//
//  RTDevice.h
//  RoadTrip
//
//  Created by Tolga Seremet on 7/5/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RTBrand;

@interface RTDevice : NSObject

@property (nonatomic, retain) NSString * ModelName;
@property (nonatomic, retain) NSNumber * Width;
@property (nonatomic, retain) RTBrand * Brand;

@end
