//
//  DetailViewController.m
//  TableViewApp
//
//  Created by HuS on 15/6/9.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewCell.h"
#import "MapViewController.h"
@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置标题
    self.title = @"Detail";
    //设置图片
    self.imageView.image = [UIImage imageNamed:self.item.imageName];
    //改变表格视图背景色
    self.tableView.backgroundColor = [UIColor colorWithRed:240/255 green:240/255 blue:240/255 alpha:0.2];
    //改变表格分割线颜色
    self.tableView.separatorColor = [UIColor colorWithRed:240/255 green:240/255 blue:240/255 alpha:0.8];
    //隐藏多余分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIndentifier = @"detailCell";
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    
    cell.mapButton.hidden = YES;
    switch (indexPath.row) {
        case 0:
            cell.nameLabel.text = @"Name";
            cell.valueLabel.text = self.item.name;
            break;
        case 1:
            cell.nameLabel.text = @"Type";
            cell.valueLabel.text = self.item.type;
            break;
        case 2:
            cell.nameLabel.text = @"Location";
            cell.valueLabel.text = self.item.location;
            cell.mapButton.hidden = NO;
            break;
        default:
            break;
    }
    return cell;
}
//unwind segue
- (IBAction)close:(UIStoryboardSegue *)segue
{
}

- (void)prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender
{
    if ([segue.identifier isEqual:@"showMap"]) {
        MapViewController *mvc = segue.destinationViewController;
        mvc.item = self.item;
    }
}
@end
