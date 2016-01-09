//
//  LoadingView.h
//  LoadingAnimation
//
//  Created by IsLand on 16/1/8.
//  Copyright © 2016年 IsLand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"
@interface LoadingView : UIView

singleton_interface(LoadingView)

- (void)addLoading:(UIViewController *)currentContrler;

- (void)removeLoading;



@end
