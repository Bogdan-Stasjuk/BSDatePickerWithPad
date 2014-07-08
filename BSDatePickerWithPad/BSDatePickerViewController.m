//
//  BSDatePickerViewController.m
//  UIDatePickerTextFieldUsage
//
//  Created by Bogdan Stasjuk on 6/10/14.
//  Copyright (c) 2014 Bogdan Stasjuk. All rights reserved.
//

#import "BSDatePickerViewController.h"

#import <BSNumPad/BSNumPadPopoverConotroller.h>
#import <NSDate+Helpers/NSDate+Helpers.h>


@interface BSDatePickerViewController () <BSNumPadPopoverConotrollerDelegate>

@property(strong, nonatomic)    UIDatePicker                *datePicker;
@property(weak, nonatomic)      UITextField                 *mainTextField;
@property(strong, nonatomic)    UITextField                 *localTextField;
@property(assign, nonatomic)    id<UITextInput>             textInputDelegate;
@property(strong, nonatomic)    BSNumPadPopoverConotroller  *numPadPopover;

@end


@implementation BSDatePickerViewController

static UIView *inputViewCap;

#pragma mark - Public methods

- (id)initWithTextField:(UITextField *)textField
{
    self = [super init];
    if (self) {
        self.mainTextField = textField;
        self.mainTextField.inputView = [self inputViewCap];
        
        [self setupSubviews];
    }
    return self;
}

#pragma mark - Private methods

#pragma mark -UIViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning");
}

#pragma mark -BSNumPadPopoverConotrollerDelegate

- (BOOL)isValidTextFieldText:(NSString *)text onNextKeyPress:(BOOL)nextPressed
{
    NSDate *date = [NSDate dateFromString:text withFormat:NSDateFormatDmy4Hm24 andTimeZone:NSDateTimeZoneGMT];
    if (date) {
        self.datePicker.date = date;
        [self dateChanged:self.datePicker];
        return YES;
    }
    return NO;
}

#pragma mark -Actions

- (void)dateChanged:(UIDatePicker *)datePicker
{
    NSString *date = [NSDate stringFromDate:datePicker.date withFormat:NSDateFormatDmy4Hm24 andTimeZone:NSDateTimeZoneGMT];
    self.localTextField.text = date ? date : [NSDate stringFromDate:[NSDate date] withFormat:NSDateFormatDmy4Hm24 andTimeZone:NSDateTimeZoneGMT];
}

#pragma mark -Other

- (UIView *)inputViewCap
{
    if (inputViewCap == nil) {
        inputViewCap = [UIView new];
        inputViewCap.backgroundColor = [UIColor clearColor];
    }
    return inputViewCap;
}

- (void)setupSubviews
{
    [self setupDatePicker];
    [self setupLocalTextFieldWithOriginY:self.datePicker.frame.size.height andWidth:self.datePicker.frame.size.width];

    self.preferredContentSize = CGSizeMake(self.datePicker.frame.size.width, self.datePicker.frame.size.height + self.localTextField.frame.size.height);
    
    self.numPadPopover = [[BSNumPadPopoverConotroller alloc] initWithTextField:self.localTextField andTextFieldFormat:BSTextFieldFormatDate andNextKey:NO];
    self.numPadPopover.padPosition = BSPopoverPositionBottom;
    self.numPadPopover.padDelegate = self;
    
    [self dateChanged:self.datePicker];
}

- (void)setupDatePicker
{
    self.datePicker = [UIDatePicker new];
    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    self.datePicker.timeZone = [NSDate timeZone:NSDateTimeZoneGMT];
    self.datePicker.date = [NSDate date];
    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.datePicker];
    
    [self isValidTextFieldText:self.mainTextField.text onNextKeyPress:NO];
}

- (void)setupLocalTextFieldWithOriginY:(CGFloat)originY andWidth:(CGFloat)width
{
    CGFloat textFieldHeight = 30.f;
    self.localTextField = [[UITextField alloc] initWithFrame:CGRectMake(0.f, originY, width, textFieldHeight)];
    self.localTextField.backgroundColor = [UIColor lightGrayColor];
    self.localTextField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.localTextField];
}

@end