//
//  CalloutMapAnnotation.h
//  BaiduMapTest
//
//  Created by wzg on 13-8-19.
//  Copyright (c) 2013年 Fengboyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalloutMapAnnotation : NSObject<BMKAnnotation>

@property (nonatomic) CLLocationDegrees latitude;
@property (nonatomic) CLLocationDegrees longitude;

- (id)initWithLatitude:(CLLocationDegrees)latitude
		  andLongitude:(CLLocationDegrees)longitude;


@end
