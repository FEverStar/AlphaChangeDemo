//
//  ViewController.m
//  AlphaChangeDemo
//
//  Created by LYX on 2016/10/19.
//  Copyright © 2016年 LYX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) UIImageView *myImgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //为了方便查看透明度效果，给背景一个颜色
    self.view.backgroundColor = [UIColor redColor];
    
    _myImgView = [[UIImageView alloc]init];
    _myImgView.frame = CGRectMake(100, 100, 200, 200);
    _myImgView.image = [UIImage imageNamed:@"timg.jpg"];
    
    
    [self.view addSubview:_myImgView];
    
    [self changeAlpha];
    
}

-(void)changeAlpha{
    
    CAGradientLayer *_gradLayer = [CAGradientLayer layer];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:0.5] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:1] CGColor],
                       nil];
    [_gradLayer setColors:colors];
    //渐变起止点，point表示向量
    [_gradLayer setStartPoint:CGPointMake(1.0f, 0.0f)];
    [_gradLayer setEndPoint:CGPointMake(0.0f, 0.0f)];
    
    [_gradLayer setFrame:_myImgView.bounds];
    
    [_myImgView.layer setMask:_gradLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
