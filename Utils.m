//
//  Utils.m
//  SplitBrowser2
//
//  Created by SheshuKumar Inguva on 3/9/17.
//  Copyright © 2017 SheshuKumar Inguva. All rights reserved.
//

#import "Utils.h"

@implementation Utils


+(void) loadUrl:(UIWebView*)webView url:(NSString*)aUrl{
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:aUrl]]];
    
}

+(NSString*) clanUrl:(NSString*)input{
    NSString* output  = [input stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    NSString* lowerOutput = [output lowercaseString];
    if(!([lowerOutput hasPrefix:@"http"] ||[lowerOutput hasPrefix:@"https"]))
        output  = [NSString stringWithFormat:@"http://%@",output];
    return output;
}
+(void) goBack:(UIWebView*)webView{
    
    if([webView canGoBack ])
        [webView goBack];
}

+(void) goForward:(UIWebView*) webView{
    if([webView canGoForward ])
        [webView goForward];
}



@end

