//
//  ATVidioView.h
//  ATVidioEditProject
//
//  Created by Qiaojun Chen on 2018/6/11.
//  Copyright © 2018年 Qiaojun Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATVidioModel.h"

@protocol ATVideoViewDelegate <NSObject>

-(void)dismissVC;
-(void)recordFinishWithvideoUrl:(NSURL *)videoUrl vidioLength:(CGFloat)length;

@end

@interface ATVidioView : UIView

@property (nonatomic, assign) ATVideoViewType viewType;
@property (nonatomic, strong, readonly) ATVidioModel *fmodel;
@property (nonatomic, weak) id <ATVideoViewDelegate> delegate;

- (instancetype)initWithFMVideoViewType:(ATVideoViewType)type;
- (void)reset;

@end
