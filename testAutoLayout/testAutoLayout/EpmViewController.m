//
//  EpmViewController.m
//  testAutoLayout
//
//  Created by Shen Tianyi on 14-1-21.
//  Copyright (c) 2014年 Cao Zhuo Information&Technology Co.,Ltd. All rights reserved.
//

#import "EpmViewController.h"

@interface EpmViewController ()

@end

@implementation EpmViewController
@synthesize upperContainer = _upperContainer;
@synthesize upperFirst = _upperFirst;
@synthesize upperSecond = _upperSecond;
@synthesize hideView = _hideView;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
       //[self setPreferredContentSize:CGSizeMake(200, 200)];

    
   	// Do any additional setup after loading the view, typically from a nib.
 
    
    
}

-(void)viewDidAppear:(BOOL)animated {
     [self changeLayoutWithOrientation:(UIDeviceOrientation)[UIApplication sharedApplication].statusBarOrientation];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [self.view.window addGestureRecognizer:tap];


}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    //change it to your condition
    if ([touch.view isKindOfClass:[UIButton class]]) {
        return NO;
    }
    return YES;
}

- (void)handleTap:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        CGPoint location = [sender locationInView:nil]; //Passing nil gives us coordinates in the window
    
        //Then we convert the tap's location into the local view's coordinate system, and test to see if it's in or outside. If outside, dismiss the view.
        
        if (![self.presentedViewController.view pointInside:[self.presentedViewController.view convertPoint:location fromView:self.view.window] withEvent:nil])
        {
            [self dismissViewControllerAnimated:YES completion:nil];
           // [self.view.window removeGestureRecognizer:sender];
        }
        
    }
    }



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeLayoutWithOrientation:(UIDeviceOrientation)orientation{
    CGRect firstFrame;
    CGRect secondFrame;
    if(UIDeviceOrientationIsLandscape(orientation)){
        
       firstFrame = CGRectMake(self.upperContainer.frame.origin.x, self.upperContainer.frame.origin.y, self.upperContainer.frame.size.width/2, self.upperContainer.frame.size.height);
       secondFrame =CGRectMake(self.upperContainer.frame.size.width/2 , self.upperContainer.frame.origin.y, self.upperContainer.frame.size.width/2, self.upperContainer.frame.size.height);
        
      
    }
    
    
    else {
    
        firstFrame = CGRectMake(self.upperContainer.frame.origin.x, self.upperContainer.frame.origin.y, self.upperContainer.frame.size.width, self.upperContainer.frame.size.height/2);
        
        secondFrame =CGRectMake(self.upperContainer.frame.origin.x , self.upperContainer.frame.size.height/2, self.upperContainer.frame.size.width, self.upperContainer.frame.size.height/2);
        
        
    }
       [self.upperFirst setFrame:firstFrame];
       [self.upperSecond setFrame:secondFrame];
    

}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self changeLayoutWithOrientation:[[UIDevice currentDevice]orientation]];

     
}

- (IBAction)bt:(UIButton *)sender {
    self.hideView.layer.opacity=1;
    self.hideView.layer.frame = CGRectMake(0,0,0,0 );
    [UIView animateWithDuration:1.0 animations:^{
        self.hideView.layer.frame = CGRectMake(0, 0, self.upperContainer.layer.frame.size.width,self.upperContainer.layer.frame.size.height);
        self.hideView.layer.opacity = 0;
        
    }];
    
  
    
    //[UIView animateWithDuration:2.0 animations:^{
    //    self.hideView.frame = CGRectMake(0, 0, self.upperContainer.frame.size.width,0);
    //}];
    
}
@end
