//
//  ViewController.m
//  JWAnimateImgView
//
//  Created by Vinhome on 16/4/18.
//  Copyright © 2016年 JW. All rights reserved.
//

#import "ViewController.h"
#import "JWAnimateImgView.h"
@interface ViewController ()
{
    JWAnimateImgView *img;
    BOOL  isstart;
}
@property(nonatomic,strong)NSTimer *timer;
@property(assign,nonatomic)NSInteger index;

@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataArr=[[NSMutableArray  alloc]initWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg", nil];
    
    
    
    UIView *bgView =[[UIView  alloc]initWithFrame:CGRectMake(self.view.center.x-150, self.view.center.y-150, 300, 300)];
    bgView.clipsToBounds=YES;
    [self.view addSubview:bgView];
    
    img =[[JWAnimateImgView  alloc]initWithFrame:bgView.bounds];
    
    img.interval=2;
    img.dataArr=self.dataArr;
    img.image=[UIImage  imageNamed:@"1.jpg"];
    [bgView addSubview:img];
    
    UIButton * btn =[UIButton  buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(self.view.center.x-25, self.view.center.y-25, 50, 50);
    btn.backgroundColor=[UIColor  blackColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)click
{
    
    if (!isstart) {
        [img start];
    }else{
        [img stop];
    }
    isstart=!isstart;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
