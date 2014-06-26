//
//  BSDatePickerPopoverController.h
//  UIDatePickerTextFieldUsage
//
//  Created by Bogdan Stasjuk on 6/10/14.
//  Copyright (c) 2014 Bogdan Stasjuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <BSNumPad/BSNumPadPopoverConotroller.h>


@protocol BSDatePickerPopoverControllerDelegate;


@interface BSDatePickerPopoverController : UIPopoverController

/*!
 * @brief BSDatePickerPopoverControllerDelegate property
 */
@property(weak, nonatomic) id<BSDatePickerPopoverControllerDelegate> datePickerDelegate;

@property(assign, nonatomic) BSPopoverPosition popoverPosition;

- (id)initWithTextField:(UITextField *)textField;

#pragma mark -Unavailable methods

+ (id)new __attribute__((unavailable));
- (id)init __attribute__((unavailable));
- (id)initWithContentViewController:(UIViewController *)viewController __attribute__((unavailable));

@end


@protocol BSDatePickerPopoverControllerDelegate <NSObject>

@optional
- (BOOL)isValidPopoverDate:(NSString *)date;
- (void)datePickerPopoverDidDisappear;

@end