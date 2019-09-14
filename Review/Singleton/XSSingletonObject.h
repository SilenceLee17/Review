//
//  XSSingletonObject.h
//  Review
//
//  Created by 李兴东 on 2019/9/14.
//  Copyright © 2019 xingshao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XSSingletonObject : NSObject

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
