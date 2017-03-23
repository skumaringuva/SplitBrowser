//
//  Utils.h
//  SplitBrowser2
//
//  Created by SheshuKumar Inguva on 3/9/17.
//  Copyright © 2017 SheshuKumar Inguva. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <WebKit/WebKit.h>

@interface Utils : NSObject
+(void) loadUrl:(UIWebView*)webView url:(NSString*)aUrl;
+(NSString*) clanUrl:(NSString*)input;
+(void) goBack:(UIWebView*)webView;
+(void) goForward:(UIWebView*) webView;
+(NSString*) getDefaultWebPage;
+(void) setupCache;
+(void) clearCache;
@end
