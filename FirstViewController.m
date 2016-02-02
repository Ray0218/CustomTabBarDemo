//
//  FirstViewController.m
//  TabBarDemo
//
//  Created by Ray on 16/1/19.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "FirstViewController.h"
#import "FiveViewController.h"

#import "DPNSString.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"第一页" ;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pvt_right) ];
    
    NSString *str = [NSString stringWithFormat:@"%f",123.456789] ;
    NSLog(@"&&& == %@",str) ;
    
    str = [str gotFloatStringWithFloatNum:2];
    NSLog(@"&&& == %@",str) ;

    
}

-(void)pvt_right{

 
    UIViewController  *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor orangeColor] ;
    vc.title = @"测试页面" ;
    [vc setHidesBottomBarWhenPushed:YES];

    [self.navigationController pushViewController:vc animated:YES];
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
