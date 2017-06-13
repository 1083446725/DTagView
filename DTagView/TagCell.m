//
//  TagCell.m
//  123
//
//  Created by guodongdong on 16/7/5.
//  Copyright © 2016年 guodongdong. All rights reserved.
//

#import "TagCell.h"

@implementation TagCell

-(UILabel *)titleLB
{
    if (_titleLB == nil)
    {
        _titleLB = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLB.backgroundColor = [UIColor clearColor];
    }
    return _titleLB;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleLB];
    }
    return self;
}

@end
