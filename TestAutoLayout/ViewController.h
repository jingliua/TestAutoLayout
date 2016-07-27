//
//  ViewController.h
//  TestAutoLayout
//
//  Created by liujing on 7/26/16.
//  Copyright © 2016 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IOS_BOUNDS      [[UIScreen mainScreen]bounds]
#define IOS_VERSION     [[[UIDevice currentDevice]systemVersion] floatValue]
#define IS_IPHONE4S     (IOS_BOUNDS.size.height ==480)
#define IS_IPHONE5      (IOS_BOUNDS.size.height == 568)
#define IS_IPHONE6      (IOS_BOUNDS.size.height == 667)
#define IS_IPHONE6Plus      (IOS_BOUNDS.size.height == 736)
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgHeight;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

