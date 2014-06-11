//
//  TestViewController.m
//  UIDatePickerTextFieldUsage
//
//  Created by Bogdan Stasjuk on 6/6/14.
//  Copyright (c) 2014 Bogdan Stasjuk. All rights reserved.
//

#import "TestViewController.h"

#import "BSDatePickerPopoverController.h"

#import <NSDate+Helpers/NSDate+Helpers.h>


@interface TestViewController () <BSDatePickerPopoverControllerDelegate>

@property(strong, nonatomic) BSDatePickerPopoverController  *popover;
@property(strong, nonatomic) UITextField                    *textField;

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
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width - textFieldWidth) / 2,
                                                                           (self.view.frame.size.height - textFieldHeight) / 2,
                                                                           textFieldWidth,
                                                                           textFieldHeight)];
    self.textField.backgroundColor = [UIColor lightGrayColor];
    self.textField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.textField];
   
    self.popover = [[BSDatePickerPopoverController alloc] initWithTextField:self.textField];
    self.popover.popoverPosition = BSPopoverPositionTop;
    self.popover.datePickerDelegate = self;
}


#pragma mark - BSDatePickerPopoverControllerDelegate

- (BOOL)isValidPopoverDate:(NSString *)date
{
    NSDate *dateToValidate = [NSDate getDateFromString:date withFormat:NSDateFormatDmy4Hm24 andTimeZone:NSDateTimeZoneUTC];
    
    BOOL result = [dateToValidate compare:[NSDate date]] == NSOrderedDescending;
    if (result) {
        self.textField.text = date;
    }
    return result;
}

@end