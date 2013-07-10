//
//  DPMove.h
//  RoadTrip
//
//  Created by Tolga Seremet on 7/10/13.
//  Copyright (c) 2013 Tolga Seremet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPBrick.h"

@interface DPMove : NSObject

+(BOOL) isLegalMove:(DPBrick*) brickA : (DPBrick*) brickB;

@end
