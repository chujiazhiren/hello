//
//  STViewController.m
//  tomCat
//
//  Created by 史夏杰 on 16/9/29.
//  Copyright © 2016年 study. All rights reserved.
//

#import "STViewController.h"

#define kWH 70


@interface STViewController ()

@property (weak, nonatomic) IBOutlet UIView *mainShopView;

@property (nonatomic, assign) NSInteger index;

@end

@implementation STViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index = 0;
}

- (IBAction)addClick:(UIButton *)sender {
    
    /************************************ 设置坐标 ***********************************/
    //  每行个数
    static  NSInteger   number = 3;
    
    //  设置横向间距
    CGFloat  horizontal = (self.mainShopView.frame.size.width - number * kWH) / (number - 1);
    
    //  设置竖向间距
    CGFloat  vertical =  (self.mainShopView.frame.size.height - (number - 1) * kWH) / (number - 2);
    
   //  设置九宫格每个格子的x坐标
    CGFloat  x =  (_index % number) * ( horizontal + kWH);
   
    //  设置九宫格每个格子的y坐标
    CGFloat  y = (_index  / number) * ( vertical  + kWH);
    
    /************************************ 设置内部图像 ***********************************/
    UIImageView  *image = [[UIImageView  alloc] initWithFrame:CGRectMake(x, y, kWH, kWH)];
    
    image.backgroundColor = [UIColor  blueColor];
    
    [self.mainShopView  addSubview:image];
    
    /************************************ 设置 ***********************************/
    _index ++;
    
}

- (IBAction)deletaClick:(UIButton *)sender {
    
    self.mainShopView  
}


@end
