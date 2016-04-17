//
//  CameraViewController.m
//  WPFrames
//
//  Created by Daniel Distant on 4/16/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import "CameraViewController.h"

@implementation CameraViewController

-(void)awakeFromNib {
    
    [self createFrames];
}

-(void)viewDidLoad {
    
    self.delegate = self;
    [self setupCamera];
    
}

#pragma mark - camera methods

-(void) setupCamera {
    
    if ([self isFrontCameraAvailable]) {
        
        self.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        self.showsCameraControls = NO;
    }
}

-(BOOL) isFrontCameraAvailable {
    
    if ([CameraViewController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
        return YES;
    } else {
        [self showAlert:@"Error" withMessage:@"Front-facing camera not available."];
    }
    
    return NO;
}

-(void) showAlert:(NSString *)title withMessage:(NSString *)message {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) createFrames {
    
    WPFrame *wiloughby = [[WPFrame alloc] initWithTitle:@"wiloughby"];
    wiloughby.color = @"Tennessee Whiskey";
    wiloughby.descriptionString = @"Wiloughby helps you stand out in any crowd with its oversized eye wires and temples.";
    wiloughby.size = @"Medium";
    wiloughby.measurements = @"52-18-138";
    wiloughby.image = [UIImage imageNamed:@"wiloughby"];
    
    WPFrame *talbot = [[WPFrame alloc] initWithTitle:@"talbot"];
    talbot.color = @"Striped Pacific";
    talbot.descriptionString = @"A medium-sized frame, Talbot offers the best of both worlds with its half-stainless steel, half-acetate construction.";
    talbot.size = @"Medium";
    talbot.measurements = @"49-19-145";
    talbot.image = [UIImage imageNamed:@"talbot"];
    
    WPFrame *arthur = [[WPFrame alloc] initWithTitle:@"arthur"];
    arthur.color = @"Green Spruce";
    arthur.descriptionString = @"Arthur's bold browline, keyhole bridge, and slim temple arms ensure that no encounter leaves you unnoticed.";
    arthur.size = @"Medium";
    arthur.measurements = @"52-18-138";
    arthur.image = [UIImage imageNamed:@"arthur"];
    
    //add frame objects to array of frames
    
    self.frames = @[wiloughby, talbot, arthur];
}

@end
