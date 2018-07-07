//
//  ViewController.m
//  LWShowView
//
//  Created by LeeWong on 2018/7/7.
//  Copyright © 2018年 LeeWong. All rights reserved.
//

#import "ViewController.h"
#import "LWShowViewTest1.h"
#import "LWShowView.h"
@interface ViewController ()
@property (nonatomic, strong) LWShowViewTest1 *testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [LWShowViewTest1 showInViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
