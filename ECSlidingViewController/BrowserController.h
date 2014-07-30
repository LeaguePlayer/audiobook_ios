//
//  BrowserController.h
//  audio_book
//
//  Created by Leonid Minderov on 23.07.13.
//
//

#import <UIKit/UIKit.h>

@interface BrowserController : UIViewController <UIWebViewDelegate>
{
    NSString *stringURL;
    UIWebView *myBrowser;
    
}

@property (nonatomic,retain) NSString *stringURL;


@end
