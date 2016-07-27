//
//  ViewController.m
//  TestAutoLayout
//
//  Created by liujing on 7/26/16.
//  Copyright © 2016 liujing. All rights reserved.
//
//
//Interface Builder不仅允许我们创建视图对象的IBOutlet对象关联，还可以创建约束对象的对象关联，这样就能通过代码来访问并修改某个约束。
//1.创建约束对象的对象关联 修改约束常量值
//2.通过查找constraint然后更改约束

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//   self.titleLabel.text =@"哈哈 我变小了";
    if (IS_IPHONE4S) {
        self.imgWidth.constant=40;
        self.imgHeight.constant = 40;
    }
    if (IS_IPHONE5) {
        [self performSelector:@selector(modifyConstraint) withObject:nil afterDelay:0.1];//延迟加载,执行。因为虽然在viewDidLoad中修改的约束的代码块运行了,但是运行完之后 又被storyboard自己的配置给覆盖了,所以 你看到的还是你之前设置的约束!延迟加载后拿到的constraints数组才是正确的
    }
    if (IS_IPHONE6) {
        self.imgWidth.constant=150;
        self.imgHeight.constant = 150;
    }
    if (IS_IPHONE6Plus) {
        self.imgWidth.constant=380;
        self.imgHeight.constant = 380;

    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)modifyConstraint{
    NSArray* constrains = self.view.constraints;
    for (NSLayoutConstraint* constraint in constrains) {
                    if (constraint.firstAttribute == NSLayoutAttributeTop&&constraint.firstItem == self.bottomLabel) {
                        //修改的约束会立即生效，加上下面这句变化的过程就显得比较自然
                        [UIView animateWithDuration:3 animations:^
                         {
                             //constraint.constant = 80;
                             self.imgWidth.constant=80;
                             self.imgHeight.constant = 90;
                             [self.view removeConstraint:constraint];
                             [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.titleLabel  attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
                             
                             [self.view layoutIfNeeded];
                         }];
                    }
    }
}

-(void)addConstraintForAll{
    
    NSLayoutConstraint *titleTop = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:40];
    NSLayoutConstraint *titleLeft = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *titleRight = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    NSLayoutConstraint *labelCenterX = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *labelTop = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
     NSLayoutConstraint *imageCenterX = [NSLayoutConstraint constraintWithItem:self.imgView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
     NSLayoutConstraint *imageCenterY = [NSLayoutConstraint constraintWithItem:self.imgView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *imgWidth = [NSLayoutConstraint constraintWithItem:self.imgView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:240];
      NSLayoutConstraint *imgHeight = [NSLayoutConstraint constraintWithItem:self.imgView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:164];
    
    NSLayoutConstraint *bottomlabelTop = [NSLayoutConstraint constraintWithItem:self.bottomLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.imgView attribute:NSLayoutAttributeBottom multiplier:1 constant:5];
    NSLayoutConstraint *bottomlabelCenterX = [NSLayoutConstraint constraintWithItem:self.bottomLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self.imgView addConstraints:@[imgWidth,imgHeight]];
    [self.view addConstraints:@[titleTop,titleLeft,titleRight,labelCenterX,labelTop,imageCenterX,imageCenterY,bottomlabelTop,bottomlabelCenterX]];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
