//
//  SCLoginViewController.h
//  humanDesignProject
//
//  Created by Jehyeok on 5/19/13.
//  Copyright (c) 2013 NHN Next. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookSDK/FacebookSDK.h"

@interface SCLoginViewController : UIViewController

- (void)loginFailed;

@property (nonatomic, strong) IBOutlet UIButton *loginButton;


@end
