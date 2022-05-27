//
//  RepairViewController.m
//  OpencvQueen
//
//  Created by Condy on 2021/3/20.
//  https://github.com/YangKJ/OpencvQueen


#import "RepairViewController.h"

@interface RepairViewController ()

@end

@implementation RepairViewController

#if __has_include(<opencv2/imgcodecs/ios.h>)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __block UIImage *oldImage = self.topImageView.image = [UIImage imageNamed:@"Repair.jpg"];
    __weak __typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *image = [oldImage kj_opencvRepairImage];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakself.bottomImageView.image = image;
        });
    });
    self.kButtonAction = ^{
        weakself.bottomImageView.image = [weakself.topImageView.image kj_opencvRepairImage];
    };
}

#endif

@end
