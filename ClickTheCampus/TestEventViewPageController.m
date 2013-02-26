//
//  TestEventViewPageController.m
//  ClickTheCampus
//
//  Created by Sam Chan on 2/26/13.
//  Copyright (c) 2013 Ateneo Fine Arts. All rights reserved.
//

#import "TestEventViewPageController.h"
#import "EventTestDrive.h"
#import "Event.h"

@interface TestEventViewPageController ()

@end

@implementation TestEventViewPageController
NSArray* events;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    events = [EventTestDrive getAllEvents];
    Event *e = [events objectAtIndex:1];
    self.testname.text = e.eventName;
    self.testname2.text = e.organization;
    self.testname3.text = e.eventDate;
    /*self.img = [[UIImageView alloc] init];
    UIImage *imgreal = [UIImage imageNamed:e.eventImageName];
    [self.img setImage:imgreal];*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
