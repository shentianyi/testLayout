//
//  EpmViewController.h
//  testAutoLayout
//
//  Created by Shen Tianyi on 14-1-21.
//  Copyright (c) 2014年 Cao Zhuo Information&Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EpmViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *upperContainer;
@property (weak, nonatomic) IBOutlet UIView *upperFirst;
@property (weak, nonatomic) IBOutlet UIView *upperSecond;
@property (weak, nonatomic) IBOutlet UIView *hideView;
- (IBAction)bt:(UIButton *)sender;

@end
