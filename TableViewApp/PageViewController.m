//
//  PageViewController.m
//  TableViewApp
//
//  Created by HuS on 15/6/10.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "PageViewController.h"
#import "PageContentViewController.h"
@interface PageViewController () <UIPageViewControllerDataSource>

@end

@implementation PageViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.pageHeadings = @[@"Personalize", @"Locate", @"Discover"];
        self.pageSubHeadings = @[@"Pin your favourite restaurants and create your own food guide", @"Search and locate your favourite restaurant on Maps", @"Find restaurants pinned by your friends and other foodies around the world"];
        self.pageImages = @[@"homei", @"mapintro", @"fiveleaves"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = self;
    
    PageContentViewController *pcvc = [[PageContentViewController alloc] init];
    pcvc = [self viewControllerAtIndex:0];
    
    [self setViewControllers:@[pcvc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    PageContentViewController *pcvc = [[PageContentViewController alloc] init];
    NSInteger index = pcvc.index;
    index ++;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    PageContentViewController *pcvc = [[PageContentViewController alloc] init];
    NSInteger index = pcvc.index;
    index --;
    return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex: (NSInteger)index
{
    if (index == NSNotFound || index < 0 || index >= self.pageHeadings.count) {
        return nil;
    }
    PageContentViewController *pcvc = [[PageContentViewController alloc] init];
    pcvc.imageFile = self.pageImages[index];
    pcvc.heading = self.pageHeadings[index];
    pcvc.subHeading = self.pageSubHeadings[index];
    pcvc.index = index;
    
    return pcvc;
}
@end
