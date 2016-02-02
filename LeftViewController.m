//
//  LeftViewController.m
//  TabBarDemo
//
//  Created by Ray on 16/1/19.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "LeftViewController.h"

#import "RESideMenu.h"
#import "DEMOFirstViewController.h"


@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    UITableView *_tableView ;
}
 @end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    _tableView.delegate =self ;
    _tableView.dataSource =self ;
    _tableView.backgroundColor = [UIColor grayColor] ;
    
    [self.view addSubview:_tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 29 ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellIdentify = @"cellIdentify" ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify] ;
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
        cell.selectionStyle = UITableViewCellEditingStyleNone ;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行",indexPath.row] ;
    return  cell ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[DEMOFirstViewController alloc] init]]
                                                 animated:YES];
    [self.sideMenuViewController hideMenuViewController];
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
