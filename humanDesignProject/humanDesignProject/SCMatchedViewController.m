//
//  SCMatchedViewController.m
//  humanDesignProject
//
//  Created by Jehyeok on 5/31/13.
//  Copyright (c) 2013 NHN Next. All rights reserved.
//

#import "SCMatchedViewController.h"

@interface SCMatchedViewController ()

@end

@implementation SCMatchedViewController

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
//    NSLog(@"matchedViewLoad");
    [self connectToServerWithData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connectToServerWithData
{
    self.jsonData = [[NSMutableData alloc] initWithCapacity:0];
    NSString *smsUrl = @"http://localhost/~jehyeok/projectspark/getTest.php";
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    
    [request setURL:[NSURL URLWithString:smsUrl]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"Mozilla/4.0 (compatible;)" forHTTPHeaderField:@"User-Agent"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.jsonData appendData: data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //    self.jsonArray = [NSJSONSerialization JSONObjectWithData:self.jsonData options:NSJSONReadingAllowFragments error:nil];
    NSString *response = [NSString stringWithUTF8String:self.jsonData.bytes];
    NSLog(@"jsonArray = %@", response);
//
////    UIImage *me = [[UIImage alloc] initWithData:<#(NSData *)#>];
////    UIImage *you = [[UIImage alloc] initWithData:<#(NSData *)#>];
//    UIImageView *meImgView = [[UIImageView alloc] init];
//    UIImageView *youImgView = [[UIImageView alloc] init];
//    
//    meImgView.frame = CGRectMake(30, 30, 100, 100);
//    meImgView.backgroundColor = [UIColor redColor];
//    
//    youImgView.frame = CGRectMake(self.view.frame.size.width / 2 + 30, 30, 100, 100);
//    youImgView.backgroundColor = [UIColor blueColor];
//    
//    [self.view addSubview:meImgView];
//    [self.view addSubview:youImgView];
}

@end
