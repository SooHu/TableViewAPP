//
//  Item.m
//  TableViewApp
//
//  Created by HuS on 15/6/9.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "Item.h"

@implementation Item

//指定初始化方法
- (instancetype)initWithItamName:(NSString *)name type:(NSString *)type location:(NSString *)location imageName:(NSString *)imageName
{
    self = [super init];
    
    if (self) {
        _name = name;
        _type = type;
        _location = location;
        _imageName = imageName;
    }
    
    return self;
}
//初始化方法链
- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItamName:name type:@"" location:@"" imageName:@""];
}
- (instancetype)init
{
    return [self initWithItemName:@""];
}
@end
