//
//  EventTestDrive.h
//  TestDrive
//
//  Created by Fine Arts Program on 2/21/13.
//  Copyright (c) 2013 Fine Arts Program. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventTestDrive : NSObject

@property (nonatomic, retain) NSString * month;
@property (nonatomic, retain) NSString * year;
@property int eventId;

+ (NSArray *) getAllEvents;
- (NSArray *) getEventFor:(NSString *) month: (NSString *) year;

@end
