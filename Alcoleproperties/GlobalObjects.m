//
//  GlobalObjects.m
//  Hema
//
//  Created by Mac on 16/12/14.
//  Copyright (c) 2014 Hema. All rights reserved.
//

#import "GlobalObjects.h"
#import "UIColor+HexColor.h"
#import "GlobalStrings.h"
#import "HomeViewController.h"
#import "AppDelegate.h"

@interface GlobalObjects()
{
    CGRect mainFrame;
}
@end

@implementation GlobalObjects

-(UIView *)UIViewSetHeaderView
{
    mainFrame = [[UIScreen mainScreen] bounds];
    
    UIView *HeaderViewBackgroundView = [[UIView alloc] init];
    [HeaderViewBackgroundView setFrame:CGRectMake(0, 0, mainFrame.size.width, 50)];
    [HeaderViewBackgroundView setBackgroundColor:[UIColor clearColor]];
    
    UILabel *BorderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 49, mainFrame.size.width, 1)];
    [BorderLabel setBackgroundColor:[UIColor colorFromHex:0xe66a4c]];
    [HeaderViewBackgroundView addSubview:BorderLabel];
    
    
    // Logo Image
    
    UIImageView *LogoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(mainFrame.size.width/2-25, 25, 50, 15)];
    [LogoImageView setBackgroundColor:[UIColor clearColor]];
    [LogoImageView setImage:[UIImage imageNamed:@"logo_png.png"]];
    [HeaderViewBackgroundView addSubview:LogoImageView];
    
    return HeaderViewBackgroundView;
}

-(UIView *)UIViewSetHeaderViewWithbackButton:(BOOL)backButton
{
    mainFrame = [[UIScreen mainScreen] bounds];
    
    UIView *HeaderViewBackgroundView = [[UIView alloc] init];
    [HeaderViewBackgroundView setFrame:CGRectMake(0, 0, mainFrame.size.width, 50)];
    [HeaderViewBackgroundView setBackgroundColor:[UIColor clearColor]];
    
    UILabel *BorderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 49, mainFrame.size.width, 1)];
    [BorderLabel setBackgroundColor:[UIColor colorFromHex:0xe66a4c]];
    [HeaderViewBackgroundView addSubview:BorderLabel];
    
    mainFrame = [[UIScreen mainScreen] bounds];
    
    // Back Button
    
    if (backButton) {
        UIButton *SetbackButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 32, 32)];
        [SetbackButton setImage:[UIImage imageNamed:@"goback.png"] forState:UIControlStateNormal];
        [SetbackButton addTarget:self action:@selector(Goback:) forControlEvents:UIControlEventTouchUpInside];
        [HeaderViewBackgroundView addSubview:SetbackButton];
    }
    
    // Logo Image
    
    UIImageView *LogoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(mainFrame.size.width/2-25, 25, 50, 15)];
    [LogoImageView setBackgroundColor:[UIColor clearColor]];
    [LogoImageView setImage:[UIImage imageNamed:@"logo_png.png"]];
    [HeaderViewBackgroundView addSubview:LogoImageView];
    
    return HeaderViewBackgroundView;
}

-(UIView *)UIViewSetFooterView
{
    UIView *FooterBackgroundView = [[UIView alloc] init];
    [FooterBackgroundView setFrame:CGRectMake([GlobalStrings.FooterXposition floatValue], [GlobalStrings.FooterYposition floatValue], [GlobalStrings.FooterWidth floatValue], [GlobalStrings.FooterHeight floatValue])];
    [FooterBackgroundView setBackgroundColor:[UIColor colorFromHex:0x452715]];
    
    /**
     *  Add social Icon
     */
    
    CGRect mainFrameone = [[UIScreen mainScreen] bounds];
    
    // Twitter Button
    
    float XPositionStart = mainFrameone.size.width/2-74;
    float XGapStart      = 40.00;
    float YPositionStart = 10.0f;
    float ImageHeight    = 28.0f;
    
    UIButton *FooterTwitterButton = [[UIButton alloc] initWithFrame:CGRectMake(XPositionStart, YPositionStart, ImageHeight, ImageHeight)];
    [FooterTwitterButton setBackgroundColor:[UIColor clearColor]];
    [FooterTwitterButton setBackgroundImage:[UIImage imageNamed:[GlobalStrings FooterSocialTwitterIcon]] forState:UIControlStateNormal];
    [FooterTwitterButton addTarget:self action:@selector(FooterLinkClicked:) forControlEvents:UIControlEventTouchUpInside];
    [FooterTwitterButton setTag:10024];
    [FooterBackgroundView addSubview:FooterTwitterButton];
    
    // Facebook Button
    
    UIButton *FooterFacebookButton = [[UIButton alloc] initWithFrame:CGRectMake(XPositionStart+XGapStart*1, YPositionStart, ImageHeight, ImageHeight)];
    [FooterFacebookButton setBackgroundColor:[UIColor clearColor]];
    [FooterFacebookButton setBackgroundImage:[UIImage imageNamed:[GlobalStrings FooterSocialFacebookIcon]] forState:UIControlStateNormal];
    [FooterFacebookButton setTag:10025];
    [FooterFacebookButton addTarget:self action:@selector(FooterLinkClicked:) forControlEvents:UIControlEventTouchUpInside];
    [FooterBackgroundView addSubview:FooterFacebookButton];
    
    // Youtube Button
    
    UIButton *FooterYoutubeButton = [[UIButton alloc] initWithFrame:CGRectMake(XPositionStart+XGapStart*2, YPositionStart, ImageHeight, ImageHeight)];
    [FooterYoutubeButton setBackgroundColor:[UIColor clearColor]];
    [FooterYoutubeButton setBackgroundImage:[UIImage imageNamed:[GlobalStrings FooterSocialYoutubeIcon]] forState:UIControlStateNormal];
    [FooterYoutubeButton setTag:10026];
    [FooterYoutubeButton addTarget:self action:@selector(FooterLinkClicked:) forControlEvents:UIControlEventTouchUpInside];
    [FooterBackgroundView addSubview:FooterYoutubeButton];
    
    // GooglePlus Button
    
    UIButton *FooterGooglePlusButton = [[UIButton alloc] initWithFrame:CGRectMake(XPositionStart+XGapStart*3, YPositionStart, ImageHeight, ImageHeight)];
    [FooterGooglePlusButton setBackgroundColor:[UIColor clearColor]];
    [FooterGooglePlusButton setBackgroundImage:[UIImage imageNamed:[GlobalStrings FooterSocialGoogleplusIcon]] forState:UIControlStateNormal];
    [FooterGooglePlusButton setTag:10027];
    [FooterGooglePlusButton addTarget:self action:@selector(FooterLinkClicked:) forControlEvents:UIControlEventTouchUpInside];
    [FooterBackgroundView addSubview:FooterGooglePlusButton];
    
    /**
     *  @return Footerview
     */
    return FooterBackgroundView;
}

-(void)GotoDifferentViewWithAnimation:(UIViewController *)ViewControllerName {
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.25f;
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [self.navigationController pushViewController:ViewControllerName animated:NO];
    
}
-(IBAction)FooterLinkClicked:(UIButton *)sender
{
    
}
-(IBAction)Goback:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
