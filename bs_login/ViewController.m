//
//  ViewController.m
//  bs_login
//
//  Created by Oluwadamilola Oni on 6/17/17.
//  Copyright © 2017 Oluwadamilola Oni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"your link goes here "]];
    
    NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                  {
                                      dispatch_async(dispatch_get_main_queue(),
                                                    ^{
                                                        NSString *result = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                                                        
                                                        NSLog(@"%@", result);
                                                    });
                                  }];
    [task resume];
    
}

- ( NSURLSession * )getURLSession
{
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once( &onceToken,
        ^{
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            session = [NSURLSession sessionWithConfiguration:configuration];
         });
    return session;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
