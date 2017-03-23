//
//  DetailViewController.h
//  SplitBrowser2
//
//  Created by SheshuKumar Inguva on 3/8/17.
//  Copyright © 2017 SheshuKumar Inguva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *DetailWebView;
-(void) loadUrl:(NSString*)url;
-(void) loadUrlWithUrl:(NSURL*) aUrl;
@end
