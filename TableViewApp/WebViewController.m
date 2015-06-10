//
//  WebViewController.m
//  TableViewApp
//
//  Created by HuS on 15/6/10.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@end

@implementation WebViewController

//- (void)loadView
//{
//    self.webView.scalesPageToFit = YES;
//    [self.view addSubview:self.webView];
//    
//}

//- (void)setUrl:(NSURL *)url
//{
//    _url = url;
//    if (_url) {
//        [self.spinner startAnimating];
//        [self loadWebView:_url];
//    }
//}

//- (void)loadWebView:(NSURL *)url
//{
//    
//    NSURLRequest *req = [NSURLRequest requestWithURL:_url];
//    [self.webView loadRequest:req];
//    if (self.webView.loading == NO) {
//        [self.spinner stopAnimating];
//    }
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.webView.bounds = self.view.bounds;
    self.webView.scalesPageToFit = YES;
    [self.spinner startAnimating];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.spinner];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:req];
    if (self.webView.loading == NO) {
        [self.spinner stopAnimating];
    }
}



- (IBAction)goBack:(id)sender
{
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
}
- (IBAction)goForward:(id)sender
{
    if (self.webView.canGoForward) {
        [self.webView goForward];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
