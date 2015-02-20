//
//  MKAlertView.h
//  MKAlertView
//
//  Created by Manju Kiran on 20/02/2015.
//  Copyright (c) 2015 ManjuKiran. All rights reserved.
//
//  The original idea for this utility class goes to Sourabh Verma (https://github.com/sourabhverma)
//  and his answer on StackoverFlow (http://stackoverflow.com/a/21069149)
//
//  The class is further modified to support additional forms of alertview to include textfields (username/
//  password etc)

/****************************************************************************

 Permission is hereby granted, free of charge, to any person obtaining a
 copy of this software and associated documentation files (the
 "Software"), to deal in the Software without restriction, including
 without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to
 permit persons to whom the Software is furnished to do so, subject to
 the following conditions:
 
 The above copyright notice and this permission notice shall be included
 in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 ***************************************************************************/


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum ToastPosition{
    ToastPosition_Centre = 0,
    ToastPosition_Top = 1,
    ToastPosition_Bottom = 2,
}ToastPosition;

@interface MKAlertView : NSObject <UIAlertViewDelegate>

/**
 Shows a simple UIAlertView With 
    @params title                   : Title String for alertview
    @params message                 : Message String for alertview
    @params cancelButtonTitle       : Text for Cancel Button Title
    @params confirmButtonTitle      : Text for Confirm Button Title - PASS nil string for single button
    @params onCancel/onConfirm    : Blocks to callw when either of the buttons are tapped on
 **/

+(UIAlertView*)showSimpleAlertWithMessage:(NSString*)msg
                          withButtonTitle:(NSString*)cancelTitle
                                 onCancel:(void (^)())onCancel;

+(UIAlertView*)showAlertWithTitle:(NSString*)title msg:(NSString*)msg
                cancelButtonTitle:(NSString*)cancelTitle
         otherbuttonTitles:(NSArray*)buttonTitlesArray
                         onCancel:(void (^)())onCancel
          arrayOfBlocksForButtons:(NSArray*)blocksArray;


+(UIAlertView*)showTextFieldAlertWithTitle:(NSString*)title
                              msg:(NSString*)msg
                           placeholderText:(NSString*)placeholderText
                cancelButtonTitle:(NSString*)cancelTitle
                              otherbuttonTitles:(NSArray*)buttonTitlesArray
                                  onCancel:(void (^)())onCancel
                   arrayOfBlocksForButtons:(NSArray*)blocksArray;

+(UIAlertView*)showUserNamePasswordAlertWithTitle:(NSString*)title
                                       msg:(NSString*)msg
                         cancelButtonTitle:(NSString*)cancelTitle
                                otherbuttonTitles:(NSArray*)buttonTitlesArray
                                         onCancel:(void (^)())onCancel
                          arrayOfBlocksForButtons:(NSArray*)blocksArray;


+(void)showSimpleToastWithMessage:(NSString*)msg
                           inView:(UIView *)view
                       atPosition:(ToastPosition)position;

+ (void)showSimpleToastWithMessage:(NSString *)message inView:(UIView*) view
                          duration:(NSTimeInterval)interval
                        atPosition:(ToastPosition)position
                             title:(NSString *)title
                             image:(UIImage *)image;


@end
