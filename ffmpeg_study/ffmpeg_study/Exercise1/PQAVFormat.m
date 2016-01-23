//
//  PQAVFormat.m
//  ffmpeg_study
//
//  Created by 黄盼青 on 16/1/23.
//  Copyright © 2016年 temobi. All rights reserved.
//

#import "PQAVFormat.h"
#import <libavformat/avformat.h>

@implementation PQAVFormat

/**
 *  @brief 获取媒体文件头信息
 *
 *  @param url 文件地址
 */
+(void)openMedaFileAndGetInfoWithURL:(NSURL *)url {
    
    // 注册
    av_register_all();
    
    // 初始化网络连接
    avformat_network_init();
    
    AVFormatContext *pFormatContext = NULL;
    
    
    if(avformat_open_input(&pFormatContext, [url.absoluteString UTF8String], NULL, NULL) != 0){
        
        NSLog(@"无法打开媒体文件!");
        
    }else{
        
        av_dump_format(pFormatContext, 0, [url.absoluteString UTF8String], 0);
        
        NSLog(@"***************************");
        
        avformat_close_input(&pFormatContext);
        
        avformat_free_context(pFormatContext);
        
    }
    
    
}

@end
