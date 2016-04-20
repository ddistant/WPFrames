//
//  InfiniteScrollView.h
//  WPFrames
//
//  Created by Daniel Distant on 4/19/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import "LTInfiniteScrollView.h"

@protocol InfiniteScrollViewDelegate <NSObject>

-(void) moreButtonTapped;

-(void) cameraButtonTapped;

@end

@interface InfiniteScrollView : LTInfiniteScrollView

@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;
@property (weak, nonatomic) id<InfiniteScrollViewDelegate> infiniteDelegate;

@end
