//
//  RootViewController.h
//  ClickTheCampus
//
//  Created by Ateneo Fine Arts on 2/19/13.
//  Copyright (c) 2013 Ateneo Fine Arts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPFoldEnumerations.h"
#import "MPFlipEnumerations.h"

enum {
	MPTransitionModeFold,
	MPTransitionModeFlip
} typedef MPTransitionMode;
@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
