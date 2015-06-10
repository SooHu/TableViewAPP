//
//  MapViewController.m
//  TableViewApp
//
//  Created by HuS on 15/6/10.
//  Copyright © 2015年 HuS. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "Item.h"
@interface MapViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;//添加委托
    
    //转换地址为坐标并在地图上添加标记
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder geocodeAddressString:self.item.location completionHandler:^(NSArray<CLPlacemark *> * __nullable placemarks, NSError * __nullable error) {
        if (error != nil) {
            NSLog(@"%@", error);
            return;
        }
        if (placemarks != nil && [placemarks count] > 0) {
            CLPlacemark *placemark = placemarks[0];
            
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.title = self.item.name;
            annotation.subtitle = self.item.type;
            annotation.coordinate = placemark.location.coordinate;
            
            [self.mapView showAnnotations:@[annotation] animated:YES];
            [self.mapView selectAnnotation:annotation animated:YES];
            
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//覆写协议函数，自定义地图标记
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    NSString *identifier = @"MyPin";
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    //如果存在可重用的annoationView，如果没有创建
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotationView == nil) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
    }
    //添加缩略图到标记左侧
    UIImageView *leftIconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 53, 53)];
    leftIconView.image = [UIImage imageNamed:self.item.imageName];
    annotationView.leftCalloutAccessoryView = leftIconView;
    
    return annotationView;
}

@end
