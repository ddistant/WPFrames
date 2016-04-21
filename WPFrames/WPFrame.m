//
//  WPFrame.m
//  WPFrames
//
//  Created by Daniel Distant on 4/16/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import "WPFrame.h"

@implementation WPFrame

-(WPFrame *) initWithTitle:(NSString *)title {
    self = [super init];
    
    if (self) {
        self.frameTitle = title;
    }
    
    return self;
}

@end
