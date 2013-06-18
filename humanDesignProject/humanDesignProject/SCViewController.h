//
//  ViewController.h
//  humanDesignProject
//
//  Created by Jehyeok on 5/18/13.
//  Copyright (c) 2013 NHN Next. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FacebookSDK/FacebookSDK.h>

@interface SCViewController : UIViewController <NSURLConnectionDataDelegate, NSURLConnectionDelegate>

- (IBAction)goToMatchedViewController:(id)sender;

@property (strong, nonatomic) IBOutlet FBProfilePictureView *userProfileImage;
@property (strong, nonatomic) IBOutlet FBProfilePictureView *userProfileImageYou;
@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UILabel *userNameYou;
@property (strong, nonatomic) IBOutlet UILabel *movie;
@property (strong, nonatomic) IBOutlet UILabel *numOfLike;
@property (strong, nonatomic) IBOutlet UIImageView *mainImgView;
@property NSMutableData *jsonData;
@property NSMutableArray *jsonArray;


@end