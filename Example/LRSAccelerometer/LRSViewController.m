//
//  LRSViewController.m
//  LRSAccelerometer
//
//  Created by 刘sama on 10/12/2021.
//  Copyright (c) 2021 刘sama. All rights reserved.
//

#import "LRSViewController.h"
@import LRSAccelerometer;

@interface LRSViewController ()

@end

@implementation LRSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [LRSAccelerometer.instance startAccelerometerWithHandler:^(LRSAccelerometer * _Nonnull handler) {
        NSLog(@"shark");
        [handler stop];
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
