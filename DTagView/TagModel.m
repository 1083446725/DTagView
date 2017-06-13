//
//  TagModel.m
//  123
//
//  Created by guodongdong on 16/7/5.
//  Copyright © 2016年 guodongdong. All rights reserved.
//

#import "TagModel.h"
#import "TagCell.h"

@implementation TagModel

-(void)setupTagCell:(TagCell *)cell title:(NSString *)title
{
    if (cell == nil) return;
    cell.titleLB.frame = CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height);
    cell.titleLB.font = [UIFont systemFontOfSize:16];
    cell.titleLB.textAlignment = NSTextAlignmentCenter;
    cell.titleLB.textColor = [UIColor lightGrayColor];
    cell.titleLB.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.titleLB.layer.borderWidth = 1.0f;
    cell.titleLB.layer.masksToBounds = YES;
    cell.titleLB.layer.cornerRadius = cell.bounds.size.height/(CGFloat)2;
    cell.titleLB.text = title;
    cell.titleLB.userInteractionEnabled = YES;
}

@end
