//
//  SNAKE_LocationManager.m
//  snake-zhibo
//
//  Created by Snake on 17/7/4.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_LocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface SNAKE_LocationManager ()<CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager * locManager;   //定位对象

@property (nonatomic,copy) LocationBlock block;

@end

@implementation SNAKE_LocationManager

+(instancetype)sharedManager
{
    static SNAKE_LocationManager * _manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        _manager = [[SNAKE_LocationManager alloc] init];   //只执行一次
    
    });
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _locManager = [[CLLocationManager alloc] init];
        [_locManager setDesiredAccuracy:kCLLocationAccuracyBest];
        _locManager.distanceFilter = 100;
        _locManager.delegate = self;

        if (![CLLocationManager locationServicesEnabled])  //服务没开启
        {
            NSLog(@"开启服务");
        }
        else
        {
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            if (status == kCLAuthorizationStatusNotDetermined)
            {
                [_locManager requestWhenInUseAuthorization];
            }
        }
    }
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D coor = newLocation.coordinate;
    
    NSString * lat = [NSString stringWithFormat:@"%@",@(coor.latitude)];
    NSString * lon = [NSString stringWithFormat:@"%@",@(coor.longitude)];
    
    [SNAKE_LocationManager sharedManager].lat = lat;
    [SNAKE_LocationManager sharedManager].lon = lon;
    
    self.block(lat,lon);
    
    [self.locManager stopUpdatingLocation];
    
    //NSLog(@"哈哈恍恍惚惚恍恍惚惚恍恍惚惚恍恍惚惚恍恍惚惚恍恍惚惚恍恍惚惚");
    //NSLog(@"%@",@(coor.latitude));
    //NSLog(@"%@",@(coor.longitude));

}

-(void)getGps:(LocationBlock)block
{
    self.block = block;
    [self.locManager startUpdatingLocation];   //会调用didiupdatetolocation代理
}

@end
