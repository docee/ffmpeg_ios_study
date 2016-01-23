//
//  PQAVFormat.m
//  ffmpeg_study
//
//  Created by 黄盼青 on 16/1/23.
//  Copyright © 2016年 temobi. All rights reserved.
//

#import "PQAVFormat.h"
#import <libavformat/avformat.h>
#import <libavutil/log.h>

@implementation PQAVFormat

/**
 *  @brief 获取媒体文件头信息
 *
 *  @param url 文件地址
 */
+(int)openMedaFileAndGetInfoWithURL:(NSURL *)url {
    
    // 注册
    av_register_all();
    
    // 初始化网络连接
    avformat_network_init();
    
    AVFormatContext *pFormatContext = avformat_alloc_context();
    
    
    if(avformat_open_input(&pFormatContext, [url.absoluteString UTF8String], NULL, NULL) != 0){
        
        av_log(pFormatContext, AV_LOG_ERROR, "Error:无法打开媒体文件");
        return 0;
        
    }
    
    if (avformat_find_stream_info(pFormatContext, NULL) < 0) {
        av_log(pFormatContext, AV_LOG_ERROR, "Error:找不到流信息");
        return 0;
    }
    
    // 打印媒体文件信息
    av_dump_format(pFormatContext, 0, [url.absoluteString UTF8String], 0);
    
    av_log(pFormatContext, AV_LOG_INFO, "******************************************\n");
    
    // 获取总时长和文件名
    NSInteger duration = pFormatContext -> duration;
    
    av_log(pFormatContext, AV_LOG_INFO, "总时长:%ld秒\n",duration/1000/1000);
    av_log(pFormatContext, AV_LOG_INFO, "文件名%s\n",pFormatContext -> filename);
    
    av_log(pFormatContext, AV_LOG_INFO, "******************************************\n");
    
    avformat_close_input(&pFormatContext);
    
    avformat_free_context(pFormatContext);
    
    return 1;
    
}

@end
