//
//  SCLoginViewController.m
//  humanDesignProject
//
//  Created by Jehyeok on 5/19/13.
//  Copyright (c) 2013 NHN Next. All rights reserved.
//

#import "SCLoginViewController.h"

#import "AppDelegate.h"

@interface SCLoginViewController ()
- (IBAction)performLogin:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation SCLoginViewController

@synthesize spinner;
@synthesize loginButton;

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
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"index_app.png"]];
    loginButton.frame = CGRectMake(100, 100, 100, 50);
    [loginButton setImage:[UIImage imageNamed:@"login_app.png"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)performLogin:(id)sender
{
    [self.spinner startAnimating];
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate openSession];
}

- (void)loginFailed
{
    // User switched back to the app without authorizing. Stay here, but stop the spinner
    [self.spinner stopAnimating];
}
@end
