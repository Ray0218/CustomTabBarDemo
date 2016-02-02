//
//  CustomerTabBarViewController.m
//  TabBarDemo
//
//  Created by Ray on 16/1/18.
//  Copyright © 2016年 Ray. All rights reserved.
//

#import "CustomerTabBarViewController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

@interface CustomerBarButton : UIButton

@end

@implementation CustomerBarButton

-(void)setHighlighted:(BOOL)highlighted{

}

@end


@interface CustomerTabBarViewController ()<UITabBarControllerDelegate>
/**
 *  设置之前选中的按钮
 */
@property (nonatomic, weak) UIButton *selectedBtn;
@end

@implementation CustomerTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FirstViewController *firsVC = [[FirstViewController alloc]init];
    firsVC.view.backgroundColor = [UIColor greenColor] ;
      UINavigationController *firsNVC = [[UINavigationController alloc]initWithRootViewController:firsVC];
    
    
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    secondVC.view.backgroundColor = [UIColor orangeColor] ;
     UINavigationController *secondNVC = [[UINavigationController alloc]initWithRootViewController:secondVC];
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
    thirdVC.view.backgroundColor = [UIColor blueColor] ;
     UINavigationController *thirdNVC = [[UINavigationController alloc]initWithRootViewController:thirdVC];
    
    FourViewController *fourVC = [[FourViewController alloc]init];
    fourVC.view.backgroundColor = [UIColor purpleColor] ;
     UINavigationController *fourNVC = [[UINavigationController alloc]initWithRootViewController:fourVC];
    
    
    FiveViewController *fiveVC = [[FiveViewController alloc]init];
    fiveVC.view.backgroundColor = [UIColor greenColor] ;
     UINavigationController *fiveNVC = [[UINavigationController alloc]initWithRootViewController:fiveVC];
    
        
    firsVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"购彩大厅" image:[UIImage imageNamed: @"homebuyNormal.png"] tag:  1];
    secondVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"比分直播" image:[UIImage imageNamed:@"gameliveNormal.png"] tag: 2];
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:[[UIImage imageNamed:@"img_center.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:3];
     item.imageInsets = UIEdgeInsetsMake(-20, 0, 20, 0) ;
    thirdVC.tabBarItem = item ;
    fourVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"开奖公告" image:[UIImage imageNamed:@"resultNormal.png"] tag:  4];
    fiveVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的彩票" image:[UIImage imageNamed:@"myTicketNormal.png"] tag:  5];
 
    
    self.view.backgroundColor = [UIColor grayColor];
    self.viewControllers = @[ firsNVC, secondNVC, thirdNVC, fourNVC, fiveNVC ];
    self.tabBar.tintColor = [UIColor yellowColor];
    self.tabBar.translucent = NO;
    self.tabBar.barTintColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.delegate = self;

    
    [self setup];
    
     
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

  UITouch *touch =  touches.anyObject ;
    CGPoint point = [touch locationInView:self.view] ;
    
    NSLog(@"point === x == %f   y == %f",point.x,point.y) ;
    
    CGRect rect =  CGRectMake(130, CGRectGetHeight(self.view.frame)-44-24, 60, 24) ;
    
    if (CGRectContainsPoint(rect, point)) {
        self.selectedIndex = 2 ;
    }
}


#pragma mark- setup
-(void)setup
{
    //  添加突出按钮
    [self addCenterButtonWithImage:[UIImage imageNamed:@"resultNormal.png"] selectedImage:[UIImage imageNamed:@"myTicketNormal.png"]];
    //  UITabBarControllerDelegate 指定为自己
 
    self.delegate = self ;
    //  指定当前页——中间页
    self.selectedIndex=2;
    //  设点button状态
    self.selectedBtn.selected=YES;
    //  设定其他item点击选中颜色
    self.tabBar.tintColor=  [UIColor redColor] ;//[UIColor colorWithRed:222/255.0 green:78/255.0 blue:22/255.0 alpha:1];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
    for (UIView *view in self.tabBar.subviews) {
        NSLog(@"%@",view) ;
    }
    
    [self setHidesBottomBarWhenPushed:YES];
    
    
}


#pragma mark - addCenterButton
// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage selectedImage:(UIImage*)selectedImage
{
   self.selectedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectedBtn.backgroundColor = [UIColor greenColor] ;
    [self.selectedBtn addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    self.selectedBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    
    //  设定button大小为适应图片
    self.selectedBtn.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [self.selectedBtn setImage:buttonImage forState:UIControlStateNormal];
    [self.selectedBtn setImage:selectedImage forState:UIControlStateSelected];
    
    //  这个比较恶心  去掉选中button时候的阴影
    self.selectedBtn.adjustsImageWhenHighlighted=NO;
    
    
    /*
     *  核心代码：设置button的center 和 tabBar的 center 做对齐操作， 同时做出相对的上浮
     */
//    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
//    if (heightDifference < 0)
//        self.selectedBtn.center = self.tabBar.center;
//    else
//    {
        CGPoint center = self.tabBar.center;
//        center.y = center.y - heightDifference/2.0;
        center.y = center.y - 10.0;

        self.selectedBtn.center = center;
//    }
    
    [self.tabBar addSubview:self.selectedBtn];
    [self.tabBar bringSubviewToFront:self.selectedBtn];
    

}

-(void)pressChange:(id)sender
{
    self.selectedIndex=2;
    self.selectedBtn.selected=YES;
}

#pragma mark- TabBar Delegate

//  换页和button的状态关联上

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (self.selectedIndex==2) {
        self.selectedBtn.selected=YES;
    }else
    {
        self.selectedBtn.selected=NO;
    }
}

@end
