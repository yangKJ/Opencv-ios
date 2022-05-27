//
//  InpaintViewController.m
//  OpencvQueen
//
//  Created by Condy on 2021/3/22.
//

#import "InpaintViewController.h"

@interface InpaintViewController ()

@end

@implementation InpaintViewController

#if __has_include(<opencv2/imgcodecs/ios.h>)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __block UIImage *_image = self.topImageView.image = [UIImage imageNamed:@"Inpaint.jpg"];
    self.topSlider.value = 0.25;
    __weak __typeof(self) weakself = self;
    self.kButtonAction = ^{
        weakself.bottomImageView.image = [weakself.topImageView.image kj_opencvInpaintImage:10];
    };
    self.kSliderMoveEnd = ^(CGFloat value) {
        CGFloat x = 20 * value;
        weakself.bottomImageView.image = [weakself.topImageView.image kj_opencvInpaintImage:x];
    };
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *image = [_image kj_opencvInpaintImage:5];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakself.bottomImageView.image = image;
        });
    });
}

#endif

@end
