//
//  UIViewController+KJExtension.h
//  KJEmitterView
//
//  Created by 77。 on 2021/5/28.
//  https://github.com/YangKJ/KJCategories

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (KJExtension) <UINavigationControllerDelegate>

/// Jump back to the specified controller
/// @param clazz specifies the controller class name
/// @param complete successfully callback out the controller
/// @return returns whether the jump was successful
- (BOOL)kj_popTargetViewController:(Class)clazz complete:(void(^)(UIViewController * vc))complete;

/// Switch the root view controller
- (void)kj_changeRootViewController:(void(^)(BOOL success))complete;


/// Whether to turn on the sliding back gesture
- (void)kj_openPopGesture:(BOOL)open;

/// The system comes with sharing
/// @param items share data
/// @param complete Sharing completion callback processing
/// @return Return to share controller
- (UIActivityViewController *)kj_shareActivityWithItems:(NSArray *)items
                                               complete:(nullable void(^)(BOOL success))complete;

@end

NS_ASSUME_NONNULL_END
