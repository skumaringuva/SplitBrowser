//
//  DetailViewController.m
//  SplitBrowser2
//
//  Created by SheshuKumar Inguva on 3/8/17.
//  Copyright © 2017 SheshuKumar Inguva. All rights reserved.
//

#import "DetailViewController.h"
#import "Utils.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize DetailWebView = _DetailWebView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [self loadUrl:@"http://www.eenadu.net"];
}


-(void) loadUrl:(NSString*)aUrl{
    
    [Utils loadUrl:self.DetailWebView url:aUrl];
    
}

-(void) loadUrlWithUrl:(NSURL*) aUrl{

     [self.DetailWebView loadRequest:[NSURLRequest requestWithURL:aUrl]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
