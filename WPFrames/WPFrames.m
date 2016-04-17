//
//  WPFrames.m
//  WPFrames
//
//  Created by Daniel Distant on 4/17/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import "WPFrames.h"

@implementation WPFrames

-(instancetype) initWithFrames {
    
    if (self) {
        self = [super init];
        
        //frames go here
        
        //1
        
        WPFrame *wiloughby = [[WPFrame alloc] initWithTitle:@"wiloughby"];
        wiloughby.color = @"Tennessee Whiskey";
        wiloughby.descriptionString = @"Wiloughby helps you stand out in any crowd with its oversized eye wires and temples.";
        wiloughby.size = @"Medium";
        wiloughby.measurements = @"52-18-138";
        wiloughby.image = [UIImage imageNamed:@"wiloughby"];
        
        //2
        
        WPFrame *talbot = [[WPFrame alloc] initWithTitle:@"talbot"];
        talbot.color = @"Striped Pacific";
        talbot.descriptionString = @"A medium-sized frame, Talbot offers the best of both worlds with its half-stainless steel, half-acetate construction.";
        talbot.size = @"Medium";
        talbot.measurements = @"49-19-145";
        talbot.image = [UIImage imageNamed:@"talbot"];
        
        //3
        
        WPFrame *arthur = [[WPFrame alloc] initWithTitle:@"arthur"];
        arthur.color = @"Green Spruce";
        arthur.descriptionString = @"Arthur's bold browline, keyhole bridge, and slim temple arms ensure that no encounter leaves you unnoticed.";
        arthur.size = @"Medium";
        arthur.measurements = @"52-18-138";
        arthur.image = [UIImage imageNamed:@"arthur"];
    }
    
    return  self;
}

@end
