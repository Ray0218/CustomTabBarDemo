//
//  ThirdViewController.m
//  TabBarDemo
//
//  Created by Ray on 16/1/19.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "ThirdViewController.h"
#import "RESideMenu/RESideMenu.h"
#import <Kathmandu/Kathmandu.h>

@interface ThirdViewController ()<UITextViewDelegate>
{

    UITextView *_textView ;
}

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"第三页" ;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(pvt_left) ];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pvt_right) ];
    
    [self testTextView];
    
    
 }


-(void)testTextView {
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(50, 100, 200, 130)];
    _textView.backgroundColor = [UIColor whiteColor] ;
    [self.view addSubview:_textView];
    
    

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"This is an example by @7上8下"];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"userId://230099887746" //7上8下的userId
                             range:[[attributedString string] rangeOfString:@"@7上8下"]]; //为7上8下添加链接
    
    
    NSDictionary *linkAttributes = @{NSForegroundColorAttributeName: [UIColor dp_flatGrayColor],
                                     NSUnderlineColorAttributeName: [UIColor lightGrayColor],
                                     NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
    
    // assume that textView is a UITextView previously created (either by code or Interface Builder)
    _textView.linkTextAttributes = linkAttributes; // customizes the appearance of links
    _textView.attributedText = attributedString;
    _textView.delegate = self;
    _textView.editable = NO ;
 
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([[URL scheme] isEqualToString:@"userId"]) {
        NSString *username = [URL host];
        // do something with this username
        // ...
        
        NSLog(@"%@",username) ;
        return NO;
    }
    return YES; // let the system open this URL
}

-(void)pvt_right{
    
    
    UIViewController  *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor orangeColor] ;
    vc.title = @"测试页面" ;
    [vc setHidesBottomBarWhenPushed:YES];
    
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)pvt_left{
    
    if ([self respondsToSelector:@selector(presentLeftMenuViewController:)]) {
        [self performSelector:@selector(presentLeftMenuViewController:) withObject:nil withObject:0];
    }

    
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
