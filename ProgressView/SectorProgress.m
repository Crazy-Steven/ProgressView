//
//  SectorProgress.m
//  ProgressView
//
//  Created by Steven on 2017/2/3.
//  Copyright © 2017年 Steven. All rights reserved.
//

#import "SectorProgress.h"
@interface SectorProgress()
@property (weak, nonatomic) UILabel *progressLabel;

@end
@implementation SectorProgress
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
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //定义扇形中心
    CGPoint origin = CGPointMake(super.frame.size.width * 0.5, super.frame.size.height * 0.5);//super.center;
    NSLog(@"%@",NSStringFromCGPoint(super.center));
    //定义扇形半径
    CGFloat radius = super.frame.size.width * 0.5;
    NSLog(@"%f",radius);
    //设定扇形起点
    CGFloat startAngle = -M_PI_2;
    //根据进度计算扇形结束位置
    CGFloat endAngle = startAngle + self.progress * M_PI * 2;
    //根据起始点、原点、半径绘制弧线
    UIBezierPath * sectorPath = [UIBezierPath bezierPathWithArcCenter:origin radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    //从弧线结束为止绘制一条线段到圆心。这样系统会自动闭合图形，绘制一条从圆心到弧线起点的线段
    [sectorPath addLineToPoint:origin];
    //设置扇形的填充颜色
    [[UIColor darkGrayColor]set];
    //设置扇形的填充模式
    [sectorPath fill];
}

//重写progress的set方法
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    NSLog(@"%f",progress);
    _progressLabel.text = [NSString stringWithFormat:@"%.2f%%",progress * 100];
    //刷新页面
    [self setNeedsDisplay];
}


@end
