//
//  ViewController.m
//  tomCat
//
//  Created by 史夏杰 on 16/8/27.
//  Copyright © 2016年 study. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
NSDictionary  *_dict;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //  获取tom.plist文件全路径
    NSBundle  *bundle = [NSBundle mainBundle];
    NSString  *path = [bundle  pathForResource:@"tom" ofType:@"plist"];
    
    //  根据全路径加载字典
    _dict = [NSDictionary  dictionaryWithContentsOfFile:path];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(UIButton *)sender {
    
    //  判断是否在播放
    if(_tom.isAnimating)  return;
    
    //  取出按钮名字
    NSString  *title = [sender  titleForState:UIControlStateNormal];
    
    //  获得图片数量
    int  count = [_dict[title]  intValue];
    
    //   播放动画
    [self  playAnimation:count  fileName:title];
}

- (void)playAnimation:(int)count  fileName:(NSString *)filename
{
    //   创建数组
    NSMutableArray   *image = [NSMutableArray  array];
    
            for (int i = 0; i < count ; i++) {
                //  每张图片名字显示为字符串
                NSString  *name = [NSString  stringWithFormat:@"%@_%02d.jpg",filename, i ];
                
                //  设置全路径
                NSString   *path =  [[NSBundle   mainBundle] pathForResource:name  ofType:nil];
                
                //  加载图片
                UIImage  *imageName = [[UIImage alloc]  initWithContentsOfFile:path];
        
                //   图片添加数组
                [image  addObject:imageName];
            }
    
    //  设置动画
    _tom.animationImages = image;
    
    //    动画播放时间
    _tom.animationRepeatCount = 1;
    
    //   动画持续时间
    _tom.animationDuration = 0.1 * count;
    
    //   开始动画
    [_tom  startAnimating];
    
}


@end
