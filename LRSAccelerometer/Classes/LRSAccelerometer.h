//
//  LRSAccelerometer.h
//  LRSAccelerometer
//
//  Created by sama 刘 on 2021/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRSAccelerometer : NSObject
+ (instancetype)instance;
- (void)startAccelerometerWithHandler:(void(^)(LRSAccelerometer *handler))handler;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
