//
//  ZYNTipsViewController.m
//  NETLottery
//
//  Created by zyn on 16/6/17.
//  Copyright © 2016年 张艳能. All rights reserved.
//

#import "ZYNTipsViewController.h"
#import "ZYNQuestion.h"

@interface ZYNTipsViewController ()<UIWebViewDelegate>

@end

@implementation ZYNTipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    webView.delegate = self;
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.question.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // 加载完毕后跳转窗口
    // 在一个html中跳转至对应的位置
    NSString *script = [NSString stringWithFormat:@"window.location.href = '#%@'", self.question.ID];
    [webView stringByEvaluatingJavaScriptFromString:script];
}

@end
