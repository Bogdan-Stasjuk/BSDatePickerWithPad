//
//  BSDatePickerPopoverController.m
//  UIDatePickerTextFieldUsage
//
//  Created by Bogdan Stasjuk on 6/10/14.
//  Copyright (c) 2014 Bogdan Stasjuk. All rights reserved.
//

#import "BSDatePickerPopoverController.h"

#import "BSDatePickerViewController.h"


@interface BSDatePickerPopoverController () <UITextFieldDelegate, UIPopoverControllerDelegate>

@property(strong, nonatomic) UITextField *textField;
@property(weak, nonatomic)   UITextField *localTextField;

@end

@implementation BSDatePickerPopoverController

#pragma mark - Public methods

- (id)initWithTextField:(UITextField *)textField
{
    BSDatePickerViewController *datePickerViewController = [[BSDatePickerViewController alloc] initWithTextField:textField];
    self = [super initWithContentViewController:datePickerViewController];
    if (self) {
        self.delegate = self;
        self.localTextField = datePickerViewController.localTextField;
        self.textField = textField;
        self.textField.delegate = self;
    }
    return self;
}


#pragma mark - Private methods

#pragma mark -UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSInteger padPosX = 0.f;
    NSInteger padPosY = 0.f;
    UIPopoverArrowDirection arrowDirection = UIPopoverArrowDirectionAny;
    switch (self.popoverPosition) {
        case BSPopoverPositionLeft:
            padPosY = self.textField.bounds.size.height / 2;
            arrowDirection = UIPopoverArrowDirectionRight;
            break;
        case BSPopoverPositionTop:
            padPosX = self.textField.bounds.size.width / 2;
            arrowDirection = UIPopoverArrowDirectionDown;
            break;
        case BSPopoverPositionRight:
            padPosX = self.textField.bounds.size.width;
            padPosY = self.textField.bounds.size.height / 2;
            arrowDirection = UIPopoverArrowDirectionLeft;
            break;
        case BSPopoverPositionBottom:
            padPosX = self.textField.bounds.size.width / 2;
            padPosY = self.textField.bounds.size.height;
            arrowDirection = UIPopoverArrowDirectionUp;
            break;
            
        default:
            break;
    }
    
    CGRect popoverFrame = CGRectMake(padPosX, padPosY, 1.f, 1.f);
    [self presentPopoverFromRect:popoverFrame inView:self.textField permittedArrowDirections:arrowDirection animated:YES];
}

#pragma mark -UIPopoverControllerDelegate

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
    if ([self.datePickerDelegate respondsToSelector:@selector(isValidPopoverDate:)]) {
        return [self.datePickerDelegate isValidPopoverDate:self.localTextField.text];
    }
    return YES;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    [self.textField resignFirstResponder];
}

@end