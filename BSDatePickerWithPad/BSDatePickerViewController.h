//
//  BSDatePickerViewController.h
//  UIDatePickerTextFieldUsage
//
//  Created by Bogdan Stasjuk on 6/10/14.
//  Copyright (c) 2014 Bogdan Stasjuk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BSDatePickerViewController : UIViewController

@property(strong, readonly, nonatomic) UITextField *localTextField;

- (id)initWithTextField:(UITextField *)textField;

#pragma mark -UIViewController

- (instancetype)init __attribute__((unavailable));
- (instancetype)initWithCoder:(NSCoder *)aDecoder __attribute__((unavailable));
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil __attribute__((unavailable));

@end
