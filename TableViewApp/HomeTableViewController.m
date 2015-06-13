//
//  HomeTableViewController.m
//  TableViewApp
//
//  Created by HuS on 15/6/9.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "HomeTableViewController.h"
#import "HomeTableViewCell.h"
#import "DetailViewController.h"
#import "ItemStore.h"
#import "Item.h"
#import "PageViewController.h"
@interface HomeTableViewController ()
@property (nonatomic) UISearchController *searchController;
@end

@implementation HomeTableViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
//    
//    if (self) {
//        for (int i=0; i<5; i++) {
//            [[ItemStore sharedStore] createItem];
//        }
//    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加搜索栏到表格视图的头部视图
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    [self.searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    
    
    //隐藏返回按钮中的文字
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    //添加引导页
//    PageViewController *pvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
//    [self presentViewController:pvc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[ItemStore sharedStore] allItems] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *items = [[ItemStore sharedStore] allItems];
    Item *item = items[indexPath.row];
    
    
    NSString *cellIndentifier = @"HomeCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    
    cell.nameLabel.text = item.name;
    cell.typeLabel.text = item.type;
    cell.locationLabel.text = item.location;
    
    //图片圆角
    cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width / 2.0;
    cell.imageView.clipsToBounds = YES;
    cell.imageView.image = [UIImage imageNamed:item.imageName];
    //分割线长度bug
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    //去除点击时效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}



//添加unwind Segue
- (IBAction)unwindToHomeScreen:(UIStoryboardSegue *)segue
{
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender//segue初始化得到的参数sender
{
    if ([segue.identifier isEqual: @"toDetail"]) {
        DetailViewController *dvc = [[DetailViewController alloc] init];
        dvc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        NSArray *items = [[ItemStore sharedStore] allItems];
        Item *selectedItem = items[indexPath.row];
        dvc.item = selectedItem;
        
    }
    
    
}
@end
