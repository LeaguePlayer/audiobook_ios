//
//  FirstTopViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "SHK.h"
#import "MDAudioFile.h"
#import "MDAudioPlayerController.h"


@interface FirstTopViewController : UIViewController <AVAudioPlayerDelegate>
{

    MenuViewController *fromAudioMenu;
    MDAudioPlayerController *audioPlayer;
   
    NSTimer				*updateTimer;

}
- (IBAction)changeProgressBar:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *progress_slider;
@property (strong, nonatomic) IBOutlet UIImageView *flag;

@property (strong, nonatomic) IBOutlet UILabel *current_time;

@property (strong, nonatomic) IBOutlet UILabel *file_name;

@property (strong, nonatomic) IBOutlet UIButton *playPauseButton;

@property (nonatomic,strong) MenuViewController *fromAudioMenu;
@property (nonatomic,retain) MDAudioPlayerController *audioPlayer;

- (IBAction)nextSong:(id)sender;
//- (IBAction)revealMenu:(id)sender;
-(void)initAudio: (NSInteger)indexRow;

- (IBAction)prevSong:(id)sender;
- (IBAction)pause_play:(id)sender;
- (IBAction)plus10sec:(id)sender;
- (IBAction)minus10sec:(id)sender;

@end
