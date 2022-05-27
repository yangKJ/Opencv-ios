//
//  TiledViewController.m
//  OpencvQueen
//
//  Created by Condy on 2021/3/20.
//  https://github.com/YangKJ/OpencvQueen


#import "TiledViewController.h"

@interface TiledViewController ()

@end

@implementation TiledViewController

#if __has_include(<opencv2/imgcodecs/ios.h>)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topSlider.value = 0.5;
    self.bottomSlider.value = 0.5;
    UIImage *temp = self.topImageView.image;
    __weak __typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *image = [temp kj_opencvTiledRows:5 cols:5];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakself.bottomImageView.image = image;
        });
    });
    self.kButtonAction = ^{
        weakself.bottomImageView.image = [weakself.topImageView.image kj_opencvTiledRows:5 cols:5];
    };
    self.kSliderMoveEnd = ^(CGFloat value) {
        CGFloat x = 10 * value;
        CGFloat y = 10 * weakself.bottomSlider.value;
        weakself.bottomImageView.image = [weakself.topImageView.image kj_opencvTiledRows:x cols:y];
    };
    self.kSlider2MoveEnd = ^(CGFloat value) {
        CGFloat x = 10 * weakself.topSlider.value;
        CGFloat y = 10 * value;
        weakself.bottomImageView.image = [weakself.topImageView.image kj_opencvTiledRows:x cols:y];
    };
}

#endif

@end
