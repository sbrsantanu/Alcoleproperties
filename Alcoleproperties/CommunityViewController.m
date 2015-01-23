//
//  CommunityViewController.m
//  Alcoleproperties
//
//  Created by Mac on 23/01/15.
//  Copyright (c) 2015 alcoleproperties. All rights reserved.
//

#import "CommunityViewController.h"
#import "UIColor+HexColor.h"
#import "AppDelegate.h"

@interface CommunityViewController ()<UIWebViewDelegate>
{
    CGRect mainFrame;
    UIWebView *ContainerWebview;
}
@property (nonatomic,retain) UIActivityIndicatorView *MainActivity;
@end

@implementation CommunityViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        mainFrame = [[UIScreen mainScreen] bounds];
        self.view.layer.frame = CGRectMake(0, 0, mainFrame.size.width, mainFrame.size.height);
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:[self UIViewSetHeaderViewWithbackButton:YES]];
    [self.view addSubview:[self UIViewSetFooterView]];
    
    _MainActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGRect frame = _MainActivity.frame;
    frame.origin.x = mainFrame.size.width / 2 - frame.size.width / 2;
    frame.origin.y = mainFrame.size.height / 2 - frame.size.height / 2;
    _MainActivity.frame = frame;
    [_MainActivity setColor:[UIColor colorFromHex:0xe66a4c]];
    [_MainActivity startAnimating];
    [self.view addSubview:_MainActivity];
    
    AppDelegate *MainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    ContainerWebview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, MainDelegate.window.layer.frame.size.width, MainDelegate.window.layer.frame.size.height-150)];
    [ContainerWebview setDelegate:self];
    
    NSString *url=@"http://www.alcoleproperties.com/_atlantic/community";
    NSURL *nsurl=[NSURL URLWithString:url];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [ContainerWebview loadRequest:nsrequest];
    [self.view addSubview:ContainerWebview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma UIWebview Delegate

#pragma mark -
#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // starting the load, show the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // finished loading, hide the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [_MainActivity stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [_MainActivity stopAnimating];
    // load error, hide the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    // report the error inside the webview
    NSString* errorString = [NSString stringWithFormat:
                             @"<html><center><font size=+5 color='red'>An error occurred:<br>%@</font></center></html>",
                             error.localizedDescription];
    [ContainerWebview loadHTMLString:errorString baseURL:nil];
}

@end
