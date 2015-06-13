//
//  addTableViewController.m
//  TableViewApp
//
//  Created by HuS on 15/6/9.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "addTableViewController.h"

@interface addTableViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>//接受协议
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *typeField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@property (weak, nonatomic) IBOutlet UIButton *noButton;

@end

@implementation addTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//表格被选中时
- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    //设置类型，从相册选取照片还是拍摄照片
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    if (indexPath.row == 0) {
        if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {//检测设别是否支持相机
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;   // 设置委托
            imagePicker.allowsEditing = false;
            imagePicker.sourceType = sourceType;
            
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }

}
//完成选取照片收到的消息
- (void)imagePickerController:(nonnull UIImagePickerController *)picker didFinishPickingMediaWithInfo:(nonnull NSDictionary<NSString *,id> *)info
{
    //通过info字典获取选择的照片
    self.imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    
    //关闭UIImagePickerController对象
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)finishAddNewRestaurant:(id)sender
{
    NSLog(@"%@", self.nameField.text);
    [self performSegueWithIdentifier:@"unwindToHomeScreen" sender:self];
}


@end
