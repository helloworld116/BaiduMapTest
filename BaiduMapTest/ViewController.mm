//
//  ViewController.m
//  BaiduMapTest
//
//  Created by wzg on 13-8-15.
//  Copyright (c) 2013年 Fengboyun. All rights reserved.
//

#import "ViewController.h"
#import "CalloutMapAnnotation.h"
#import "BasicMapAnnotation.h"
#import "CallOutAnnotationView.h"
#import "Cell.h"

//#define span 40000

@interface ViewController ()

@property (nonatomic,retain) CalloutMapAnnotation *callOutAnnotation;

@end

@implementation ViewController
//for (int i = 0; i < result.poiInfoList.count; i++) {
//    BMKPoiInfo* poi = [result.poiInfoList objectAtIndex:i];
//    BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
//    item.coordinate = poi.pt;
//    item.title = poi.name;
//    [_mapView addAnnotation:item];
//    [item release];
//}
//113.959671,22.543672
//113.958871,22.542872
//113.957971,22.548972
//113.954671,22.543672
//113.955671,22.542672

- (NSArray *)testData{
    NSDictionary *dict1 =@{@"longitude": @"113.959671",@"latitude":@"22.543672"};
    NSDictionary *dict2 =@{@"longitude": @"113.958871",@"latitude":@"22.542872"};
    NSDictionary *dict3 =@{@"longitude": @"113.957971",@"latitude":@"22.548972"};
    NSDictionary *dict4 =@{@"longitude": @"113.954671",@"latitude":@"22.543672"};
    NSDictionary *dict5 =@{@"longitude": @"113.955671",@"latitude":@"22.542672"};
    NSArray *arr = @[dict1,dict2,dict3,dict4,dict5];
    return arr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view = self.mapView;
}

- (void) viewDidAppear:(BOOL)animated {
    NSArray *points = [self testData];
    
//    // 添加一个PointAnnotation
//    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
//    CLLocationCoordinate2D coor;
//    coor.latitude = 22.542672;
//    coor.longitude = 113.955671;
//    annotation.coordinate = coor;
//    annotation.title = @"这里是北京";
//    [self.mapView addAnnotation:annotation];
    
//    //给view中心定位
    BMKCoordinateRegion region;
    region.center.latitude  = [[[points objectAtIndex:0] objectForKey:@"latitude"] doubleValue];
    region.center.longitude = [[[points objectAtIndex:0] objectForKey:@"longitude"] doubleValue];
    region.span.latitudeDelta  = 0.01;
    region.span.longitudeDelta = 0.01;
    self.mapView.region = region;
//
//    for (NSDictionary *point in points) {
//        BMKPointAnnotation *annotation = [[BMKPointAnnotation alloc] init];
//        CLLocationCoordinate2D coor;
//        coor.latitude = [[point objectForKey:@"latitude"] doubleValue];
//        coor.longitude = [[point objectForKey:@"longitude"] doubleValue];
//        annotation.coordinate = coor;
////        annotation.title = @"这里是北京";
//        [self.mapView addAnnotation:annotation];
//    }
    
    for (NSDictionary *dic in points) {
        CLLocationDegrees latitude=[[dic objectForKey:@"latitude"] doubleValue];
        CLLocationDegrees longitude=[[dic objectForKey:@"longitude"] doubleValue];
//        CLLocationCoordinate2D location=CLLocationCoordinate2DMake(latitude, longitude);
//        BMKCoordinateRegion region=BMKCoordinateRegionMakeWithDistance(location,span ,span );
//        BMKCoordinateRegion adjustedRegion = [_mapView regionThatFits:region];
//        [_mapView setRegion:adjustedRegion animated:YES];
        
        BasicMapAnnotation *annotation=[[BasicMapAnnotation alloc] initWithLatitude:latitude andLongitude:longitude];
        [_mapView addAnnotation:annotation];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.mapView viewWillAppear];
    self.mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil; // 不用时，置nil
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
//- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view {
//	if ([view.annotation isKindOfClass:[BasicMapAnnotation class]]) {
//        if (_calloutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
//            _calloutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
//            return;
//        }
//        if (_calloutAnnotation) {
//            [mapView removeAnnotation:_calloutAnnotation];
//            _calloutAnnotation = nil;
//        }
//        _calloutAnnotation = [[[CalloutMapAnnotation alloc]
//                               initWithLatitude:view.annotation.coordinate.latitude
//                               andLongitude:view.annotation.coordinate.longitude] autorelease];
//        [mapView addAnnotation:_calloutAnnotation];
//        
//        [mapView setCenterCoordinate:_calloutAnnotation.coordinate animated:YES];
//	}
//    else{
//        if([delegate respondsToSelector:@selector(customMKMapViewDidSelectedWithInfo:)]){
//            [delegate customMKMapViewDidSelectedWithInfo:@"点击至之后你要在这干点啥"];
//        }
//    }
//}
//
//- (void)mapView:(BMKMapView *)mapView didDeselectAnnotationView:(BMKAnnotationView *)view {
//    if (_calloutAnnotation&& ![view isKindOfClass:[CallOutAnnotationVifew class]]) {
//        if (_calloutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
//            _calloutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
//            [mapView removeAnnotation:_calloutAnnotation];
//            _calloutAnnotation = nil;
//        }
//    }
//}
//
//- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation {
//	if ([annotation isKindOfClass:[CalloutMapAnnotation class]]) {
//        
//        CallOutAnnotationVifew *annotationView = (CallOutAnnotationVifew *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CalloutView"];
//        if (!annotationView) {
//            annotationView = [[[CallOutAnnotationVifew alloc] initWithAnnotation:annotation reuseIdentifier:@"CalloutView"] autorelease];
//            JingDianMapCell  *cell = [[[NSBundle mainBundle] loadNibNamed:@"JingDianMapCell" owner:self options:nil] objectAtIndex:0];
//            [annotationView.contentView addSubview:cell];
//            
//        }
//        return annotationView;
//	} else if ([annotation isKindOfClass:[BasicMapAnnotation class]]) {
//
//        MKAnnotationView *annotationView =[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
//        if (!annotationView) {
//            annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation
//                                                           reuseIdentifier:@"CustomAnnotation"] autorelease];
//            annotationView.canShowCallout = NO;
//            annotationView.image = [UIImage imageNamed:@"pin.png"];
//        }
//		
//		return annotationView;
//    }
//	return nil;
//}


- (void)mapView:(BMKMapView *) mapView didSelectAnnotationView:(BMKAnnotationView *)view {
	if ([view.annotation isKindOfClass:[BMKPointAnnotation class]]) {
        if (self.callOutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
            self.callOutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
            return;
        }
        if (self.callOutAnnotation) {
            [mapView removeAnnotation:self.callOutAnnotation];
            self.callOutAnnotation = nil;
        }
        self.callOutAnnotation = [[CalloutMapAnnotation alloc]
                               initWithLatitude:view.annotation.coordinate.latitude
                               andLongitude:view.annotation.coordinate.longitude];
        [mapView addAnnotation:self.callOutAnnotation];
        [mapView setCenterCoordinate:self.callOutAnnotation.coordinate animated:YES];
	}
}

- (void)mapView:(BMKMapView *)mapView didDeselectAnnotationView:(BMKAnnotationView *)view {
    if (self.callOutAnnotation && ![view isKindOfClass:[CallOutAnnotationView class]]) {
        if (self.callOutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
            self.callOutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
            [mapView removeAnnotation:self.callOutAnnotation];
            self.callOutAnnotation = nil;
        }
    }
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation {
	if ([annotation isKindOfClass:[CalloutMapAnnotation class]]) {
        CallOutAnnotationView *annotationView = (CallOutAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CalloutView"];
        if (!annotationView) {
            annotationView = [[CallOutAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CalloutView"];
            Cell *cell = [[[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil] objectAtIndex:0];
            [annotationView.contentView addSubview:cell];
            
        }
        return annotationView;
	}else if ([annotation isKindOfClass:[BasicMapAnnotation class]]) {
//        BMKAnnotationView *annotationView =[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
//        if (!annotationView) {
//            annotationView = [[BMKAnnotationView alloc] initWithAnnotation:annotation
//                                                           reuseIdentifier:@"CustomAnnotation"];
//            annotationView.canShowCallout = NO;
////            annotationView.image = [UIImage imageNamed:@"pin.png"];
//        }
        
        NSString *AnnotationViewID = @"renameMark";
        BMKAnnotationView *annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
        if (annotationView == nil) {
            // 设置颜色
            ((BMKPinAnnotationView*)annotationView).pinColor = BMKPinAnnotationColorRed;
            // 从天上掉下效果
            //		((BMKPinAnnotationView*)newAnnotation).animatesDrop = YES;
            // 设置可拖拽
            ((BMKPinAnnotationView*)annotationView).draggable = YES;
        }
		return annotationView;
    }

	return nil;
}
@end
