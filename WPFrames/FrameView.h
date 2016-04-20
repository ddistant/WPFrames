//
//  FrameView.h
//  WPFrames
//
//  Created by Daniel Distant on 4/19/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPFrame.h"

@interface FrameView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *favoriteIcon;

@end
