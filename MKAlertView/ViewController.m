//
//  ViewController.m
//  MKAlertView
//
//  Created by Manju Kiran on 20/02/2015.
//  Copyright (c) 2015 ManjuKiran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int toastIndex;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

-(IBAction)simpleAlertView{
    
    [MKAlertView showSimpleAlertWithMessage:@"Hello" withButtonTitle:@"OK" onCancel:^{

        [MKAlertView showSimpleToastWithMessage:@"You pressed OK"
                                        inView:self.view
                                     atPosition:ToastPosition_Centre];
    }];
    
}

-(IBAction)simpleAlertView2Buttons{
    
    void (^confirmCompletionBlock)() =  ^{
        [MKAlertView showSimpleToastWithMessage:@"Success 1"
                                         inView:self.view
                                     atPosition:ToastPosition_Centre];
    };

    
    [MKAlertView showAlertWithTitle:@"Hello"
                                msg:@"There are 2 buttons here"
                  cancelButtonTitle:@"No Way !!"
                  otherbuttonTitles:@[@"Yes Indeed"]
                           onCancel:^{
        [MKAlertView showSimpleToastWithMessage:@"No, I mean it. There were two buttons. Try Again"
                                         inView:self.view
                                     atPosition:ToastPosition_Centre];

    } arrayOfBlocksForButtons:@[confirmCompletionBlock]];
     
}

-(IBAction)simpleAlertViewWithTextField{
    
    void (^confirmCompletionBlock)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:
                    [NSString stringWithFormat:@"You Entered\n%@",[[alertView textFieldAtIndex:0] text]]
                                         inView:self.view
                                     atPosition:ToastPosition_Centre];
    };
    

    
    [MKAlertView showTextFieldAlertWithTitle:@"Hello"
                                         msg:@"Enter Text Here"
                             placeholderText:@"The text goes in here"
                           cancelButtonTitle:@"Cancel"
                           otherbuttonTitles:@[@"OK"]
                                    onCancel:^{
        [MKAlertView showSimpleToastWithMessage:@"Chickened out didn't ya 😏"
                                         inView:self.view
                                     atPosition:ToastPosition_Centre];
                                    }
     
                     arrayOfBlocksForButtons:@[confirmCompletionBlock]];
}


-(IBAction)simpleAlertViewWithUserNameAndPassword{
    
    void (^confirmCompletionBlock)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        
        NSString *userName = [[alertView textFieldAtIndex:0] text];
        NSString *password = [[alertView textFieldAtIndex:1] text];
        [MKAlertView showSimpleToastWithMessage:[NSString stringWithFormat:@"You Entered\n%@\n%@",userName,password]
                                         inView:self.view
                                     atPosition:ToastPosition_Centre];
    };
    
    [MKAlertView showUserNamePasswordAlertWithTitle:@"Hello"
                                                msg:@"We use this to Take User Credentials" cancelButtonTitle:@"Cancel"
                                  otherbuttonTitles:@[@"Login?"]
                                           onCancel:^{
                                               
                                      [MKAlertView showSimpleToastWithMessage:
                                       @"You should learn to trust iOS devs. They Rock"
                                                                       inView:self.view
                                                                   atPosition:ToastPosition_Centre];
                                      
                                  } arrayOfBlocksForButtons:@[confirmCompletionBlock]] ;
    
}

-(IBAction)alertViewWithMoreThan2Buttons{
    
    void (^confirmCompletionBlockAtIndex0)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 1" inView:self.view atPosition:ToastPosition_Centre];
    };
    void (^confirmCompletionBlockAtIndex1)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 2" inView:self.view atPosition:ToastPosition_Centre];
    };
    
    void (^confirmCompletionBlockAtIndex2)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 3" inView:self.view atPosition:ToastPosition_Centre];
    };
    
    void (^confirmCompletionBlockAtIndex3)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 4" inView:self.view atPosition:ToastPosition_Centre];
    };
    
    
    [MKAlertView showAlertWithTitle:@"Test"
                                msg:@"OH Hello"
                  cancelButtonTitle:@"Cancel"
                  otherbuttonTitles:@[@"Test 1",@"Test 2",@"Test 3",@"Test 4"]
                           onCancel:^{
                      //
                  } arrayOfBlocksForButtons:@[confirmCompletionBlockAtIndex0,confirmCompletionBlockAtIndex1,confirmCompletionBlockAtIndex2,confirmCompletionBlockAtIndex3]
     ];
}

-(IBAction)alertViewWithMoreThan2ButtonsWithTextField{
    
    void (^confirmCompletionBlock)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:
                    [NSString stringWithFormat:@"You Entered\n%@",[[alertView textFieldAtIndex:0] text]]
                                         inView:self.view
                                     atPosition:ToastPosition_Centre];
    };
    
    void (^confirmCompletionBlockAtIndex0)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 1" inView:self.view atPosition:ToastPosition_Centre];
    };
    void (^confirmCompletionBlockAtIndex1)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 2" inView:self.view atPosition:ToastPosition_Centre];
    };
    
    void (^confirmCompletionBlockAtIndex2)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 3" inView:self.view atPosition:ToastPosition_Centre];
    };
    
    void (^confirmCompletionBlockAtIndex3)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 4" inView:self.view atPosition:ToastPosition_Centre];
    };
    

    
    
    [MKAlertView showTextFieldAlertWithTitle:@"Hello"
                                         msg:@"Enter Text Here"
                             placeholderText:@"The text goes in here"
                           cancelButtonTitle:@"Cancel"
                           otherbuttonTitles:@[@"OK",@"Test 1",@"Test 2",@"Test 3",@"Test 4"]
                                    onCancel:^{
                                        [MKAlertView showSimpleToastWithMessage:@"Chickened out didn't ya 😏"
                                                                         inView:self.view
                                                                     atPosition:ToastPosition_Centre];
                                    }
     
                     arrayOfBlocksForButtons:@[confirmCompletionBlock,
                                               confirmCompletionBlockAtIndex0,
                                               confirmCompletionBlockAtIndex1,
                                               confirmCompletionBlockAtIndex2,
                                               confirmCompletionBlockAtIndex3]];
}



-(IBAction)alertViewWithMoreThan2ButtonsWithUserNameAndPassword{
    
    void (^confirmCompletionBlock)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        
        NSString *userName = [[alertView textFieldAtIndex:0] text];
        NSString *password = [[alertView textFieldAtIndex:1] text];
        [MKAlertView showSimpleToastWithMessage:[NSString stringWithFormat:@"You Entered\n%@\n%@",userName,password]
                                         inView:self.view
                                     atPosition:ToastPosition_Centre];
    };
    
    void (^confirmCompletionBlockAtIndex0)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 1" inView:self.view atPosition:ToastPosition_Centre];
    };
    void (^confirmCompletionBlockAtIndex1)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 2" inView:self.view atPosition:ToastPosition_Centre];
    };
    
    void (^confirmCompletionBlockAtIndex2)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 3" inView:self.view atPosition:ToastPosition_Centre];
    };
    
    void (^confirmCompletionBlockAtIndex3)(UIAlertView * alertView) =  ^(UIAlertView * alertView){
        [MKAlertView showSimpleToastWithMessage:@"Success 4" inView:self.view atPosition:ToastPosition_Centre];
    };
    
    
    [MKAlertView showUserNamePasswordAlertWithTitle:@"Hello"
                                                msg:@"We use this to Take User Credentials" cancelButtonTitle:@"Cancel"
                                  otherbuttonTitles:@[@"Login?",@"Test 1",@"Test 2",@"Test 3",@"Test 4"]
                                           onCancel:^{
                                               
                                               [MKAlertView showSimpleToastWithMessage:
                                                @"You should learn to trust iOS devs. They Rock"
                                                                                inView:self.view
                                                                            atPosition:ToastPosition_Centre];
                                               
                                           } arrayOfBlocksForButtons:@[confirmCompletionBlock,
                                                                       confirmCompletionBlockAtIndex0,
                                                                       confirmCompletionBlockAtIndex1,
                                                                       confirmCompletionBlockAtIndex2,
                                                                       confirmCompletionBlockAtIndex3]] ;

}

-(IBAction)simpleAndroidAlert{
    
    if(toastIndex>2){
        toastIndex=0;
    }
    
    ToastPosition position;
    switch (toastIndex) {
        case 0:
            position = ToastPosition_Centre;
            break;
        case 1:
            position = ToastPosition_Top;
            break;
        case 2:
            position = ToastPosition_Bottom;
            break;
        default:
            position = ToastPosition_Centre;
            break;
    }
    
    [MKAlertView showSimpleToastWithMessage:
     @"This is a toast"
                                     inView:self.view
                                 atPosition:position];
    
    toastIndex = toastIndex+1;
}

-(IBAction)complexAndroidAlert{

    [MKAlertView showSimpleToastWithMessage:@"You Did It" inView:self.view duration:1.0 atPosition:ToastPosition_Centre title:@"This is how I feel now" image:[UIImage imageNamed:@"coolDoggie.jpg"]];
}


-(IBAction)visitGithub{
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/manjukiran/"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
