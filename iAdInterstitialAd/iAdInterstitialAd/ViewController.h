//
//  ViewController.h
//  iAdInterstitialAd
//
//  Created by Dolice on 2014/10/24.
//  Copyright (c) 2014 Dolice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

#define SCR_SIZE [[UIScreen mainScreen] bounds].size

@interface ViewController : UIViewController <ADInterstitialAdDelegate> {
    ADInterstitialAd *iAdInterstitial;
}

@end

