//
//  JWSlideImgView.h
//  JWAnimateImgView
//
//  Created by Vinhome on 16/4/18.
//  Copyright © 2016年 JW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWAnimateImgView : UIImageView
@property(nonatomic,strong)NSTimer *timer;
@property(assign,nonatomic)NSInteger index;

@property(assign,nonatomic)NSInteger interval;


@property(nonatomic,strong)NSMutableArray *dataArr;


@property(nonatomic) CGAffineTransform memoryTransform;

-(void)start;
-(void)stop;
@end
