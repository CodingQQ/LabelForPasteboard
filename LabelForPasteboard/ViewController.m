//
//  ViewController.m
//  LabelForPasteboard
//
//  Created by LeeQQ on 2017/6/30.
//  Copyright © 2017年 LeeQQ. All rights reserved.
//

#import "ViewController.h"
#import "LabelForPasteboard.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addSubs];
}


- (void)addSubs {
    LabelForPasteboard *lab = [[LabelForPasteboard alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    lab.text = @"this is a lab";
    lab.numberOfLines = 0;
    lab.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lab];
    
    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(50, 300, 200, 50)];
    tf.placeholder = @"placeholder";
    tf.backgroundColor = [UIColor redColor];
    [self.view addSubview:tf];
    
}


@end
