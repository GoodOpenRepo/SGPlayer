//
//  SGPacket.m
//  SGPlayer
//
//  Created by Single on 2018/1/22.
//  Copyright © 2018年 single. All rights reserved.
//

#import "SGPacket.h"

@interface SGPacket ()

SGObjectPoolItemLockingInterface

@end

@implementation SGPacket

SGObjectPoolItemLockingImplementation

- (instancetype)init
{
    if (self = [super init])
    {
        _corePacket = av_packet_alloc();
        _position = kCMTimeZero;
        _duration = kCMTimeZero;
        _size = 0;
    }
    return self;
}

- (void)dealloc
{
    if (_corePacket)
    {
        av_packet_free(&_corePacket);
        _corePacket = nil;
    }
}

- (int)index
{
    return _corePacket->stream_index;
}

- (void)fillWithTimebase:(CMTime)timebase
{
    if (_corePacket)
    {
        if (_corePacket->pts != AV_NOPTS_VALUE) {
            _position = SGTimeMultiply(timebase, _corePacket->pts);
        } else {
            _position = SGTimeMultiply(timebase, _corePacket->dts);
        }
        _duration = SGTimeMultiply(timebase, _corePacket->duration);
        _size = _corePacket->size;
    }
}

- (void)clear
{
    _position = kCMTimeZero;
    _duration = kCMTimeZero;
    _size = 0;
    if (_corePacket)
    {
        av_packet_unref(_corePacket);
    }
}

@end
