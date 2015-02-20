//
//  MKAlertView.m
//  MKAlertView
//
//  Created by Manju Kiran on 20/02/2015.
//  Copyright (c) 2015 ManjuKiran. All rights reserved.
//


#import "MKAlertView.h"
#import "UIView+Toast.h"


@interface MKAlertView()

@property (nonatomic, copy) void (^cancelCompletionBlock)();
//@property (nonatomic, copy) void (^confirmCompletionBlock)();
@property (nonatomic, copy) NSArray *confirmBlocksArray;
@end


static NSMutableArray *_CHMKblockHandlersArray = nil;



@implementation MKAlertView

/**
 This is an utility extension to show AlertViews with built in handlers for buttons (hence no need for your classes to have delegate method implementations)
 Simply Call
 
 [MKAlertView showAlertWithTitle:@"Title" msg:@"Message" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"OK" onCancel:^{
 // Provide Implementation for Cancel Here
 } onConfirm:^{
 // Provide Implementation for OK Here
 }];
 */


+(MKAlertView*)newInstance{
    MKAlertView *newIns = [[MKAlertView alloc] init];
    [MKAlertView updateHandlerArrayWith:newIns];
    return newIns;
}

+(void) updateHandlerArrayWith:(MKAlertView*)newIns{
    if(!_CHMKblockHandlersArray){
        _CHMKblockHandlersArray = [NSMutableArray new];
    }
    [_CHMKblockHandlersArray addObject:newIns];
}


+(UIAlertView*)showAlertWithTitle:(NSString*)title msg:(NSString*)msg
                cancelButtonTitle:(NSString*)cancelTitle
         otherbuttonTitles:(NSArray*)buttonTitleArray
                         onCancel:(void (^)())onCancel
          arrayOfBlocksForButtons:(NSArray*)blocksArray{
    
    return [[MKAlertView newInstance] showAlertMainWithTitle:title
                                                         msg:msg
                                             placeholderText:nil
                                        needsUserCredentials:NO
                                           cancelButtonTitle:cancelTitle
                                    multipleButtonTitleArray:buttonTitleArray
                                                    onCancel:onCancel
                                     arrayOfBlocksForButtons:blocksArray];
    
}


+(UIAlertView*)showTextFieldAlertWithTitle:(NSString*)title
                                       msg:(NSString*)msg
                           placeholderText:(NSString*)placeholderText
                         cancelButtonTitle:(NSString*)cancelTitle
                         otherbuttonTitles:(NSArray*)buttonTitlesArray
                                  onCancel:(void (^)())onCancel
                   arrayOfBlocksForButtons:(NSArray*)blocksArray{

    return [[MKAlertView newInstance] showAlertMainWithTitle:title
                                                  msg:msg
                                      placeholderText:placeholderText
                                 needsUserCredentials:NO
                                    cancelButtonTitle:cancelTitle
                             multipleButtonTitleArray:buttonTitlesArray
                                             onCancel:onCancel
                              arrayOfBlocksForButtons:blocksArray];
}

+(UIAlertView*)showUserNamePasswordAlertWithTitle:(NSString*)title
                                              msg:(NSString*)msg
                                cancelButtonTitle:(NSString*)cancelTitle
                                otherbuttonTitles:(NSArray*)buttonTitlesArray
                                         onCancel:(void (^)())onCancel
                          arrayOfBlocksForButtons:(NSArray*)blocksArray{
    
   return [[MKAlertView newInstance] showAlertMainWithTitle:title
                                                  msg:msg
                                      placeholderText:nil
                                 needsUserCredentials:YES
                                    cancelButtonTitle:cancelTitle
                             multipleButtonTitleArray:buttonTitlesArray
                                             onCancel:onCancel
                              arrayOfBlocksForButtons:blocksArray];
}


+(UIAlertView*)showSimpleAlertWithMessage:(NSString*)msg
                          withButtonTitle:(NSString*)cancelButtonTitle
                                 onCancel:(void (^)())onCancel{
    
    return [[MKAlertView newInstance] showSimpleAlertWithMessage:msg
                                               cancelButtonTitle:cancelButtonTitle
                                                        onCancel:^() {
                                                            if(onCancel){
                                                                onCancel();
                                                            }
                                                        }];
    
}



-(UIAlertView*)showSimpleAlertWithMessage:(NSString*)msg
                        cancelButtonTitle:(NSString*)cancelButtonTitle
                                 onCancel:(void (^)())onCancel{
    
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if(appName.length<1){
        
        // At the moment Swift Based Project do not recognize "CFBundleDisplayName" as a key for info Dictionary
        
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleNameKey];
    }
    
    UIAlertView *newAlert = [[UIAlertView alloc]
                             initWithTitle:appName
                             message:msg
                             delegate:self
                             cancelButtonTitle:cancelButtonTitle
                             otherButtonTitles:nil];
    
    self.cancelCompletionBlock = onCancel;
    
    [newAlert show];
    
    
    return newAlert;
    
}


-(UIAlertView*)showAlertMainWithTitle:(NSString*)title msg:(NSString*)msg
                      placeholderText:(NSString*)placeholderText
                 needsUserCredentials:(BOOL)needsUserCredentials
                    cancelButtonTitle:(NSString*)cancelButtonTitle
             multipleButtonTitleArray:(NSArray*)multipleButtonTitleArray
                             onCancel:(void (^)())onCancel
              arrayOfBlocksForButtons:(NSArray*)arrayOfBlocksForButtons{
    
    
    UIAlertView *newAlert = [[UIAlertView alloc]
                             initWithTitle:title
                             message:msg
                             delegate:self
                             cancelButtonTitle:cancelButtonTitle
                             otherButtonTitles:nil];
    
    for (NSString *buttonTitle in multipleButtonTitleArray){
        [newAlert addButtonWithTitle:buttonTitle];
    }
    if(placeholderText && placeholderText.length){
        newAlert.alertViewStyle=UIAlertViewStylePlainTextInput;
        [[newAlert textFieldAtIndex:0]setPlaceholder:placeholderText];
    }
    
    else if (needsUserCredentials ==YES){
        newAlert.alertViewStyle=UIAlertViewStyleLoginAndPasswordInput;
    }
    
    self.cancelCompletionBlock = onCancel;
    self.confirmBlocksArray = [NSArray arrayWithArray:arrayOfBlocksForButtons];
    
    [newAlert show];
    
    return newAlert;
}



//
//-(UIAlertView*)showAlertMainWithTitle:(NSString*)title
//                                  msg:(NSString*)msg
//                      placeholderText:(NSString*)placeholderText
//                 needsUserCredentials:(BOOL)needsUserCredentials
//                    cancelButtonTitle:(NSString*)cancelButtonTitle
//                   confirmButtonTitle:(NSString*)confirmButtonTitle
//                             onCancel:(void (^)())onCancel
//                            onConfirm:(void (^)(UIAlertView*))onConfirm{
//    
//    UIAlertView *newAlert = [[UIAlertView alloc]
//                             initWithTitle:title
//                             message:msg
//                             delegate:self
//                             cancelButtonTitle:cancelButtonTitle
//                             otherButtonTitles:confirmButtonTitle, nil];
//    
//    if(placeholderText && placeholderText.length && needsUserCredentials ==NO){
//        newAlert.alertViewStyle=UIAlertViewStylePlainTextInput;
//        [[newAlert textFieldAtIndex:0]setPlaceholder:placeholderText];
//    }else if (needsUserCredentials ==YES){
//        newAlert.alertViewStyle=UIAlertViewStyleLoginAndPasswordInput;
//    }
//    
//    self.cancelCompletionBlock = onCancel;
//    self.confirmCompletionBlock = onConfirm;
//    
//    [newAlert show];
//    
//    return newAlert;
//}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    if(self.confirmBlocksArray.count>0){
        if(buttonIndex ==0){            //Cancel
            {
                if(_cancelCompletionBlock){
                    _cancelCompletionBlock();
                }
            }
            
        }else{
            if([self.confirmBlocksArray objectAtIndex:buttonIndex-1]){
                void (^confirmCompletionBlockAtIndex)() = [self.confirmBlocksArray objectAtIndex:buttonIndex-1];
                confirmCompletionBlockAtIndex(alertView);
            }
        }
    }
    else{
        switch (buttonIndex) {
            case 0://Cancel
            {
                if(_cancelCompletionBlock){
                    _cancelCompletionBlock();
                }
            }
                break;
           default:
                break;
        }
        
    }
    
    [_CHMKblockHandlersArray removeObject:self];
}


+(void) showSimpleToastWithMessage:(NSString *)msg inView:(UIView *)view atPosition:(ToastPosition)position{
    [view makeToast:msg duration:0.4 position:[MKAlertView getPositionStringForToastPosition:position]];
}

+ (void)showSimpleToastWithMessage:(NSString *)message
                            inView:(UIView*) view
                          duration:(NSTimeInterval)interval
                        atPosition:(ToastPosition)position
                             title:(NSString *)title
                             image:(UIImage *)image{
    
    if(interval && title && image){
        [view makeToast:message
               duration:interval
               position:[MKAlertView getPositionStringForToastPosition:position]
                  title:title
                  image:image];
    }else if (interval && title && !image){
        [view makeToast:message
               duration:interval
               position:[MKAlertView getPositionStringForToastPosition:position]
                  title:title];
    }
}



+(NSString*) getPositionStringForToastPosition:(ToastPosition)position{
    
    switch (position) {
        case 0:            return CSToastPositionCenter;
        case 1:            return CSToastPositionTop;
        case 2:            return CSToastPositionBottom;
        default:           return CSToastPositionCenter;
    }
    return CSToastPositionCenter;
}



@end
