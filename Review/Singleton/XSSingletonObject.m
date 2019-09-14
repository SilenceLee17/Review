//
//  XSSingletonObject.m
//  Review
//
//  Created by 李兴东 on 2019/9/14.
//  Copyright © 2019 xingshao. All rights reserved.
//

#import "XSSingletonObject.h"


@implementation XSSingletonObject

static id sharedInstance = nil;

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//重写+ allocWithZone:此方法在调用alloc时必会调用.use object initializers instead
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}
//对于单例,应该无论以何种方式创建都应该只有一份内存的, 对于ARC的创建的方法还有copy,mutableCopy,但必须遵守协议<NSCopying,NSMutableCopying> , 执行copy,MutableCopy的时候必定会执行copyWithZone,mutableCopyWithZone
- (instancetype)copyWithZone:(NSZone *)zone
{
    return sharedInstance;
}
- (instancetype)mutableCopyWithZone:(NSZone *)zone
{
    return sharedInstance;
}

//不考虑MRC
@end
