//
//  CameraViewController.m
//  WPFrames
//
//  Created by Daniel Distant on 4/16/16.
//  Copyright © 2016 ddistant. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@property (nonatomic) NSArray <WPFrame *>*frames;
@property (strong, nonatomic) InfiniteScrollView *scrollView;

@end

@implementation CameraViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    //data
    
    [self createFrames];
    
    //delegates
    
    self.delegate = self;

    //views 
    
    [self setupScrollView];
    [self setupCamera];
}

-(void) showAlertCameraUnavailable {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:@"Front-facing camera not available."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - imagePicker

-(void) setupCamera {
    
    if ([self isFrontCameraAvailable]) {
        
        self.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
        //resize camera
        
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        float cameraAspectRatio = 4.0 / 3.0;
        float imageHeight = floorf(screenSize.width * cameraAspectRatio);
        float scale = screenSize.height / imageHeight;
        float trans = (screenSize.height - imageHeight)/2;
        CGAffineTransform translate = CGAffineTransformMakeTranslation(0.0, trans);
        CGAffineTransform final = CGAffineTransformScale(translate, scale, scale);
        self.cameraViewTransform = final;
        
        self.showsCameraControls = NO;
        self.cameraOverlayView = self.scrollView;
    }
}

-(BOOL) isFrontCameraAvailable {
    
    if ([CameraViewController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
        return YES;
    } else {
        [self performSelector:@selector(showAlertCameraUnavailable) withObject:self afterDelay:1.0];
    }
    
    return NO;
}

#pragma mark - scrollView data source

-(void) setupScrollView {
    
    //weirdly enough, LTInfiniteScrollView doesn't seem to work without a nib
    
    self.scrollView = [[[NSBundle mainBundle] loadNibNamed:@"InfiniteScrollView" owner:nil options:nil] lastObject];
    
    self.scrollView.frame = self.view.frame;
    self.scrollView.verticalScroll = NO;
    self.scrollView.maxScrollDistance = 2.5;
    
    //delegates
    
    self.scrollView.delegate = self;
    self.scrollView.dataSource = self;
    self.scrollView.infiniteDelegate = self;
    
    //this method is necessary, according to documentation
    
    [self.scrollView reloadDataWithInitialIndex:0];
}

-(NSInteger)numberOfViews {
    return self.frames.count;
}

-(NSInteger)numberOfVisibleViews {
    return 1;
}

#pragma mark - scrollView delegate

-(UIView *)viewAtIndex:(NSInteger)index reusingView:(UIView *)view {
    
    if (view) {
        
        ((FrameView *)view).descriptionLabel.text = [[self.frames objectAtIndex:index] descriptionString];
        return view;
    }
    
    FrameView *frameView = [[[NSBundle mainBundle] loadNibNamed:@"FrameView" owner:nil options:nil] lastObject];
    
    frameView.favoriteIcon.hidden = YES;
    frameView.titleLabel.text = [[self.frames objectAtIndex:index] frameTitle];
    frameView.titleLabel.textColor = [UIColor whiteColor];
    frameView.imageView.image = [[self.frames objectAtIndex:index] photo];
    frameView.colorLabel.text = [[self.frames objectAtIndex:index] frameColor];
    frameView.colorLabel.textColor = [UIColor whiteColor];
    frameView.descriptionLabel.text = [[self.frames objectAtIndex:index] descriptionString];
    frameView.descriptionLabel.textColor = [UIColor whiteColor];
    
    return frameView;
}

- (void) updateView:(UIView *)view withProgress:(CGFloat)progress scrollDirection:(ScrollDirection)direction {
    
//    CGFloat scale = 1 - fabs(progress) * 0.15;
//    view.transform = CGAffineTransformMakeScale(scale, scale);
}

#pragma mark - infinite delegate

-(void)cameraButtonTapped {
    
    NSLog(@"camera button tapped");
    
    [self takePicture];
}

-(void)moreButtonTapped {
    
    NSLog(@"more button tapped");
    
    WebViewController *webVC = [[WebViewController alloc] init];
//    webVC.frameTitle = //needs to be implemented
//    webVC.frameColor = //needs to be implemented
    
    [self presentViewController:webVC animated:YES completion:nil];
    
}

//this will be refactored - creating data in the cameraVC isn't a great idea

#pragma mark - data

-(void) createFrames {
    
    //1
    
    WPFrame *wiloughby = [[WPFrame alloc] initWithTitle:@"wiloughby"];
    wiloughby.frameColor = @"Tennessee Whiskey";
    wiloughby.descriptionString = @"Wiloughby helps you stand out in any crowd with its oversized eye wires and temples.";
    wiloughby.size = @"Medium";
    wiloughby.measurements = @"52-18-138";
    wiloughby.photo = [UIImage imageNamed:@"wiloughby"]; //screwed up the name, its one 'l'
    
    //2
    
    WPFrame *talbot = [[WPFrame alloc] initWithTitle:@"talbot"];
    talbot.frameColor = @"Striped Pacific";
    talbot.descriptionString = @"A medium-sized frame, Talbot offers the best of both worlds with its half-stainless steel, half-acetate construction.";
    talbot.size = @"Medium";
    talbot.measurements = @"49-19-145";
    talbot.photo = [UIImage imageNamed:@"talbot"];
    
    //3
    
    WPFrame *arthur = [[WPFrame alloc] initWithTitle:@"arthur"];
    arthur.frameColor = @"Green Spruce";
    arthur.descriptionString = @"Arthur's bold browline, keyhole bridge, and slim temple arms ensure that no encounter leaves you unnoticed.";
    arthur.size = @"Medium";
    arthur.measurements = @"52-18-138";
    arthur.photo = [UIImage imageNamed:@"arthur"];
    
    //4
    
    WPFrame *testFrame = [[WPFrame alloc] initWithTitle:@"testFrame"];
    testFrame.frameColor = @"test color";
    testFrame.descriptionString = @"test frame test frame test frame test frame test frame.";
    testFrame.size = @"Medium";
    testFrame.measurements = @"53-22-121";
    testFrame.photo = [UIImage imageNamed:@"testFrame"];
    
    self.frames = @[talbot, arthur, testFrame, wiloughby];
}

@end
