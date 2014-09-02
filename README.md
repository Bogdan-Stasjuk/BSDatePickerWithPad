BSDatePickerWithPad
===================

UIDatePicker with UITextField and BSNumPad for entering datetime


##BSDatePickerPopoverController public properties and methods

```objc
@property(weak, nonatomic) id<BSDatePickerPopoverControllerDelegate> datePickerDelegate;
@property(assign, nonatomic) BSPopoverPosition popoverPosition;

- (id)initWithTextField:(UITextField *)textField;
```

There are following Popover positions:

```objc
typedef NS_ENUM(NSUInteger, BSPopoverPosition) {
    BSPopoverPositionLeft,
    BSPopoverPositionTop,
    BSPopoverPositionRight,
    BSPopoverPositionBottom,
};
```

__BSDatePickerPopoverControllerDelegate__ protocol:

```objc
@optional
- (BOOL)isValidPopoverDate:(NSString *)date;
- (void)datePickerPopoverDidDisappear;
```

`isValidPopoverDate:` with result `TRUE` gives possibility to dismiss datePickerPopover view.


##Project uses next pods:

```objc
pod 'BSNumPad'
pod 'NSDate+Helpers'
```


##Initialization

```objc
    self.popover = [[BSDatePickerPopoverController alloc] initWithTextField:self.textField];
    self.popover.popoverPosition = BSPopoverPositionTop;
    self.popover.datePickerDelegate = self;
```

DatePickerPopover appears on `textFieldDidBeginEditing:` message.

##DatePickerPopover view: 
<img src="https://raw.githubusercontent.com/Bogdan-Stasjuk/BSDatePickerWithPad/master/DatePicker.png" />

<img src="https://raw.githubusercontent.com/Bogdan-Stasjuk/BSDatePickerWithPad/master/DatePickerWithNumPad.png" />


Demo
====

Clone project and run it. You can find examples of usage at `TestViewController`.


Compatibility
=============

This class has been tested back to iOS 6.0.


Installation
============

__Cocoapods__: `pod 'BSDatePickerWithPad'`<br />
__Manual__: Copy the __BSDatePickerWithPad__ folder in your project<br />

Import header 

    #import "BSDatePickerPopoverController.h"


License
=======

This code is released under the MIT License. See the LICENSE file for
details.
