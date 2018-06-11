//
//  ATVidioModel.h
//  ATVidioEditProject
//
//  Created by Qiaojun Chen on 2018/6/11.
//  Copyright © 2018年 Qiaojun Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

//录制视频的长宽比
typedef NS_ENUM(NSInteger, ATVideoViewType) {
    Type1X1 = 0,
    Type4X3,
    TypeFullScreen
};

//闪光灯状态
typedef NS_ENUM(NSInteger, ATFlashState) {
    ATFlashClose = 0,
    ATFlashOpen,
    ATFlashAuto,
};

//录制状态
typedef NS_ENUM(NSInteger, ATRecordState) {
    ATRecordStateInit = 0,
    ATRecordStateRecording,
    ATRecordStatePause,
    ATRecordStateFinish,
};

//控制录制的视频是否有声音
typedef NS_ENUM(NSInteger, ATVidioType) {
    ATVidioSoundType = 0,
    ATVidioNoSoundType,
};

@protocol ATModelDelegate <NSObject>

- (void)updateFlashState:(ATFlashState)state;
- (void)updateRecordingProgress:(CGFloat)progress;
- (void)updateRecordState:(ATRecordState)recordState;

@end

@interface ATVidioModel : NSObject

@property (nonatomic, weak  ) id<ATModelDelegate>delegate;
@property (nonatomic, assign) ATRecordState recordState;
@property (nonatomic, strong, readonly) NSURL *videoUrl;

- (instancetype)initWithFMVideoViewType:(ATVideoViewType)type soundType:(ATVidioType)soundType superView:(UIView *)superView;

- (void)turnCameraAction;
- (void)switchflash;
- (void)startRecord;
- (void)stopRecord;
- (void)reset;

@end
