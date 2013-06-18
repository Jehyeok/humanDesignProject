//
//  ViewController.m
//  humanDesignProject
//
//  Created by Jehyeok on 5/18/13.
//  Copyright (c) 2013 NHN Next. All rights reserved.
//

#import "SCViewController.h"

#import "FacebookSDK/FacebookSDK.h"

#import "AppDelegate.h"

#import "SCMatchedViewController.h"

@interface SCViewController ()

@end

@implementation SCViewController

@synthesize mainImgView;
@synthesize userProfileImage;
@synthesize userProfileImageYou;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"내정보";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"로그아웃" style:UIBarButtonItemStyleBordered target:self action:@selector(logoutButtonWasPressed:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"채팅" style:UIBarButtonItemStylePlain target:self action:@selector(goToMatchedViewController:)];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sessionStateChanged:) name:SCSessionStateChangedNotification object:nil];

    mainImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_app.png"]];
    mainImgView.frame = CGRectMake(0, 0, 320, 420);
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_app.png"]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)logoutButtonWasPressed:(id)sender
{
    [FBSession.activeSession closeAndClearTokenInformation];
}

- (void)populateUserDetails
{
    if (FBSession.activeSession.isOpen)
    {
        [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
            if (!error) {
                //NSLog(@"%@", user);
                self.userName.text = user.name;
                self.userProfileImage.profileID = user.id;
                
                [self connectToServerWithData:user.id];
            }
        }];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (FBSession.activeSession.isOpen) {
        [self populateUserDetails];
    }
}

- (void)sessionStateChanged:(NSNotification*)notification
{
    [self populateUserDetails];
}

- (void)connectToServerWithData:(NSString*)uid
{
    self.jsonData = [[NSMutableData alloc] initWithCapacity:0];
    NSString *smsUrl = @"http://projectspark.dothome.co.kr/json.php";
//    NSString *smsUrl = @"http://localhost/~jehyeok/projectspark/index.php";
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    
    NSString *post = [NSString stringWithFormat:@"%@?uid=%@", smsUrl, uid];
//    NSString *post = [NSString stringWithFormat:@"uid=%@", uid];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    // NSLog(@"%@", post);
    // NSLog(@"%@", postLength);
    [request setURL:[NSURL URLWithString:post]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"Mozilla/4.0 (compatible;)" forHTTPHeaderField:@"User-Agent"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.jsonData appendData: data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.jsonArray = [NSJSONSerialization JSONObjectWithData:self.jsonData options:NSJSONReadingAllowFragments error:nil];
//    NSString *response = [NSString stringWithUTF8String:self.jsonData.bytes];
    //NSLog(@"jsonArray = %@", self.jsonArray);
    NSLog(@"jsonArray = %@", self.jsonArray);
    
    self.userProfileImageYou.profileID = [self.jsonArray valueForKey:@"uid"];
    
    self.movie.text = [self.jsonArray valueForKey:@"matched_string"];
    self.userNameYou.text = [self.jsonArray valueForKey:@"name"];
    self.numOfLike.text = [[self.jsonArray valueForKey:@"num_of_like"] stringValue];
}

- (IBAction)goToMatchedViewController:(id)sender
{
//    NSLog(@"goToMatchedViewController");
    SCMatchedViewController *scmatchedViewController = [[SCMatchedViewController alloc] init];
    [self.navigationController pushViewController:scmatchedViewController animated:YES];
}

@end
