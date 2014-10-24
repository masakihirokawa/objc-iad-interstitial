//
//  ViewController.m
//  iAdInterstitialAd
//
//  Created by Dolice on 2014/10/24.
//  Copyright (c) 2014 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // サンプルボタン配置
    [self setSampleButton];
}

#pragma mark - Sample button

// サンプルボタン配置
- (void)setSampleButton
{
    CGFloat sampleButtonWidth  = SCR_SIZE.width;
    CGFloat sampleButtonHeight = 64.0;
    CGFloat sampleButtonX      = 0.0;
    CGFloat sampleButtonY      = roundf((SCR_SIZE.height / 2) - (sampleButtonHeight / 2));
    UIButton *sampleButton     = [self planeButton:CGRectMake(sampleButtonX, sampleButtonY, sampleButtonWidth, sampleButtonHeight)
                                              text:@"Show" delegate:self action:@selector(loadiAdInterstitial:)];
    [self.view addSubview:sampleButton];
}

// ボタン取得
- (UIButton *)planeButton:(CGRect)frame text:(NSString *)text delegate:(id)delegate action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:text forState:UIControlStateNormal];
    button.frame = frame;
    [button addTarget:delegate action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

#pragma mark - iAd Interstitial Ad

// iAdインタースティシャル広告読み込み
- (void)loadiAdInterstitial:(UIButton *)button
{
    iAdInterstitial = [[ADInterstitialAd alloc] init];
    iAdInterstitial.delegate = self;
    self.interstitialPresentationPolicy = ADInterstitialPresentationPolicyManual;
    [self requestInterstitialAdPresentation];
}

// iAdインタースティシャル広告がロードされた時に呼ばれる
- (void)interstitialAdDidLoad:(ADInterstitialAd *)interstitialAd
{
    if (iAdInterstitial.loaded) {
        [iAdInterstitial presentFromViewController:self];
    }
}

// iAdインタースティシャル広告がアンロードされた時に呼ばれる
- (void)interstitialAdDidUnload:(ADInterstitialAd *)interstitialAd
{
    iAdInterstitial = nil;
}

// iAdインタースティシャル広告の読み込み失敗時に呼ばれる
- (void)interstitialAd:(ADInterstitialAd *)interstitialAd didFailWithError:(NSError *)error
{
    iAdInterstitial = nil;
}

// iAdインタースティシャル広告が閉じられた時に呼ばれる
- (void)interstitialAdActionDidFinish:(ADInterstitialAd *)interstitialAd
{
    iAdInterstitial = nil;
}

@end
