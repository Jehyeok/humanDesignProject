//
//  AppDelegate.h
//  humanDesignProject
//
//  Created by Jehyeok on 5/18/13.
//  Copyright (c) 2013 NHN Next. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SCViewController.h"

#import "FacebookSDK/FacebookSDK.h"

extern NSString *const SCSessionStateChangedNotification;

//@class SCViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SCViewController *viewController;

@property (strong, nonatomic) SCViewController *mainViewController;

@property (strong, nonatomic) UINavigationController *navController;

- (void)openSession;

@end