//
//  ViewController.m
//  LoadingAnimation
//
//  Created by IsLand on 16/1/8.
//  Copyright © 2016年 IsLand. All rights reserved.
//

#import "ViewController.h"
#include "LoadingView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[LoadingView sharedLoadingView] addLoading:self];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [[LoadingView sharedLoadingView] removeLoading];
        
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
