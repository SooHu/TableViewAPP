//
//  PageViewController.m
//  TableViewApp
//
//  Created by HuS on 15/6/10.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "PageViewController.h"
#import "PageContentViewController.h"
@interface PageViewController () 

@end

@implementation PageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageHeadings = @[@"Personalize", @"Locate", @"Discover"];
    self.pageSubHeadings = @[@"Pin your favourite restaurants and create your own food guide", @"Search and locate your favourite restaurant on Maps", @"Find restaurants pinned by your friends and other foodies around the world"];
    self.pageImages = @[@"homei", @"mapintro", @"fiveleaves"];
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;//设置委托
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = ((PageContentViewController *)viewController).index;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index --;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = ((PageContentViewController *)viewController).index;
    if (index == NSNotFound) {
        return nil;
    }
    index ++;
    if (index == [self.pageHeadings count]) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex: (NSInteger)index
{
    if (([self.pageHeadings count] == 0) || (index >= [self.pageHeadings count])) {
        return nil;
    }
    
    PageContentViewController *pcvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pcvc.imageFile = self.pageImages[index];
    pcvc.heading = self.pageHeadings[index];
    pcvc.subHeading = self.pageSubHeadings[index];
    pcvc.index = index;
    
    return pcvc;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageHeadings count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
@end
