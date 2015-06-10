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
@interface HomeTableViewController ()

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
    
    //隐藏返回按钮中的文字
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
