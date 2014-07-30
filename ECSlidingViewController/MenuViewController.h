//
//  MenuViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"



@interface MenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITabBarControllerDelegate>
{
    NSMutableArray *fileArray;
    NSMutableArray *fileNameArray;
    NSMutableArray *songs;
    NSInteger selectedSongIndex;
    NSString *selectedSong;
    
  //  FirstTopViewController *first_top_view_controller;
    
}
@property (strong, nonatomic) IBOutlet UITableView *menuTable;

@property (nonatomic) NSInteger selectedSongIndex;
@property (nonatomic,retain) NSMutableArray *fileArray;
@property (nonatomic,retain) NSMutableArray *fileNameArray;
@property (nonatomic,retain) NSMutableArray *songs;
@property (nonatomic,retain) NSString *selectedSong;

//@property (nonatomic,retain) FirstTopViewController *first_top_view_controller;

@end
