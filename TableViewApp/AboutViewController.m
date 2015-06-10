//
//  AboutViewController.m
//  TableViewApp
//
//  Created by HuS on 15/6/10.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "AboutViewController.h"
#import "WebViewController.h"
@interface AboutViewController ()
@property (nonatomic)NSURLSession *session;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)contactMe:(id)sender
{
}

- (IBAction)toMyBlog:(id)sender
{
    
}

- (void)prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender
{
    if ([segue.identifier isEqual:@"toBlog"]) {
        NSString *requestString = @"http://soohu.github.io";
        NSURL *url = [NSURL URLWithString:requestString];
        WebViewController *wvc = segue.destinationViewController;
        wvc.url = url;
        wvc.title = @"MyBlog";
    }
    
    if ([segue.identifier isEqual:@"toGithub"]) {
        NSString *requestString = @"https://github.com/SooHu";
        NSURL *url = [NSURL URLWithString:requestString];
        WebViewController *wvc = segue.destinationViewController;
        wvc.url = url;
        wvc.title = @"Github";
    }
}

@end
