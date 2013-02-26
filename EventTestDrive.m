//
//  EventTestDrive.m
//  TestDrive
//
//  Created by Fine Arts Program on 2/21/13.
//  Copyright (c) 2013 Fine Arts Program. All rights reserved.
//

#import "EventTestDrive.h"
#import "Event.h"

@implementation EventTestDrive

NSString * const BASE_URL = @"http://clickthecampus.herokuapp.com";
@synthesize month;
@synthesize year;
@synthesize eventId;

+ (NSArray *) getAllEvents {
    NSURL * userListQuery = [NSURL URLWithString:@"/events.json" relativeToURL:[NSURL URLWithString:BASE_URL]];
    
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:userListQuery];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    NSError * e = nil;
    NSMutableArray * studentArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
    
    if (!studentArray) {
        NSLog(@"Error parsing JSON: %@", e);
    } else {
        for (int i = 0; i < [studentArray count]; i++) {
            NSDictionary *item = [studentArray objectAtIndex:i];
            
            Event *ev = [Event alloc];
            [ev setEventName:[item objectForKey:@"name"]];//works
            [ev setEventDescription:[item objectForKey:@"description"]];//works
            [ev setEventImageName:[item objectForKey:@"picture_file_name"]];//ask sir drei for this
            NSNumber* trial = [item objectForKey:@"clicks"];//works
            [ev setClicks:[trial intValue]];
            [ev setEventDate:[item objectForKey:@"date"]];//works. format format din
            [ev setOrganization:[item objectForKey:@"source"]];//works
            [ev setLink:[item objectForKey:@"external_link"]];//works
            
            [studentArray setObject:ev atIndexedSubscript:i];
        }
    }
    
    return studentArray;
}

- (NSArray *) getEventFor:(NSString *) month: (NSString *) year {//wag muna to until allevents is ok
    NSString * schedUrl = [NSString stringWithFormat:@"/events/%d.json", self.eventId ];
    NSURL * schedQuery = [NSURL URLWithString:schedUrl relativeToURL:[NSURL URLWithString:BASE_URL]];
    
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:schedQuery];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    NSError * e = nil;
    NSMutableArray * schedArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
    
    if (!schedArray) {
        NSLog(@"Error parsing JSON: %@", e);
    } else {
        for (int i = 0; i < [schedArray count]; i++) {
            NSDictionary *item = [schedArray objectAtIndex:i];
            Event *ev = [Event alloc];
            [ev setEventName:[item objectForKey:@"name"]];
            [ev setEventDescription:[item objectForKey:@"description"]];
            [ev setEventImageName:[item objectForKey:@"image"]];
            [ev setClicks:10];//random value lang to kasi di ko alam pano ko makukuha yung clicks
            [ev setEventDate:[item objectForKey:@"date"]];
            [ev setIsAccessibilityElement:false];
            [ev setLink:[item objectForKey:@"externalLink"]];        }
    }
    
    return schedArray;
}


@end
