//
//  InfiniteScrollView.m
//  WPFrames
//
//  Created by Daniel Distant on 4/19/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import "InfiniteScrollView.h"

@implementation InfiniteScrollView

- (IBAction)moreButtonTapped:(UIButton *)sender {
    
    NSLog(@"more tapped");
    [self.infiniteDelegate moreButtonTapped];
}

- (IBAction)cameraButtonTapped:(UIButton *)sender {
    NSLog(@"camera button tapped");
    [self.infiniteDelegate cameraButtonTapped];
}

-(void)drawRect:(CGRect)rect {
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    
    [self.topView addGestureRecognizer:tapGestureRecognizer];
}

-(void) tapped {
    NSLog(@"tapped");
}



@end
