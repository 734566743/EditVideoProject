//
//  ATVideoProgressView.h
//  ATVidioEditProject
//
//  Created by Qiaojun Chen on 2018/6/11.
//  Copyright © 2018年 Qiaojun Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATVideoProgressView : UIView

/**
 初始化
 @param frame 大小
 @return 对象
 */
- (instancetype)initWithFrame:(CGRect)frame;

/**
 更新进度
 @param progress 更新的进度
 */
-(void)updateProgressWithValue:(CGFloat)progress;

/**
 重置进度
 */
-(void)resetProgress;

@end
