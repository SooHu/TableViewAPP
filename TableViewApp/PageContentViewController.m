//
//  PageContentViewController.m
//  TableViewApp
//
//  Created by HuS on 15/6/10.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headLabel.text = self.heading;
    self.subHeadLabel.text = self.subHeading;
    self.contentImageView.image = [UIImage imageNamed:self.imageFile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
