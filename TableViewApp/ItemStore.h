//
//  ItemStore.h
//  TableViewApp
//
//  Created by HuS on 15/6/9.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Item;
@interface ItemStore : NSObject
+ (instancetype)sharedStore;
- (Item *)createItem;
- (NSArray *)allItems;
@end
