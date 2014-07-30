//
//  BrowserController.m
//  audio_book
//
//  Created by Leonid Minderov on 23.07.13.
//
//

#import "BrowserController.h"

@interface BrowserController ()

@end

@implementation BrowserController



@synthesize stringURL;

- (void)viewDidLoad
{
    [super viewDidLoad];
    myBrowser = [ [UIWebView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44)];
 
    myBrowser.delegate = self;
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:stringURL];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
  //  NSString *jsCommand = [NSString stringWithFormat:@"document.body.style.zoom = 1.5;"];
   // [myBrowser stringByEvaluatingJavaScriptFromString:jsCommand];
    
    myBrowser.scalesPageToFit = YES;
    
    //Load the request in the UIWebView.
    [myBrowser loadRequest:requestObj];
    
    [self.view addSubview:myBrowser];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
   [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)viewDidUnload {

    [super viewDidUnload];
}
@end
