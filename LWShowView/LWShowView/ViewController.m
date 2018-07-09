//
//  ViewController.m
//  LWShowView
//
//  Created by LeeWong on 2018/7/7.
//  Copyright © 2018年 LeeWong. All rights reserved.
//

#import "ViewController.h"
#import "LWShowViewTest1.h"
#import "LWShowViewManager.h"
#import "LWShowViewTest2.h"
#import "LWShowView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *grayView;
@property (nonatomic, strong) LWShowViewTest1 *testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [LWShowViewTest1 show:^(UIView *showView) {
//        showView.backgroundColor = [UIColor redColor];
//    }];
    
//    [LWShowViewTest1 showInView:self.grayView completion:^(UIView *showView) {
//        showView.backgroundColor = [UIColor blueColor];
//    }];
    
//    [LWShowViewTest1 showInViewController:self completion:^(UIView *showView) {
//        showView.backgroundColor = [UIColor greenColor];
//    }];
    LWShowViewTest2 *show = [[LWShowViewTest2 alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [LWShowViewManager showView:show dismiss:nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
