//
//  TestUIControllerViewController.m
//  testAutoLayout
//
//  Created by Shen Tianyi on 14-1-21.
//  Copyright (c) 2014年 Cao Zhuo Information&Technology Co.,Ltd. All rights reserved.
//

#import "TestUIControllerViewController.h"

@interface TestUIControllerViewController ()

@end

@implementation TestUIControllerViewController
@synthesize red = _red;
@synthesize gray = _gray;
@synthesize container = _container;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setPreferredContentSize:CGSizeMake(200, 200)];
}

-(void)viewDidAppear:(BOOL)animated {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
  //  [self.red addGestureRecognizer:tap];
    //[self.gray addGestureRecognizer:tap];
    [self.view.window addGestureRecognizer:tap];
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    //change it to your condition
    return YES;
}

- (void)handleTap:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint location = [sender locationInView:nil]; //Passing nil gives us coordinates in the window
        
        //Then we convert the tap's location into the local view's coordinate system, and test to see if it's in or outside. If outside, dismiss the view.
        
        
        if (CGRectContainsPoint([self.red frame], location))
        {
            [self.container bringSubviewToFront:self.red];

        }
        else if([self.gray pointInside:location withEvent:nil]){
            [self.container bringSubviewToFront:self.gray];
        }
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
