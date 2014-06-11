//
//  TestViewController.m
//  UIDatePickerTextFieldUsage
//
//  Created by Bogdan Stasjuk on 6/6/14.
//  Copyright (c) 2014 Bogdan Stasjuk. All rights reserved.
//

#import "TestViewController.h"

#import "BSDatePickerPopoverController.h"


@interface TestViewController ()

@property(strong, nonatomic) BSDatePickerPopoverController *popover;

@end


@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    CGFloat textFieldWidth = 200.f;
    CGFloat textFieldHeight = 30.f;
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width - textFieldWidth) / 2,
                                                                           (self.view.frame.size.height - textFieldHeight) / 2,
                                                                           textFieldWidth,
                                                                           textFieldHeight)];
    textField.backgroundColor = [UIColor lightGrayColor];
    textField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textField];
   
    self.popover = [[BSDatePickerPopoverController alloc] initWithTextField:textField];
    self.popover.popoverPosition = BSPopoverPositionTop;
}

@end