//
//  BasicMapAnnotation.h
//  BaiduMapTest
//
//  Created by wzg on 13-8-21.
//  Copyright (c) 2013年 Fengboyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicMapAnnotation : NSObject<BMKAnnotation>
@property (nonatomic) CLLocationDegrees latitude;
@property (nonatomic) CLLocationDegrees longitude;

- (id)initWithLatitude:(CLLocationDegrees)latitude
		  andLongitude:(CLLocationDegrees)longitude;
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;
@end
