//
//  MasterViewController.h
//  SplitBrowser2
//
//  Created by SheshuKumar Inguva on 3/8/17.
//  Copyright © 2017 SheshuKumar Inguva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewDelegateViewController.h"
@interface MasterViewController : WebViewDelegateViewController
@property (weak, nonatomic) IBOutlet UIWebView *MasterWebView;
@property (weak, nonatomic) IBOutlet UITextField *AddressField;
@property (weak, nonatomic) IBOutlet UISwitch *SplitSwitch;

@end
