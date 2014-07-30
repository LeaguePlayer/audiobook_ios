//
//  MenuViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "MenuViewController.h"
#import "FirstTopViewController.h"
#import "myCell.h"

@interface MenuViewController()



@end

@implementation MenuViewController
@synthesize fileArray;
@synthesize fileNameArray;
@synthesize songs;
@synthesize selectedSongIndex;
@synthesize selectedSong;
@synthesize menuTable;

//@synthesize first_top_view_controller;

- (void)awakeFromNib
{
       fileArray = [[NSMutableArray alloc] init];
    fileNameArray = [[NSMutableArray alloc] initWithObjects:
                     @"Конституция Российской Федерации. Вступление",
                     @"Раздел 1. Глава 1. - Основы конституционного строя. Статья 1",
                     @"Статья 2",
                     @"Статья 3",
                     @"Статья 4",
                     @"Статья 5",
                     @"Статья 6",
                     @"Статья 7",
                     @"Статья 8",
                     @"Статья 9",
                     @"Статья 10",
                     @"Статья 11",
                     @"Статья 12",
                     @"Статья 13",
                     @"Статья 14",
                     @"Статья 15",
                     @"Статья 16",
                     @"Глава 2.- Права и свободы человека и гражданина. Статья 17",
                     @"Статья 18",
                     @"Статья 19",
                     @"Статья 20",
                     @"Статья 21",
                     @"Статья 22",
                     @"Статья 23",
                     @"Статья 24",
                     @"Статья 25",
                     @"Статья 26",
                     @"Статья 27",
                     @"Статья 28",
                     @"Статья 29",
                     @"Статья 30",
                     @"Статья 31",
                     @"Статья 32",
                     @"Статья 33",
                     @"Статья 34",
                     @"Статья 35",
                     @"Статья 36",
                     @"Статья 37",
                     @"Статья 38",
                     @"Статья 39",
                     @"Статья 40",
                     @"Статья 41",
                     @"Статья 42",
                     @"Статья 43",
                     @"Статья 44",
                     @"Статья 45",
                     @"Статья 46",
                     @"Статья 47",
                     @"Статья 48",
                     @"Статья 49",
                     @"Статья 50",
                     @"Статья 51",
                     @"Статья 52",
                     @"Статья 53",
                     @"Статья 54",
                     @"Статья 55",
                     @"Статья 56",
                     @"Статья 57",
                     @"Статья 58",
                     @"Статья 59",
                     @"Статья 60",
                     @"Статья 61",
                     @"Статья 62",
                     @"Статья 63",
                     @"Статья 64",
                     @"Глава 3.- Федеративное устройство. Статья 65",
                     @"Статья 66",
                     @"Статья 67",
                     @"Статья 68",
                     @"Статья 69",
                     @"Статья 70",
                     @"Статья 71",
                     @"Статья 72",
                     @"Статья 73",
                     @"Статья 74",
                     @"Статья 75",
                     @"Статья 76",
                     @"Статья 77",
                     @"Статья 78",
                     @"Статья 79",
                     @"Глава 4.- Президент Российской Федерации. Статья 80",
                     @"Статья 81",
                     @"Статья 82",
                     @"Статья 83",
                     @"Статья 84",
                     @"Статья 85",
                     @"Статья 86",
                     @"Статья 87",
                     @"Статья 88",
                     @"Статья 89",
                     @"Статья 90",
                     @"Статья 91",
                     @"Статья 92",
                     @"Статья 93",
                     @"Глава 5.- Федеральное собрание. Статья 94",
                     @"Статья 95",
                     @"Статья 96",
                     @"Статья 97",
                     @"Статья 98",
                     @"Статья 99",
                     @"Статья 100",
                      @"Статья 101",
                      @"Статья 102",
                      @"Статья 103",
                      @"Статья 104",
                      @"Статья 105",
                      @"Статья 106",
                      @"Статья 107",
                      @"Статья 108",
                      @"Статья 109",
                      @"Глава 6.- Правительство Российской Федерации. Статья 110",
                     @"Статья 111",
                     @"Статья 112",
                     @"Статья 113",
                     @"Статья 114",
                     @"Статья 115",
                     @"Статья 116",
                     @"Статья 117",
                     @"Глава 7.- Судебная власть. Статья 118",
                     @"Статья 119",
                    @"Статья 120",
                     @"Статья 121",
                     @"Статья 122",
                     @"Статья 123",
                     @"Статья 124",
                     @"Статья 125",
                     @"Статья 126",
                     @"Статья 127",
                     @"Статья 128",
                     @"Статья 129",
                     @"Глава 8.- Местное самоуправление.  Статья 130",
                     @"Статья 131",
                     @"Статья 132",
                     @"Статья 133",
                     @"Глава 9.- Конституционные поправки и пересмотр конституции. Статья 134",
                     @"Статья 135",
                     @"Статья 136",
                     @"Статья 137",
                     @"Раздел 2- Заключительное и переходное положение",
                     
                     
                     nil];
    
    for(NSString *fileName in fileNameArray)
    {
        [fileArray addObject:[[NSBundle mainBundle] pathForResource:fileName ofType:@"mp3"]];
    }
    
    songs = [self returnPlayList:fileArray];
    
   
    
//    fileArray = [[NSMutableArray alloc] initWithObjects:
//                 [[NSBundle mainBundle] pathForResource:@"Capleton - Acres" ofType:@"mp3"],
//				 [[NSBundle mainBundle] pathForResource:@"Capleton - Critics" ofType:@"mp3"],
//				 [[NSBundle mainBundle] pathForResource:@"Capleton - Follow me" ofType:@"mp3"],
//                 [[NSBundle mainBundle] pathForResource:@"Capleton - Jah Jah City" ofType:@"mp3"],
//                 [[NSBundle mainBundle] pathForResource:@"Capleton - My Love" ofType:@"mp3"],
//                 nil];
    
//  NSLog(@"songs");
}

- (void)viewDidLoad
{
  [super viewDidLoad];
    
    menuTable.separatorColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sep"]];
   [menuTable setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_right_menu"]]];
    
    
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	
    if([songs count] > 0)
    {
        
        UINavigationController *NavTopController = (UINavigationController *)self.slidingViewController.topViewController;
        
        
        id obj = [NavTopController.viewControllers objectAtIndex:0];
        
        
        FirstTopViewController* TopController = (FirstTopViewController*)obj;
        
        
        [menuTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        selectedSongIndex = 0;
        selectedSong = [fileNameArray objectAtIndex:0];
        [TopController initAudio:0];
        
    }
    else NSLog(@"error: cant load playlist");

    
    
  
  [self.slidingViewController setAnchorRightRevealAmount:280.0f];
  self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    
    
}


-(NSMutableArray *)returnPlayList: (NSMutableArray *)files
{
    NSMutableArray *temp_songs = [[NSMutableArray alloc] init];
	
	for (NSString *song in files)
	{
		MDAudioFile *audioFile = [[MDAudioFile alloc] initWithPath:[NSURL fileURLWithPath:song]];
		[temp_songs addObject:audioFile];
	}
    return temp_songs;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
  return self.fileNameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//  NSString *cellIdentifier = @"MenuItemCell";
//  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//  if (cell == nil) {
//    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
//      
//      
//        
//      
//     
//  }
  
  
    static NSString *CellIdentifier = @"myCell";
    myCell *cell = (myCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        //Создание ячейки
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"myCell" owner:nil options:nil];
        
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[myCell class]])
            {
                cell = (myCell *)currentObject;
            }
        }
        
     // cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    
    //    UILabel *myTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(27, 0, 250, 44)];
    CGRect frame = CGRectMake(27, 0, 250, 44);
    cell.myTextLabel.frame = frame;
    cell.myTextLabel.text = [self.fileNameArray objectAtIndex:indexPath.row];

        
    cell.myTextLabel.numberOfLines = 0;
    cell.myTextLabel.font = [UIFont fontWithName:@"Helvetica" size:(14.0)];
    cell.myTextLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.myTextLabel.textAlignment = UITextAlignmentLeft;
    
        cell.myTextLabel.backgroundColor = [UIColor clearColor];
    
        cell.myTextLabel.numberOfLines = 2;
        cell.myTextLabel.textColor = [self colorWithHexString:@"0b144b"];
        cell.myTextLabel.shadowColor = [UIColor colorWithWhite:1.0 alpha:0.34];
        cell.myTextLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
    //    cell.myTextLabel.font = [UIFont systemFontOfSize:14.0];      
        cell.myTextLabel.highlightedTextColor = [self colorWithHexString:@"0b144b"];
    
    
  
 
    
    
    
   
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"currentCell"]];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_right_menu"]];
    
  
    
    

  
  return cell;
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  //  NSLog(@"%i",indexPath.row);
    
   
    
    
    if([songs count] > 0)
    {
        
        UINavigationController *NavTopController = (UINavigationController *)self.slidingViewController.topViewController;
      

        id obj = [NavTopController.viewControllers objectAtIndex:0];
      
      
        FirstTopViewController* TopController = (FirstTopViewController*)obj;
        
        

        selectedSongIndex = indexPath.row;
        selectedSong = [fileNameArray objectAtIndex:indexPath.row];
        [TopController initAudio:indexPath.row];
        
    }
    else NSLog(@"error: cant load playlist");
  

    
     [self.slidingViewController resetTopView];
}

@end
