//
//  Trucks.h
//  RoadTrip
//
//  Created by Tolga Seremet on 7/5/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Trucks : NSManagedObject

@property (nonatomic, retain) NSString * model;
@property (nonatomic, retain) NSString * make;
@property (nonatomic, retain) NSNumber * topSpeed;


@end
