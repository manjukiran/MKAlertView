# MKAlertView
A common Utilty Class to use UIAlertViews with Blocks for callbacks instead of Delegate methods

This class also uses and builds on [Charles Scalesse's](https://github.com/scalessec)  UIView+Toast.h category available @ [Toast](https://github.com/scalessec/Toast)

Original Idea credit to [Sourabh Verma](https://github.com/sourabhverma)

## Usage
Import MKAlertView.h/.m and UIView+Toast.h/.m into your project

Use in the following format :
  
  Single Button:
  
       [MKAlertView showSimpleAlertWithMessage:@"Hello" 
                                withButtonTitle:@"OK" onCancel:^{
                        [MKAlertView showSimpleToastWithMessage:@"You pressed OK"
                                            inView:self.view
                                         atPosition:ToastPosition_Centre];
        }];

  2 Buttons:
  
    Declare Block for handling completion of UIAlertView interaction
      void (^confirmCompletionBlock)() =  ^{
            [MKAlertView showSimpleToastWithMessage:@"Success 1"
                                            inView:self.view
                                        atPosition:ToastPosition_Centre];
        };
      
      Then Create AlertView
      [MKAlertView showAlertWithTitle:@"Hello" // Title of AlertView
                                  msg:@"There are 2 buttons here" // Message to Show
                    cancelButtonTitle:@"No Way !!" // Title of Cancel Button
                    otherbuttonTitles:@[@"Yes Indeed"] // Array of Buttons
                             onCancel:^{
          [MKAlertView showSimpleToastWithMessage:@"No, I mean it. There were two buttons. Try Again"
                                           inView:self.view
                                       atPosition:ToastPosition_Centre];
      } arrayOfBlocksForButtons:@[confirmCompletionBlock]]; // Array of Blocks for Corresponding Actions

  For Every 'N' Buttons in the otherbuttonTitles array, provide the same number of handler blocks in arrayOfBlocksForButtons


Published under the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt)
