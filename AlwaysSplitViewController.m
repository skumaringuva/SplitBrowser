//
//  AlwaysSplitViewController.m
//  SplitBrowser2
//
//  Created by SheshuKumar Inguva on 3/10/17.
//  Copyright © 2017 SheshuKumar Inguva. All rights reserved.
//

#import "AlwaysSplitViewController.h"

@interface AlwaysSplitViewController ()

@end

@implementation AlwaysSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController
collapseSecondaryViewController:(UIViewController *)secondaryViewController
  ontoPrimaryViewController:(UIViewController *)primaryViewController {
    
    
    // always return yes, so that we see the split always.
    return YES;
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
