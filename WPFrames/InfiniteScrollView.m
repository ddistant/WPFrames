//
//  InfiniteScrollView.m
//  WPFrames
//
//  Created by Daniel Distant on 4/19/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import "InfiniteScrollView.h"

@implementation InfiniteScrollView

- (IBAction)moreButtonPressed:(id)sender {
    
    NSLog(@"more button pressed");
    [self.infiniteDelegate moreButtonTapped];
}

- (IBAction)cameraButtonPressed:(id)sender {
    
    NSLog(@"camera button pressed");
    [self.infiniteDelegate cameraButtonTapped];
}

@end
