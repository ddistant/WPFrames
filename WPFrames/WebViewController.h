//
//  WebViewController.h
//  WPFrames
//
//  Created by Daniel Distant on 4/20/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>



@interface WebViewController : UIViewController

@property (nonatomic) WKWebView *webView;
@property (nonatomic) NSString *frameTitle;
@property (nonatomic) NSString *frameColor;

@end
