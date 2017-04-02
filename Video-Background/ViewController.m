//
//  ViewController.m
//  Video-Background
//
//  Created by Rama Milaneh on 3/27/17.
//  Copyright © 2017 Rama Milaneh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) VideoView *videoBackgroundView;
@property (nonatomic, strong) UIButton *logInButton;
@property (nonatomic, strong) UIButton *createAnAccountButton;
@property (nonatomic, strong) UILabel *alreadyUser;
@property (nonatomic, strong) UILabel *welcomeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _videoBackgroundView = [[VideoView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_videoBackgroundView];
    [self setupViews];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.videoBackgroundView playVideo];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.videoBackgroundView pauseVideo];
}

-(void)setupViews {
    
    UIColor *buttonColor = [UIColor colorWithRed:91/255.0 green:155/255.0 blue:171/255.0 alpha:1];
    // Log in button setup
    _logInButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [self.view addSubview:_logInButton];
    _logInButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[_logInButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-100] setActive:YES];
    [[_logInButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[_logInButton.widthAnchor constraintEqualToConstant:0.7*self.view.frame.size.width] setActive:YES];
    [[_logInButton.heightAnchor constraintEqualToConstant:40] setActive:YES];
    
    [_logInButton setTitle:@"LOG IN" forState:UIControlStateNormal];
    _logInButton.titleLabel.font = [UIFont systemFontOfSize:16];
    _logInButton.clipsToBounds = YES;
    [_logInButton.layer setBorderWidth:3.0];
    [_logInButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    _logInButton.layer.cornerRadius = 20;
    [_logInButton setBackgroundColor:[UIColor clearColor]];
    [_logInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    // Create account button setup
    _createAnAccountButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [self.view addSubview:_createAnAccountButton];
    _createAnAccountButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[_createAnAccountButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-190] setActive:YES];
    [[_createAnAccountButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[_createAnAccountButton.widthAnchor constraintEqualToConstant:0.7*self.view.frame.size.width] setActive:YES];
    [[_createAnAccountButton.heightAnchor constraintEqualToConstant:40] setActive:YES];
    
    [_createAnAccountButton setTitle:@"CREATE ACCOUNT" forState:UIControlStateNormal];
    _createAnAccountButton.titleLabel.font = [UIFont systemFontOfSize:16];
    _createAnAccountButton.clipsToBounds = YES;
    _createAnAccountButton.layer.cornerRadius = 20;
    [_createAnAccountButton setBackgroundColor:buttonColor];
    [_createAnAccountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    // already user label setup
    _alreadyUser = [[UILabel alloc] init];
    [self.view addSubview:_alreadyUser];
    _alreadyUser.translatesAutoresizingMaskIntoConstraints = NO;
    [[_alreadyUser.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[_alreadyUser.bottomAnchor constraintEqualToAnchor:self.logInButton.topAnchor constant:-10] setActive:YES];
    [[_alreadyUser.heightAnchor constraintEqualToConstant:22] setActive:YES];
    [[_alreadyUser.widthAnchor constraintEqualToConstant:100] setActive:YES];
    
    [_alreadyUser setTextColor:[UIColor blackColor]];
    [_alreadyUser setText:NSLocalizedString(@"Already a user?", nil)];
    [_alreadyUser setAdjustsFontSizeToFitWidth:YES];
    [_alreadyUser setFont:[UIFont systemFontOfSize:12]];
    [_alreadyUser setTextColor:[UIColor whiteColor]];

    // welcome label setup
    _welcomeLabel= [[UILabel alloc] init];
    [self.view addSubview:_welcomeLabel];
    _welcomeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[_welcomeLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[_welcomeLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100] setActive:YES];
    [[_welcomeLabel.heightAnchor constraintEqualToConstant:50] setActive:YES];
    [[_welcomeLabel.widthAnchor constraintEqualToConstant:200] setActive:YES];
    
    [_welcomeLabel setTextColor:[UIColor blackColor]];
    [_welcomeLabel setText:NSLocalizedString(@"  WELCOME", nil)];
    [_welcomeLabel setAdjustsFontSizeToFitWidth:YES];
    [_welcomeLabel setFont:[UIFont boldSystemFontOfSize:36]];
    [_welcomeLabel setTextColor:[UIColor whiteColor]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
