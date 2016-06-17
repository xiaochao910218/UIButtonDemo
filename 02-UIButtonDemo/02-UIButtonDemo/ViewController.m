//
//  ViewController.m
//  02-UIButtonDemo
//
//  Created by qingyun on 16/4/25.
//  Copyright © 2016年 ˚˚˚˚˚kkkkQingYun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *headerBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个btn对象
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //添加btn
    [self.view addSubview:btn];
    //设置frame
    btn.frame = CGRectMake(100, 100, 100, 100);
    
    //设置图片
    [btn setImage:[UIImage imageNamed:@"dog2"] forState:UIControlStateNormal];
    //添加事件监听（touchUpInside）
     SEL action = @selector(btnClick:);
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
   //[self btnClick:<#(UIButton *)#>]
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)btnClick:(UIButton *)btn {
    NSLog(@"%s",__func__);
}
//移动
- (IBAction)move:(UIButton *)sender {
    //取出中心点
    CGPoint center = _headerBtn.center;
    CGFloat detal = 30.0;
    switch (sender.tag) {
        case 101://向上移动
            center.y -= detal;
            break;
        case 102://向左移动
            center.x -= detal;
            break;
        case 103://向下移动
            center.y += detal;
            break;
        case 104://向右移动
            center.x += detal;
            break;
            
        default:
            break;
    }
    //头尾式动画
    [UIView beginAnimations:nil context:nil];
    //设置动画时间
    [UIView setAnimationDuration:0.2];
    _headerBtn.center = center;
    [UIView commitAnimations];
}

//缩放
- (IBAction)scale:(UIButton *)sender {
#if 0
    //取出frame
    CGRect rect = _headerBtn.frame;
    CGFloat detal = 10.0;
    //更改frame
    if (sender.tag == 105) {//放大
        rect.size.width += detal;
        rect.size.height += detal;
    }else if (sender.tag == 106){//缩小
        rect.size.width -= detal;
        rect.size.height -= detal;
    }
    [UIView animateWithDuration:0.5 animations:^{
        //把更改后的frame赋值给_headerBtn
        _headerBtn.frame = rect;
    }];
#else
    [UIView animateWithDuration:0.5 animations:^{
        if (sender.tag == 105) {//放大
            _headerBtn.transform = CGAffineTransformScale(_headerBtn.transform, 1.2, 1.2);
        }else if (sender.tag == 106){//缩小
            _headerBtn.transform = CGAffineTransformScale(_headerBtn.transform, 0.8, 0.8);
        }
    }];
#endif
}

//旋转
- (IBAction)rotate:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        if (sender.tag == 107) {//左旋转（逆时针）
            _headerBtn.transform = CGAffineTransformRotate(_headerBtn.transform, -M_PI_4);
        }else if (sender.tag == 108){//右旋转（顺时针）
            _headerBtn.transform = CGAffineTransformRotate(_headerBtn.transform, M_PI_4);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
