//
//  MasterViewController.m
//  SplitBrowser2
//
//  Created by SheshuKumar Inguva on 3/8/17.
//  Copyright © 2017 SheshuKumar Inguva. All rights reserved.
//

#import "MasterViewController.h"
#import "Utils.h"
#import "DetailViewController.h"
#import <Webkit/Webkit.h>
@interface MasterViewController ()
- (void) openLinkInDetailView:(NSURL*) url;
@end

@implementation MasterViewController
@synthesize MasterWebView = _MasterWebView;
@synthesize SplitSwitch  = _SplitSwitch;

@synthesize AddressField = _AddressField;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [Utils loadUrl:self.MasterWebView url:[Utils getDefaultWebPage]];
    [self.MasterWebView setDelegate:self];
    self.navigationController.toolbarHidden = YES;
    // Do any additional setup after loading the view.
}



- (IBAction)goToWebPage:(id)sender {

    NSString* url = [Utils clanUrl:[self.AddressField text]];

    [Utils loadUrl:self.MasterWebView url:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToBack:(UIButton *)sender {


    if([self.SplitSwitch isOn]){
        UIWebView* detailWebView =[[self getDetailViewController] DetailWebView];
        [Utils goBack:detailWebView];
    }
    else{
        [Utils goBack:[self MasterWebView]];

    }

}
- (IBAction)goForward:(UIButton *)sender {
    if([self.SplitSwitch isOn]){
        UIWebView* detailWebView =[[self getDetailViewController] DetailWebView];
        [Utils goForward:detailWebView];
    }
    else{
        [Utils goForward:[self MasterWebView]];

    }

}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (DetailViewController*) getDetailViewController{
    DetailViewController *detailVC;
    if (self.splitViewController.viewControllers.count > 1) {
        detailVC = self.splitViewController.viewControllers[1];

    }
    return detailVC;
}

- (void) openLinkInDetailView:(NSURL*) url{
    //[self setSplitViewSize:(0.8f)];
    [[self getDetailViewController]loadUrlWithUrl:url];

}

- (void) setSplitViewSize:(float)ratio{

    self.splitViewController.preferredPrimaryColumnWidthFraction = ratio;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        NSURL *url = request.URL;
        NSString *scheme = [url scheme];
        if ([scheme isEqualToString:@"tel"]) {
            // Update the url as needed


            if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
                [[UIApplication sharedApplication] openURL:url options:@{}
                                         completionHandler:^(BOOL success) {
                                             NSLog(@"Open %@: %d",scheme,success);
                                         }];
            } else {
                //  BOOL success = [[UIApplication sharedApplication] openURL:url];
                //  NSLog(@"Open %@: %d",scheme,success);
            }



            return NO; // don't let the webview process it.
        }
        else{
            NSURL *url = request.URL;

            self.AddressField.text = [url absoluteString];
            if([self.SplitSwitch isOn]){
                [self openLinkInDetailView:url];
                return NO;
            }
            else{
                return YES;
            }
        }

    }
    else{
        NSURL *url = request.URL;

        self.AddressField.text = [url absoluteString];
        if([self.SplitSwitch isOn]){
            [self openLinkInDetailView:url];
            return NO;
        }
        else{
            return YES;
        }
    }

    return YES;
}
- (IBAction)clearCache:(id)sender {
    [Utils clearCache];
    // Reset the webviews.
    [Utils loadUrl:self.MasterWebView url:[Utils getDefaultWebPage]];
    [[self getDetailViewController]loadUrlWithUrl:[NSURL URLWithString:[Utils getDefaultWebPage]]];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView;
{
    self.AddressField.text = webView.request.URL.absoluteString;

}


@end
