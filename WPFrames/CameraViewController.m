//
//  CameraViewController.m
//  WPFrames
//
//  Created by Daniel Distant on 4/16/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()
<
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
LTInfiniteScrollViewDataSource,
LTInfiniteScrollViewDelegate
>

@property (nonatomic) NSArray *frames;
@property (nonatomic) LTInfiniteScrollView *scrollView;

@end

@implementation CameraViewController

-(void)viewDidLoad {
    
    self.frames = [[WPFrames alloc] initWithFrames];
    self.delegate = self;
    self.scrollView.delegate = self;
    [self setupCamera];
    [self setupScrollView];
}

-(void)viewDidAppear:(BOOL)animated {
    
//    [self.scrollView reloadDataWithInitialIndex:0];
    
}

-(void) showAlertCameraUnavailable {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:@"Front-facing camera not available."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - imagePicker

-(void) setupCamera {
    
    if ([self isFrontCameraAvailable]) {
        
        self.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        self.showsCameraControls = NO;
        self.cameraOverlayView = self.scrollView;
    }
}

-(BOOL) isFrontCameraAvailable {
    
    if ([CameraViewController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
        return YES;
    } else {
        [self performSelector:@selector(showAlertCameraUnavailable) withObject:self afterDelay:1.0];
    }
    
    return NO;
}

#pragma mark - scrollView data source

-(void) setupScrollView {
    self.scrollView = [[LTInfiniteScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
}

-(NSInteger)numberOfViews {
    return self.frames.count;
}

-(NSInteger)numberOfVisibleViews {
    return 1;
}

#pragma mark - scrollView delegate

-(UIView *)viewAtIndex:(NSInteger)index reusingView:(UIView *)view {
    
//    if (view) {
//        <#statements#>
//    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 20, self.view.bounds.size.height - 20)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [[self.frames objectAtIndex:index] title];
    
    return label;
}

- (void) updateView:(UIView *)view withProgress:(CGFloat)progress scrollDirection:(ScrollDirection)direction {
    
    CGFloat scale = 1 - fabs(progress) * 0.15;
    view.transform = CGAffineTransformMakeScale(scale, scale);
}

@end
