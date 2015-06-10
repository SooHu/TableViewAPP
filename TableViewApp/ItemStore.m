
//
//  ItemStore.m
//  TableViewApp
//
//  Created by HuS on 15/6/9.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "ItemStore.h"
#import "Item.h"
@interface ItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end
@implementation ItemStore

+ (instancetype)sharedStore
{
    static ItemStore *sharedStore = nil;
    //判断是否创建一个sharedStore对象
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}
//如果调用[[ItemStore alloc] init],提示使用[ItemStore sharedStore]
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"singleton" reason:@"Use +[ItemStore sharedStore]" userInfo:nil];
    return nil;
}
//真正的初始化方法
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems
{
    Item *item = [[Item alloc] init];
    item.name = @"wafflewolf";
    item.type = @"Chinese";
    item.location = @"HangZhou";
    item.imageName = @"wafflewolf.jpg";
    
    Item *item2 = [[Item alloc] init];
    item2.name = @"traif";
    item2.type = @"Chinese";
    item2.location = @"HangZhou";
    item2.imageName = @"traif.jpg";
    
    [self.privateItems addObject:item];
    [self.privateItems addObject:item2];
    
    return [self.privateItems copy];
}

- (Item *)createItem
{
    Item *item = [[Item alloc] init];
    
    [self.privateItems addObject:item];
    return item;
}
@end
