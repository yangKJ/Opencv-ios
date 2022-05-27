//
//  MaxCutViewController.m
//  OpencvQueen
//
//  Created by Condy on 2021/3/20.
//  https://github.com/YangKJ/OpencvQueen


#import "MaxCutViewController.h"

@interface MaxCutViewController ()

@end

@implementation MaxCutViewController

#if __has_include(<opencv2/imgcodecs/ios.h>)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topImageView.image = [UIImage imageNamed:@"MaxCut"];
    self.topImageView.backgroundColor = UIColor.blackColor;
    __weak __typeof(self) weakself = self;
    self.kButtonAction = ^{
        weakself.bottomImageView.image = [weakself.topImageView.image kj_opencvCutMaxRegionImage];
    };
    weakself.bottomImageView.image = [weakself.topImageView.image kj_opencvCutMaxRegionImage];
}

#endif

@end
