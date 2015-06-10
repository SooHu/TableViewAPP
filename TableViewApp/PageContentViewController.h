//
//  PageContentViewController.h
//  TableViewApp
//
//  Created by HuS on 15/6/10.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property NSInteger index;
@property (strong, nonatomic)NSString *heading;
@property (strong, nonatomic)NSString *subHeading;
@property (strong, nonatomic)NSString *imageFile;
@property (weak, nonatomic) IBOutlet UILabel *headLabel;
@property (weak, nonatomic) IBOutlet UILabel *subHeadLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@end
