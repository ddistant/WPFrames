//
//  WebViewController.m
//  WPFrames
//
//  Created by Daniel Distant on 4/20/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import "WebViewController.h"

#define kUrlString @"https://www.warbyparker.com/eyeglasses/men" //eventually will parse for all glasses

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setupWebView {
    
    NSURL *url = [[NSURL alloc] initWithString:kUrlString];
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [self.webView loadHTMLString:kUrlString baseURL:url];
    [self.view addSubview:self.webView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
