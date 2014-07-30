//
//  FirstTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "FirstTopViewController.h"
#import "LinksTableController.h"




@implementation FirstTopViewController

@synthesize audioPlayer;
@synthesize fromAudioMenu;
@synthesize playPauseButton;
@synthesize file_name;
@synthesize current_time;
@synthesize progress_slider;


- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
   
   self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
  // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
  // You just need to set the opacity, radius, and color.
  self.view.layer.shadowOpacity = 0.75f;
  self.view.layer.shadowRadius = 10.0f;
  self.view.layer.shadowColor = [UIColor blackColor].CGColor;
  
  if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
    self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
      
      
      
      
      
    //  self.slidingViewController.underLeftViewController = [[MenuViewController alloc] init];
      
  }
  
//  if (![self.slidingViewController.underRightViewController isKindOfClass:[UnderRightViewController class]]) {
//    self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UnderRight"];
//  }
  
    
    [self.navigationController.view addGestureRecognizer:self.slidingViewController.panGesture];
  
}

- (void)revealMenu
{
  [self.slidingViewController anchorTopViewTo:ECRight];
}

- (void)share
{
  
    
   
                     
                     // Create the item to share (in this example, a url)
                     NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/konstitucia-rossijskoj-federacii/id667794409?l=ru"];
                     SHKItem *item = [SHKItem URL:url title:@"Рекомендую скачать мобильное приложение Конституция РФ с последними правками!" contentType:SHKURLContentTypeWebpage];
                     
                     // Get the ShareKit action sheet
                     SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
                     
                     // ShareKit detects top view controller (the one intended to present ShareKit UI) automatically,
                     // but sometimes it may not find one. To be safe, set it explicitly
                     [SHK setRootViewController:self];
                     
                     // Display the action sheet
                     [actionSheet showFromToolbar:self.navigationController.toolbar];
}

-(void)initAudio: (NSInteger)indexRow
{
    BOOL first_upload = NO;
        if(audioPlayer)
        {
            [audioPlayer dismissAudioPlayer];
        }
        if(!fromAudioMenu)
        {
            first_upload= YES;
            fromAudioMenu = (MenuViewController*) self.slidingViewController.underLeftViewController;
        }
    
        file_name.text = fromAudioMenu.selectedSong;
        audioPlayer = [[MDAudioPlayerController alloc] initWithSoundFiles:fromAudioMenu.songs atPath:[[NSBundle mainBundle] bundlePath] andSelectedIndex:indexRow];
    
  
    
    audioPlayer.player.delegate = self;
    
    progress_slider.maximumValue=audioPlayer.player.duration;
    progress_slider.value = 0;
    
    
    //    [audioPlayer play];
    
    updateTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(updateCurrentTime) userInfo:nil repeats:YES];
    
    if(!first_upload)
        [self setPlay];
       
    
}





- (IBAction)prevSong:(id)sender {
    int next_song = fromAudioMenu.selectedSongIndex-1;
    if(0 <= next_song)
    {
        [audioPlayer previous];
        audioPlayer.player.delegate = self;
        fromAudioMenu.selectedSongIndex-=1;
        
        [fromAudioMenu.menuTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:fromAudioMenu.selectedSongIndex inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        
        progress_slider.maximumValue=audioPlayer.player.duration;
        progress_slider.value = 0;
        [self updateCurrentTime];
        [self setPlay];
        
        file_name.text = [fromAudioMenu.fileNameArray objectAtIndex:fromAudioMenu.selectedSongIndex];
    }
    else NSLog(@"its first song in playlist");
    
 
    
}


-(void)setPlay
{
        
    if ([audioPlayer.player play])
    {
        NSString *imageName = (is_ipad ? @"ipad_pause_off" : @"pause_off");
        UIImage *backgroundButton = [UIImage imageNamed:imageName];
        [playPauseButton setBackgroundImage:backgroundButton forState:UIControlStateNormal];
       // [playPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        
    }
    else
    {
        NSLog(@"Could not play %@\n", audioPlayer.player.url);
    }
}
-(void)setPause
{
    [audioPlayer.player pause];
    
    NSString *imageName = (is_ipad ? @"ipad_play_off" : @"play_off");
    UIImage *backgroundButton = [UIImage imageNamed:imageName];
    [playPauseButton setBackgroundImage:backgroundButton forState:UIControlStateNormal];
   // [playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
}

- (IBAction)pause_play:(id)sender {
    if (audioPlayer.player.playing == YES)
	{
		
        [self setPause];
	}
	else
	{
        [self setPlay];
		
	}

}

- (IBAction)plus10sec:(id)sender {
   
    
    
    
    float get_currentTime = audioPlayer.player.currentTime + 10.0f;
    
    if(get_currentTime < audioPlayer.player.duration)
    {
        audioPlayer.player.currentTime = get_currentTime;
        NSLog(@"actial time: %f",audioPlayer.player.currentTime);
        NSLog(@"full time: %f",audioPlayer.player.duration);
        [self updateCurrentTime];
        
        
    }
    else NSLog(@"song will be finish!");
}

- (IBAction)minus10sec:(id)sender {
    float get_currentTime = audioPlayer.player.currentTime - 10.0f;
    
    if(get_currentTime >= 0.0f)
    {
        audioPlayer.player.currentTime = get_currentTime;
        NSLog(@"actial time: %f",audioPlayer.player.currentTime);
        [self updateCurrentTime];
       
    }
    else NSLog(@"song still not begin!");
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    int next_song = fromAudioMenu.selectedSongIndex+1;
    if(next_song<=[fromAudioMenu.songs count]-1)
    {
        [audioPlayer next];
        audioPlayer.player.delegate = self;
        fromAudioMenu.selectedSongIndex+=1;
        
        [fromAudioMenu.menuTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:fromAudioMenu.selectedSongIndex inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        
        progress_slider.maximumValue=audioPlayer.player.duration;
        progress_slider.value = 0;
        [self updateCurrentTime];
        
        
        file_name.text = [fromAudioMenu.fileNameArray objectAtIndex:fromAudioMenu.selectedSongIndex];
    }
    else
    {
        [self setPause];
        progress_slider.value=0;
        [self updateCurrentTime];
        
    }
        
}

- (IBAction)nextSong:(id)sender {
    int next_song = fromAudioMenu.selectedSongIndex+1;
    if(next_song<=[fromAudioMenu.songs count]-1)
    {
        [audioPlayer next];
        audioPlayer.player.delegate = self;
     //   fromAudioMenu.selectedSongIndex+=1;
      //  NSLog(@"selected_song: %i",fromAudioMenu.selectedSongIndex);
        fromAudioMenu.selectedSongIndex++;
       // NSLog(@"next_song: %i",next_index_song);
       
        [fromAudioMenu.menuTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:fromAudioMenu.selectedSongIndex inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        
       
        
        progress_slider.maximumValue=audioPlayer.player.duration;
        progress_slider.value = 0;
        [self updateCurrentTime];
        [self setPlay];
        
        file_name.text = [fromAudioMenu.fileNameArray objectAtIndex:fromAudioMenu.selectedSongIndex];
    }
    else NSLog(@"its last song in playlist");
 
}



- (void)viewDidUnload {

 
    [self setPlayPauseButton:nil];
    [self setFile_name:nil];
    [self setCurrent_time:nil];
    [self setProgress_slider:nil];
    [self setFlag:nil];
    [super viewDidUnload];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    if(IS_IPHONE_5)
    {
        [self.flag setImage:[UIImage imageNamed:@"iphone5_flag"]];
        NSLog(@"WORK!");
        CGRect frame = self.flag.frame;
        frame.size.height = 346;
        self.flag.frame = frame;
    }
        
    
    fromAudioMenu = (MenuViewController*) self.slidingViewController.underLeftViewController;
    
    UIView *borderLeft = [[UIView alloc] initWithFrame:CGRectMake(-1, 0, 1, self.view.bounds.size.height)];
    NSLog(@"%f",self.view.bounds.size.height);
    borderLeft.backgroundColor = [self colorWithHexString:@"0c1331"];
    
    
    
    [self.navigationController.view addSubview:borderLeft];
    
    // меняем navigation bar
    
    
    NSString *imageName = (is_ipad ? @"ipad_navbar" : @"navbar");
    UIImage *NavigationPortraitBackground = [UIImage imageNamed:imageName];
    
    
    [self.navigationController.navigationBar setBackgroundImage:NavigationPortraitBackground forBarMetrics:UIBarMetricsDefault];
    
    
    // кнопка назад
    UIButton *backBtn     = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"menu"];
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    
    [backBtn addTarget:self action:@selector(revealMenu) forControlEvents:UIControlEventTouchUpInside];
    
    backBtn.frame = CGRectMake(0, 0, 49, 33);
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    
    // кнопка соц]_сети
    UIButton *socialButton     = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *socialButtonImage = [UIImage imageNamed:@"sh"];
    [socialButton setBackgroundImage:socialButtonImage forState:UIControlStateNormal];
    
    [socialButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
    socialButton.frame = CGRectMake(0, 0, 49, 33);
    
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithCustomView:socialButton];
    //self.navigationItem.rightBarButtonItem = shareButton;
    
    // кнопка соц]_сети
    UIButton *socialButton2     = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *socialButtonImage2 = [UIImage imageNamed:@"in"];
    [socialButton2 setBackgroundImage:socialButtonImage2 forState:UIControlStateNormal];
    
    [socialButton2 addTarget:self action:@selector(goToLinks) forControlEvents:UIControlEventTouchUpInside];
    
    socialButton2.frame = CGRectMake(0, 0, 49, 33);
    
    UIBarButtonItem *shareButton2 = [[UIBarButtonItem alloc] initWithCustomView:socialButton2];
    //self.navigationItem.rightBarButtonItem = shareButton;
    
    
    
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(-10.0f, 0.0f, 123.0f, 33)];
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *transparentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [toolbar setBackgroundImage:transparentImage forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    

    NSArray* buttons = [NSArray arrayWithObjects:shareButton2, shareButton, nil];
    [toolbar setItems:buttons animated:NO];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:toolbar];
  
    
    
    
  //  self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:spacer,saveButton, nil];
    
    
    
    // меняем текст в навигейшен бар 
    
    float fontHeight = (is_ipad ? 21.0f : 15.0f);
    
    UILabel * titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont systemFontOfSize:fontHeight];
    titleView.text = @"КОНСТИТУЦИЯ РФ";
    titleView.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.34];
    titleView.shadowOffset = CGSizeMake(0.0f, 1.0f);
    titleView.textColor = [self colorWithHexString:@"1b1c64"]; // Your color here
    self.navigationItem.titleView = titleView;
    [titleView sizeToFit];
}


-(void)goToLinks
{
    LinksTableController *a = [[LinksTableController alloc] init];
    [self.navigationController pushViewController:a animated:YES];
    

}

- (UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (IBAction)changeProgressBar:(id)sender {
    
        
        [audioPlayer progressSliderMoved:progress_slider];
       
    [self updateCurrentTime];
//    
//    NSLog(@"current time: %f == %f value",audioPlayer.player.currentTime,progress_slider.value);
//    
//    NSLog(@"full time: %f",audioPlayer.player.duration);
    
    
    
    
}
-(void)updateCurrentTime
{
    NSString *current = [NSString stringWithFormat:@"%d:%02d", (int)audioPlayer.player.currentTime / 60, (int)audioPlayer.player.currentTime % 60, nil];
	NSString *dur = [NSString stringWithFormat:@"%d:%02d", (int)((int)(audioPlayer.player.duration)) / 60, (int)((int)(audioPlayer.player.duration)) % 60, nil];
    
    
    current_time.text = [NSString stringWithFormat:@"%@ / %@",current, dur];
    
    [self updateProgressBar];
}
-(void)updateProgressBar
{
    progress_slider.value = audioPlayer.player.currentTime;
}

@end