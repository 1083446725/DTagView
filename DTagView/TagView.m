//
//  TagView.m
//  123
//
//  Created by guodongdong on 16/7/5.
//  Copyright © 2016年 guodongdong. All rights reserved.
//

#import "TagView.h"
#import "TagCell.h"
#import "TagModel.h"
#import "CustomFlowLayout.h"

#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define MB_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define MB_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif

static CGFloat const margin = 10;
static NSString *const itemCollectionIdentifier =  @"itemCollection";

@interface TagView() <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) TagModel *tagModel;

@end

@implementation TagView

#pragma mark -- Lazy load

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        CustomFlowLayout *layout = [[CustomFlowLayout alloc]init];
        layout.minimumInteritemSpacing = margin;
        layout.maximumInteritemSpacing = margin;
        layout.minimumLineSpacing = margin;
        layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.delegate = self;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[TagCell class] forCellWithReuseIdentifier:itemCollectionIdentifier];
        
    }
    return _collectionView;
}

-(TagModel *)tagModel
{
    if (_tagModel == nil) {
        _tagModel = [[TagModel alloc] init];
    }
    return _tagModel;
}

-(NSMutableArray *)hotArray
{
    if (_hotArray == nil)
    {
        _hotArray = [NSMutableArray array];
    }
    return _hotArray;
}

#pragma mark -- method

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self addSubview:self.collectionView];
    }
    return self;
}

#pragma mark -- collection数据源代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.hotArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemCollectionIdentifier forIndexPath:indexPath];
    [self.tagModel setupTagCell:cell title:self.hotArray[indexPath.row]];
    return cell;
}

//根据文字大小计算不同item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = MB_TEXTSIZE(self.hotArray[indexPath.row], [UIFont systemFontOfSize:16]);
    return  CGSizeMake(size.width+30, 30);
}

//点击item的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(clickItem:)]) {
        [self.delegate clickItem:indexPath.row];
    }
}

@end
