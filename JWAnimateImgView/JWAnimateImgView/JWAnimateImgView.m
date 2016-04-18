//
//  JWAnimateImgView.m
//  JWAnimateImgView
//
//  Created by Vinhome on 16/4/18.
//  Copyright © 2016年 JW. All rights reserved.
//

#import "JWAnimateImgView.h"

@implementation JWAnimateImgView

-(void)setIndex:(NSInteger)index
{
    _index=index;
}
-(void)setDataArr:(NSMutableArray *)dataArr
{
    _dataArr=dataArr;
}
-(void)setInterval:(NSInteger)interval
{
    _interval=interval;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    
        _interval=2.0f;
       _index = 0;
       _memoryTransform=CGAffineTransformIdentity;
    }
    return self;
}
- (void)slide {
    
    self.index++;
    if (self.index>=self.dataArr.count) {
        self.index=0;
    }
    self.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:2 animations:^{
        self.transform = CGAffineTransformMakeScale(1.5, 1.5);
        
    } completion:^(BOOL finished) {
        
        
    }];
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 2.f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:transition forKey:nil];
    self.image = [UIImage imageNamed:self.dataArr[self.index]];
    
    
}
-(void)start
{
    self.transform = self.memoryTransform;
    [UIView animateWithDuration:2 animations:^{
        self.transform = CGAffineTransformMakeScale(1.5, 1.5);
        
        
    } completion:^(BOOL finished) {
        
    }];
    
    self.image=[UIImage  imageNamed:self.dataArr[self.index]];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:_interval target:self selector:@selector(slide) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
}

-(void)stop
{
    
    [self.timer invalidate];
    self.timer=nil;
    self.memoryTransform=self.transform;
    
   
 }

@end
