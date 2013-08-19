//
//  CalloutMapAnnotation.m
//  BaiduMapTest
//
//  Created by wzg on 13-8-19.
//  Copyright (c) 2013年 Fengboyun. All rights reserved.
//

#import "CalloutMapAnnotation.h"

@implementation CalloutMapAnnotation

- (id)initWithLatitude:(CLLocationDegrees)latitude
		  andLongitude:(CLLocationDegrees)longitude {
	if (self = [super init]) {
		self.latitude = latitude;
		self.longitude = longitude;
	}
	return self;
}

- (CLLocationCoordinate2D)coordinate {
	CLLocationCoordinate2D coordinate;
	coordinate.latitude = self.latitude;
	coordinate.longitude = self.longitude;
	return coordinate;
}

@end
