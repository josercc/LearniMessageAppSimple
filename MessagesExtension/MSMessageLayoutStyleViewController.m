//
//  MSMessageLayoutStyleViewController.m
//  GBMessageAppSimple
//
//  Created by 张行 on 16/9/22.
//  Copyright © 2016年 张行. All rights reserved.
//

#import "MSMessageLayoutStyleViewController.h"
typedef NS_ENUM(NSUInteger,MessageLayoutStyle) {
    MessageLayoutStyleImage = 0,
    MessageLayoutStyleImageTitle = 1,
    MessageLayoutStyleImageSubTitle = 2,
};
@interface MSMessageLayoutStyleViewController ()

@end

@implementation MSMessageLayoutStyleViewController
- (IBAction)sendMessageImageSubTitle:(id)sender {
    [self sendMessageWithStyle:MessageLayoutStyleImageSubTitle];
}
- (IBAction)sendMessageObject:(id)sender {
    [self sendMessageWithStyle:MessageLayoutStyleImage];
}
- (IBAction)SendMessageImageTitle:(id)sender {
    [self sendMessageWithStyle:MessageLayoutStyleImageTitle];
}

- (void)sendMessageWithStyle:(MessageLayoutStyle)style {
    MSMessage *message = [[MSMessage alloc]init];
    NSURLComponents *components =  [[NSURLComponents alloc]initWithString:@"http:www.baidu.com"];
    message.URL = components.URL;
    message.layout = [self messageLayout:style];
    [self.messageViewController.activeConversation insertMessage:message completionHandler:nil];
}

- (MSMessageLayout *)messageLayout:(MessageLayoutStyle)style {
    UIImage *image = [UIImage imageNamed:@"gb_simple_icon"];
    NSString *imageTitle = @"Image Title";
    NSString *imageSubTitle = @"Image Sub Title";
    switch (style) {
        case MessageLayoutStyleImage: {
            return [self messageLayoutWithImage:image imageTitle:nil imageSubTitle:nil];
        }
            break;
        case MessageLayoutStyleImageTitle: {
            return [self messageLayoutWithImage:image imageTitle:imageTitle imageSubTitle:nil];
        }
        case MessageLayoutStyleImageSubTitle: {
            return [self messageLayoutWithImage:image imageTitle:imageTitle imageSubTitle:imageSubTitle];
        }
        default:
            return nil;
            break;
    }
}

- (MSMessageLayout *)messageLayoutWithImage:(UIImage *)image imageTitle:(NSString *)imageTitle imageSubTitle:(NSString *)imageSubTitle {
    MSMessageTemplateLayout *layout = [[MSMessageTemplateLayout alloc]init];
    layout.image = image;
    layout.imageTitle = imageTitle;
    layout.imageSubtitle = imageSubTitle;
    return layout;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
