//
//  VideoView.m
//  Video-Background
//
//  Created by Rama Milaneh on 3/27/17.
//  Copyright © 2017 Rama Milaneh. All rights reserved.
//

#import "VideoView.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoView ()

@property (nonatomic, strong) AVPlayer *player;

@property (nonatomic, strong) AVPlayerLayer *playerLayer;

- (void)videoFinishedPlaying:(NSNotification *)notification;

@end


@implementation VideoView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        // Find the video file
        NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"drop" ofType:@"mp4"];
        
        // Create a new URL based on the video location
        NSURL *videoURL = [NSURL fileURLWithPath:videoPath];
        
        // Create an item using the URL
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:videoURL];
        
        //Initilaizing the player with the item
         _player = [AVPlayer playerWithPlayerItem:playerItem];
        
        // Initilaizing the layer with player
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
        
        //Set the frame of the player equals to the frame of the view
        [_playerLayer setFrame:self.frame];
        
        // Choose to display the video to fill the screen
        _playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        
        // Add the video layer to the view layer
        [self.layer addSublayer:_playerLayer];
        
        // Keep tracking when the video finishes to replay it again
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(videoFinishedPlaying:)
                                                     name:AVPlayerItemDidPlayToEndTimeNotification
                                                     object:playerItem];
        
        // Avoid cutting off the user audio
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
  
    }
    return self;
}


-(void)playVideo {
    [_player play];
    
}

-(void)pauseVideo {
    [_player pause];
    
}

-(void)videoFinishedPlaying:(NSNotification *)notification {
    // Moves the playback cursor to the beginning of the video
    [_player seekToTime:kCMTimeZero];
    // play the video again
    [_player play];
}



@end
