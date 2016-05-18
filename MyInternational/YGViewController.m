//
//  YGViewController.m
//  MyInternational
//
//  Created by Hufang on 16/5/18.
//  Copyright © 2016年 Fhu. All rights reserved.
//

#import "YGViewController.h"

@implementation YGViewController
- (void)viewDidLoad
{
    //注册通知，用于接收改变语言的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:@"changeLanguage" object:nil];
    
    [InternationalControl initUserLanguage];//初始化应用语言
    
    NSBundle *bundle = [InternationalControl bundle];
    
    NSString *inviteMsg = [bundle localizedStringForKey:@"invite" value:nil table:@"hello"]? :@"invite";
    
    NSString *buttonInfo = [bundle localizedStringForKey:@"buttonInfo" value:nil table:@"hello"]? :@"button";//table为hello.string的文件名
    
    [_btChange setTitle:buttonInfo forState:UIControlStateNormal];
    
    _inviteLabel.text = inviteMsg;
    
    [super viewDidLoad];
}

- (IBAction)changeLanguage:(id)sender {
    
    NSString *lan = [InternationalControl userLanguage];
    
    if([lan isEqualToString:@"en"]){//判断当前的语言，进行改变
        
        [InternationalControl setUserlanguage:@"zh-Hans"];
        
    }else{
        
        [InternationalControl setUserlanguage:@"en"];
    }
    
    //改变完成之后发送通知，告诉其他页面修改完成，提示刷新界面
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage" object:nil];
}

-(void)changeLanguage{
    
    [_btChange setTitle:[[InternationalControl bundle] localizedStringForKey:@"buttonInfo" value:nil table:@"hello"] forState:UIControlStateNormal];
    
    _inviteLabel.text =[[InternationalControl bundle] localizedStringForKey:@"invite" value:nil table:@"hello"];
}

@end
