//
//  WebViewController.m
//  TableViewApp
//
//  Created by HuS on 15/6/10.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "WebViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
@interface WebViewController () <UIWebViewDelegate>
{
    SystemSoundID soundID;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
- (void)handleSwipeLeftWithRecognizer:(UISwipeGestureRecognizer *)swipeGesture;
- (void)handleSwipeRightWithRecognizer:(UISwipeGestureRecognizer *)swipeGesture;
@end

@implementation WebViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView.delegate = self;//设置委托
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];//添加WebView为View的子视图

    NSURLRequest *req = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:req];//加载请求
    
    //添加手势操作
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeftWithRecognizer:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRightWithRecognizer:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.webView addGestureRecognizer:swipeLeft];
    [self.webView addGestureRecognizer:swipeRight];
}

//返回
- (IBAction)goBack:(id)sender
{
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
    [self playSoundEffect:@"pop" type:@"wav"];
}
//前进
- (IBAction)goForward:(id)sender
{
    if (self.webView.canGoForward) {
        [self.webView goForward];
    }
    [self playSoundEffect:@"pop" type:@"wav"];
}
//委托方法:网页视图开始加载一个请求后得到的消息
- (void)webViewDidStartLoad:(nonnull UIWebView *)webView
{
    [self.spinner startAnimating];
    [self.view addSubview:self.spinner];
}
//委托方法:网页视图结束加载一个请求后得到的消息
- (void)webViewDidFinishLoad:(nonnull UIWebView *)webView
{
    [self.spinner stopAnimating];
    //还需要在属性控制器处设置hidden when stop
}

#pragma mark - 手势操作:左滑和右滑
- (void)handleSwipeLeftWithRecognizer:(UISwipeGestureRecognizer *)swipeGesture
{
    if (self.webView.canGoForward) {
        [self.webView goForward];
    }
}
- (void)handleSwipeRightWithRecognizer:(UISwipeGestureRecognizer *)swipeGesture
{
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
}

#pragma mark - 播放音效
-(void)playSoundEffect:(NSString *)name type:(NSString *)type
{
    NSString *soundFilePath =[[NSBundle mainBundle] pathForResource:name ofType:type];
    NSURL *soundURL = [NSURL fileURLWithPath:soundFilePath];

    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundID);
    AudioServicesPlaySystemSound(soundID);//播放系统音效
}
@end
