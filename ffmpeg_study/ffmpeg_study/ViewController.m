//
//  ViewController.m
//  ffmpeg_study
//
//  Created by 黄盼青 on 16/1/23.
//  Copyright © 2016年 temobi. All rights reserved.
//

#import "ViewController.h"
#import "PQAVFormat.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 读取视频Metadata
    [PQAVFormat openMedaFileAndGetInfoWithURL:[NSURL URLWithString:@"http://video.app.ddpai.com/+86-18009348330/video/2yEk7DC1451974103622_20160105140655_9.mp4"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
