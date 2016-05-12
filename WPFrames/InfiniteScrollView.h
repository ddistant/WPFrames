//
//  InfiniteScrollView.h
//  WPFrames
//
//  Created by Daniel Distant on 4/19/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import "LTInfiniteScrollView.h"

@protocol InfiniteScrollViewDelegate <NSObject>

@required

-(void) moreButtonTapped;

-(void) cameraButtonTapped;

@end

@interface InfiniteScrollView : LTInfiniteScrollView

@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;


@property (strong, nonatomic) id<InfiniteScrollViewDelegate> infiniteDelegate;

@end
