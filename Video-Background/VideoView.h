//
//  VideoView.h
//  Video-Background
//
//  Created by Rama Milaneh on 3/27/17.
//  Copyright © 2017 Rama Milaneh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoView : UIView

-(instancetype)initWithFrame:(CGRect)frame;
-(void)playVideo;
-(void)pauseVideo;

@end
