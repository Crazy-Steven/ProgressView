//
//  ViewController.m
//  ProgressView
//
//  Created by Steven on 2017/2/3.
//  Copyright © 2017年 Steven. All rights reserved.
//

#import "ViewController.h"
#import "SectorProgress.h"
#import "BallProgress.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UIProgressView *myProgressView;
@property (weak, nonatomic) IBOutlet SectorProgress *mySectorProgress;
@property (weak, nonatomic) IBOutlet BallProgress *myBallProgress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)progressChanged:(UISlider *)sender {
    //进度条
    _myProgressView.progress = (_mySlider.value - _mySlider.minimumValue) / (_mySlider.maximumValue - _mySlider.minimumValue);
    //扇形
    _mySectorProgress.progress = _myProgressView.progress;
    //球形
    _myBallProgress.progress = _myProgressView.progress;

}

@end
