//
//  SCMatchedViewController.h
//  humanDesignProject
//
//  Created by Jehyeok on 5/31/13.
//  Copyright (c) 2013 NHN Next. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCMatchedViewController : UIViewController <NSURLConnectionDataDelegate, NSURLConnectionDelegate>

@property NSMutableData *jsonData;
@property NSMutableArray *jsonArray;

@end
