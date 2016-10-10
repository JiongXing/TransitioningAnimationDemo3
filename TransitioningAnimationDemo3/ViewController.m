//
//  ViewController.m
//  TransitioningAnimationDemo3
//
//  Created by JiongXing on 2016/10/9.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "MyPresentationController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onButton:(UIButton *)sender {
    SecondViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    MyPresentationController *present = [[MyPresentationController alloc] initWithPresentedViewController:vc presentingViewController:self];
    vc.transitioningDelegate = present;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
