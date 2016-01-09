//
//  Singleton.h
//  表情键盘
//
//  Created by GK on 14-8-13.
//  Copyright (c) 2014年 GK. All rights reserved.
//
//@interface 里面写
#define singleton_interface(calssName) \
+(calssName *)shared##calssName;


//@implementation
#define singleton_implementation(calssName) \
static calssName *_instance; \
+ (id)allocWithZone:(NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken,^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
+(calssName *)shared##calssName \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken,^{ \
        _instance = [[self alloc]init]; \
    }); \
    return _instance; \
}