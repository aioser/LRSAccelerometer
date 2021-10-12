//
//  LRSAccelerometer.m
//  LRSAccelerometer
//
//  Created by sama 刘 on 2021/10/12.
//

#import "LRSAccelerometer.h"
#import <CoreMotion/CMMotionManager.h>

@interface LRSAccelerometer()
@property (nonatomic, strong) CMMotionManager *manager;
@end

@implementation LRSAccelerometer

+ (instancetype)instance {
    static LRSAccelerometer *onceToken;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        onceToken = [[LRSAccelerometer alloc] init];
    });
    return onceToken;
}

- (void)startAccelerometerWithHandler:(void(^)(LRSAccelerometer *handler))handler {
    [self stop];
    self.manager = [[CMMotionManager alloc] init];
    __weak typeof(self) weakself = self;
    [self.manager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        double accele = sqrt(pow(accelerometerData.acceleration.x, 2) + pow(accelerometerData.acceleration.y, 2) + pow(accelerometerData.acceleration.z, 2));
        if (accele > 2 && handler) {
            handler(weakself);
        }
    }];
}

- (void)stop {
    [self.manager stopAccelerometerUpdates];
    self.manager = nil;
}
@end
