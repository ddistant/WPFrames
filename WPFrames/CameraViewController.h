//
//  CameraViewController.h
//  WPFrames
//
//  Created by Daniel Distant on 4/16/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPFrame.h"

@interface CameraViewController : UIImagePickerController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic) NSArray<WPFrame*> *frames;

@end
