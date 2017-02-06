//
//  BallProgress.m
//  ProgressView
//
//  Created by Steven on 2017/2/6.
//  Copyright © 2017年 Steven. All rights reserved.
//

#import "BallProgress.h"
@interface BallProgress()
@property (weak, nonatomic) UILabel *progressLabel;
@property (assign, nonatomic)CGFloat startAngle;
@property (assign, nonatomic)CGFloat endAngle;

@end
@implementation BallProgress
- (void)layoutSubviews {
    [super layoutSubviews];
    _progressLabel.frame = CGRectMake(0, 0, super.frame.size.width, super.frame.size.height);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    UILabel *label = ({
        UILabel * la = [[UILabel alloc]initWithFrame:(CGRect){0,0,super.frame.size.width,super.frame.size.height}];
        la.textAlignment = NSTextAlignmentCenter;
        la.text = @"0.00%";
        _progressLabel = la;
        _progressLabel.textColor = [UIColor redColor];
        [self addSubview:la];
        la;
    });
    _startAngle = 0;
    _endAngle = 0;
}

- (void)drawRect:(CGRect)rect {
    CGPoint origin = CGPointMake(super.frame.size.width * 0.5, super.frame.size.height * 0.5);
    CGFloat radius = super.frame.size.width * 0.5;
    
    UIBezierPath * ballPath = [UIBezierPath bezierPathWithArcCenter:origin radius:radius startAngle:_startAngle endAngle:_endAngle clockwise:YES];
    [[UIColor purpleColor]set];
    [ballPath fill];
    
    //在球形的外面绘制一个描边空心的圆形，不然很难看
    UIBezierPath *strokePath = [UIBezierPath bezierPathWithArcCenter:origin radius:radius startAngle:0 endAngle:-0.000001 clockwise:YES];
    [[UIColor lightGrayColor]set];
    [strokePath stroke];
}

//重写progress的set方法
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    //设置起始点，位置是根据进度动态变换的
    _startAngle = M_PI_2 - progress * M_PI;
    _endAngle = M_PI_2 + progress * M_PI;
    
    _progressLabel.text = [NSString stringWithFormat:@"%.2f%%",progress * 100];
    //刷新页面
    [self setNeedsDisplay];
}


@end
