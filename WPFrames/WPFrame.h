//
//  WPFrame.h
//  WPFrames
//
//  Created by Daniel Distant on 4/16/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WPFrame : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *color;
@property (nonatomic) NSString *descriptionString;
@property (nonatomic) NSString *size;
@property (nonatomic) NSString *measurements;
@property (nonatomic) UIImage *image;
@property (nonatomic) BOOL isFavorited;

-(WPFrame *) initWithTitle:(NSString *)title;

@end
