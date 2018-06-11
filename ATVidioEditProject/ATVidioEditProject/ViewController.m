//
//  ViewController.m
//  ATVidioEditProject
//
//  Created by Qiaojun Chen on 2018/6/11.
//  Copyright © 2018年 Qiaojun Chen. All rights reserved.
//

#import "ViewController.h"
#import "ATRecordController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频录制";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(10, 100, kScreenWidth-20, 40)];
    [button addTarget:self action:@selector(buttoAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"视频录制" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)buttoAction:(UIButton *)sender
{
    ATRecordController *controller = [[ATRecordController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
