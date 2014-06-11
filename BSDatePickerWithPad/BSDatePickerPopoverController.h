//
//  BSDatePickerPopoverController.h
//  UIDatePickerTextFieldUsage
//
//  Created by Bogdan Stasjuk on 6/10/14.
//  Copyright (c) 2014 Bogdan Stasjuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <BSNumPad/BSNumPadPopoverConotroller.h>


@interface BSDatePickerPopoverController : UIPopoverController

@property(nonatomic, assign) BSPopoverPosition popoverPosition;

- (id)initWithTextField:(UITextField *)textField;

#pragma mark -Unavailable methods

+ (id)new __attribute__((unavailable));
- (id)init __attribute__((unavailable));
- (id)initWithContentViewController:(UIViewController *)viewController __attribute__((unavailable));

@end