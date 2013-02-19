//
//  ModelController.h
//  ClickTheCampus
//
//  Created by Ateneo Fine Arts on 2/19/13.
//  Copyright (c) 2013 Ateneo Fine Arts. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
