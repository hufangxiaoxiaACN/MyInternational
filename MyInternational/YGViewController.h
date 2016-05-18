//
//  YGViewController.h
//  MyInternational
//
//  Created by Hufang on 16/5/18.
//  Copyright © 2016年 Fhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InternationalControl.h"

@interface YGViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *inviteLabel;//label

- (IBAction)changeLanguage:(id)sender;//点击事件

@property (retain, nonatomic) IBOutlet UIButton *btChange;//button

@end
