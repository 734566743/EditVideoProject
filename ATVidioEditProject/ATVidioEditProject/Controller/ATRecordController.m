
//
//  ATRecordController.m
//  ATVidioEditProject
//
//  Created by Qiaojun Chen on 2018/6/11.
//  Copyright © 2018年 Qiaojun Chen. All rights reserved.
//

#import "ATRecordController.h"
#import "FMVideoPlayController.h"
#import "ATVidioView.h"
#import "ATVidioModel.h"
@interface ATRecordController ()<ATVideoViewDelegate>

@property (nonatomic, strong) ATVidioView *videoView;

@end

@implementation ATRecordController

- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor blackColor];
    _videoView = [[ATVidioView alloc] initWithFMVideoViewType:TypeFullScreen];
    _videoView.delegate = self;
    [self.view addSubview:_videoView];
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_videoView.fmodel.recordState == ATRecordStateFinish) {
        [_videoView reset];
    }
    
}
#pragma mark - ATVideoViewDelegate
- (void)dismissVC
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(void)recordFinishWithvideoUrl:(NSURL *)videoUrl vidioLength:(CGFloat)length
{
    FMVideoPlayController *playVC = [[FMVideoPlayController alloc] init];
    playVC.videoUrl =  videoUrl;
    playVC.vidioLength = length;
    [self.navigationController pushViewController:playVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
