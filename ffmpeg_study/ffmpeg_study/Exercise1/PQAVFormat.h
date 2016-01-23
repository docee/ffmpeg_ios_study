//
//  PQAVFormat.h
//  ffmpeg_study
//
//  Created by 黄盼青 on 16/1/23.
//  Copyright © 2016年 temobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PQAVFormat : NSObject

/**
 *  @brief 获取媒体文件头信息
 *
 *  @param url 文件地址
 */
+(void)openMedaFileAndGetInfoWithURL:(NSURL *)url;

@end
