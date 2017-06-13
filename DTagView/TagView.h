//
//  TagView.h
//  123
//
//  Created by guodongdong on 16/7/5.
//  Copyright © 2016年 guodongdong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TagView;
@class TagCell;

@protocol TagViewDelegate <NSObject>

@optional
-(void)clickItem:(long)item;

@end

@interface TagView : UIView

@property (nonatomic, strong)UICollectionView *collectionView;

@property (nonatomic, strong)  NSMutableArray *hotArray;//热门搜索的数据源

@property (nonatomic, weak) id <TagViewDelegate> delegate;

@end
