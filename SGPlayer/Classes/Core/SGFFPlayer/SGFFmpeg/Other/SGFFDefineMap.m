//
//  SGFFDefineMap.m
//  SGPlayer
//
//  Created by Single on 2018/1/26.
//  Copyright © 2018年 single. All rights reserved.
//

#import "SGFFDefineMap.h"

SGGLProgramType SGFFDMProgram(enum AVPixelFormat format)
{
    if (format == AV_PIX_FMT_YUV420P) {
        return SGGLProgramTypeYUV420P;
    } else if (format == AV_PIX_FMT_NV12) {
        return SGGLProgramTypeNV12;
    }
    return SGGLProgramTypeUnknown;
}

SGGLTextureType SGFFDMTexture(enum AVPixelFormat format)
{
    if (format == AV_PIX_FMT_YUV420P) {
        return SGGLTextureTypeYUV420P;
    } else if (format == AV_PIX_FMT_NV12) {
        return SGGLTextureTypeNV12;
    }
    return SGGLTextureTypeUnknown;
}
