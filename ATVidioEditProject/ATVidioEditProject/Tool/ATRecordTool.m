


//
//  ATRecordTool.m
//  RLAudioRecord
//
//  Created by Qiaojun Chen on 2018/6/11.
//  Copyright © 2018年 Enorth.com. All rights reserved.
//

#import "ATRecordTool.h"
#import <AVFoundation/AVFoundation.h>

@interface ATRecordTool()

@property (nonatomic, strong) AVAudioSession *session;

@property (nonatomic, strong) AVAudioRecorder *recorder;//录音器

@property (nonatomic, strong) NSURL *recordFileUrl; //文件地址

@property (nonatomic, strong) NSString *filePath;

@end

@implementation ATRecordTool

-(void)startRecord
{
    AVAudioSession *session =[AVAudioSession sharedInstance];
    NSError *sessionError;
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
    
    if (session != nil) {
        [session setActive:YES error:nil];
    }
    self.session = session;
    
    
    //1.获取沙盒地址
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    _filePath = [path stringByAppendingString:@"/RRecord.wav"];
    NSLog(@"_filePath =%@",_filePath);
    //2.获取文件路径
    self.recordFileUrl = [NSURL fileURLWithPath:_filePath];
    
    //设置参数
    NSDictionary *recordSetting = [[NSDictionary alloc] initWithObjectsAndKeys:
                                   //采样率  8000/11025/22050/44100/96000（影响音频的质量）
                                   [NSNumber numberWithFloat: 8000.0],AVSampleRateKey,
                                   // 音频格式
                                   [NSNumber numberWithInt: kAudioFormatLinearPCM],AVFormatIDKey,
                                   //采样位数  8、16、24、32 默认为16
                                   [NSNumber numberWithInt:16],AVLinearPCMBitDepthKey,
                                   // 音频通道数 1 或 2
                                   [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
                                   //录音质量
                                   [NSNumber numberWithInt:AVAudioQualityHigh],AVEncoderAudioQualityKey,
                                   nil];
    
    
    _recorder = [[AVAudioRecorder alloc] initWithURL:self.recordFileUrl settings:recordSetting error:nil];
    
    if (_recorder) {
        _recorder.meteringEnabled = YES;
        [_recorder prepareToRecord];
        [_recorder record];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(60 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self stopRecord];
        });
    }else{
        NSLog(@"音频格式和文件存储格式不匹配,无法初始化Recorder");
        
    }
}

-(NSString *)stopRecord
{
    if ([self.recorder isRecording]) {
        [self.recorder stop];
        
    }
    return _filePath;
}

@end
