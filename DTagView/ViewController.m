//
//  ViewController.m
//  123
//
//  Created by guodongdong on 16/7/5.
//  Copyright © 2016年 guodongdong. All rights reserved.
//

#import "ViewController.h"
#import "TagView.h"
@interface ViewController ()<TagViewDelegate>

@property(nonatomic,strong) TagView *tagView;
@property(nonatomic,strong) NSMutableArray *titleArr1;
@property(nonatomic,strong) NSMutableArray *titleArr2;

@end

@implementation ViewController

-(TagView *)tagView
{
    if (_tagView == nil) {
        _tagView =  [[TagView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
        _tagView.delegate = self;
        [self.view addSubview:_tagView];
    }
    return _tagView;
}

-(NSMutableArray *)titleArr1
{
    if (_titleArr1 == nil) {
        _titleArr1 = [NSMutableArray arrayWithArray:@[@"av",@"avaa",@"ava",@"avasfsa",@"avasfsa",@"143",@"1",@"143asd",@"12214asdsad3",@"122ava143",@"avaa",@"ava",@"avasfsa",@"avasfsa",@"143",@"1",@"143asd",@"12214asdsad3",@"122ava143",@"avaa",@"ava",@"avasfsa",@"avasfsa",@"143",@"1",@"143asd",@"12214asdsad3",@"122ava143",@"avaa",@"ava",@"avasfsa",@"avasfsa",@"143",@"1",@"143asd",@"12214asdsad3",@"122ava143",@"avaa",@"ava",@"avasfsa",@"avasfsa",@"143",@"1",@"143asd",@"12214asdsad3",@"122ava143",@"avaa",@"ava",@"avasfsa",@"avasfsa",@"143",@"1",@"143asd",@"12214asdsad3",@"122ava143",@"avaa",@"ava",@"avasfsa",@"avasfsa",@"143",@"1",@"143asd",@"12214asdsad3",@"122ava143",@"avaa",@"ava",@"avasfsa",@"avasfsa",@"143",@"1",@"143asd",@"12214asdsad3"]];
        
    }
    return _titleArr1;
}

-(NSMutableArray *)titleArr2
{
    if (_titleArr2 == nil) {
        _titleArr2 = [NSMutableArray arrayWithArray:@[@"12321",@"123214",@"124214",@"2144124",@"21421",@"143",@"1",@"21421",@"12414",@"14",@"14",@"14",@"14141",@"21421421",@"124214",@"123214",@"124214",@"2144124",@"21421",@"143",@"1",@"21421",@"12414",@"14",@"14",@"14",@"14141",@"21421421",@"124214",@"123214",@"124214",@"2144124",@"21421",@"143",@"1",@"21421",@"12414",@"14",@"14",@"14",@"14141",@"21421421",@"124214",@"123214",@"124214",@"2144124",@"21421",@"143",@"1",@"21421",@"12414",@"14",@"14",@"14",@"14141",@"21421421",@"124214",@"123214",@"124214",@"2144124",@"21421",@"143",@"1",@"21421",@"12414",@"14",@"14",@"14",@"14141",@"21421421",@"124214",@"123214",@"124214",@"2144124",@"21421",@"143",@"1",@"21421",@"12414",@"14",@"14",@"14",@"14141",@"21421421",@"124214",@"123214",@"124214",@"2144124",@"21421",@"143",@"1",@"21421",@"12414",@"14",@"14",@"14",@"14141",@"21421421",@"124214"]];
        
    }
    return _titleArr2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tagView.hotArray = self.titleArr1;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [btn addTarget:self action:@selector(changeTitle:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"改变标签数组" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
}

-(void)changeTitle:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        self.tagView.hotArray = self.titleArr2;
        [self.tagView.collectionView reloadData];
    }else{
        self.tagView.hotArray = self.titleArr1;
        [self.tagView.collectionView reloadData];
    }
}

-(void)clickItem:(long)item{
    
    NSLog(@"%ld",item);
}
@end
