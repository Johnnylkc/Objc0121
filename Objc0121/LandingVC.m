//
//  LandingVC.m
//  Objc0121
//
//  Created by 劉坤昶 on 2016/1/24.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "LandingVC.h"

#import "MainTVC.h"
#import "ClassListTVC.h"

@interface LandingVC () <UIScrollViewDelegate>

@property(strong,nonatomic) UIScrollView *scrollView;
@property(strong,nonatomic) UIPageControl *pageControl;

@property(strong,nonatomic) UIImageView *classImage01;
@property(strong,nonatomic) UIImageView *classImage02;
@property(strong,nonatomic) UIImageView *classImage03;
@property(strong,nonatomic) UIImageView *classImage04;
@property(strong,nonatomic) UIImageView *classImage05;

@property(strong,nonatomic) UIButton *signButton;
@property(strong,nonatomic) UIButton *loginButton;
@property(strong,nonatomic) UIView *lineView;

@property(strong,nonatomic) UITabBarController *tabBarController;
@property(strong,nonatomic) UIImage *tabIcon;
@property(strong,nonatomic) UIImage *tabSelectedIcon;




@end

@implementation LandingVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self allUI];
    
}


-(void)allUI
{
    CGFloat scrollViewWidth,scrollViewHeight;
    scrollViewWidth = self.view.frame.size.width;
    scrollViewHeight = self.view.frame.size.height-50;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scrollViewWidth, scrollViewHeight)];
    self.scrollView.contentSize = CGSizeMake(scrollViewWidth*5, 0);
    self.scrollView.backgroundColor = [UIColor orangeColor];
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    self.classImage01 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scrollViewWidth, scrollViewHeight)];
    self.classImage01.contentMode = UIViewContentModeScaleAspectFill;
    self.classImage01.clipsToBounds = YES;
    self.classImage01.image = [UIImage imageNamed:@"aaa"];
    [self.scrollView addSubview: self.classImage01];
    
    self.classImage02 =
    [[UIImageView alloc] initWithFrame:CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight)];
    self.classImage02.contentMode = UIViewContentModeScaleAspectFill;
    self.classImage02.clipsToBounds = YES;
    self.classImage02.image = [UIImage imageNamed:@"bbb"];
    [self.scrollView addSubview: self.classImage02];
    
    self.classImage03 =
    [[UIImageView alloc] initWithFrame:CGRectMake(scrollViewWidth*2, 0, scrollViewWidth, scrollViewHeight)];
    self.classImage03.contentMode = UIViewContentModeScaleAspectFill;
    self.classImage03.clipsToBounds = YES;
    self.classImage03.image = [UIImage imageNamed:@"ccc"];
    [self.scrollView addSubview: self.classImage03];
    
    self.classImage04 =
    [[UIImageView alloc] initWithFrame:CGRectMake(scrollViewWidth*3, 0, scrollViewWidth, scrollViewHeight)];
    self.classImage04.contentMode = UIViewContentModeScaleAspectFill;
    self.classImage04.clipsToBounds = YES;
    self.classImage04.image = [UIImage imageNamed:@"ddd"];
    [self.scrollView addSubview: self.classImage04];
    
    self.classImage05 =
    [[UIImageView alloc] initWithFrame:CGRectMake(scrollViewWidth*4, 0, scrollViewWidth, scrollViewHeight)];
    self.classImage05.contentMode = UIViewContentModeScaleAspectFill;
    self.classImage05.clipsToBounds = YES;
    self.classImage05.image = [UIImage imageNamed:@"eee"];
    [self.scrollView addSubview: self.classImage05];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    self.pageControl.center = CGPointMake(scrollViewWidth/2, scrollViewHeight-10);
    self.pageControl.numberOfPages = 5;
    self.pageControl.currentPage = 0;
    [self.view addSubview:self.pageControl];
    
    self.signButton =
    [[UIButton alloc] initWithFrame:CGRectMake(0, scrollViewHeight, scrollViewWidth/2, self.view.frame.size.height-scrollViewHeight)];
    [self.signButton setTitle:@"註 冊" forState:UIControlStateNormal];
    [self.signButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.signButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.signButton.backgroundColor = [UIColor grayColor];
    [self.signButton addTarget:self action:@selector(signUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.signButton];
    
    self.loginButton =
    [[UIButton alloc] initWithFrame:CGRectMake(scrollViewWidth/2, scrollViewHeight, scrollViewWidth/2, self.view.frame.size.height-scrollViewHeight)];
    [self.loginButton setTitle:@"登 入" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.loginButton.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.loginButton];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, 25)];
    self.lineView.center = CGPointMake(scrollViewWidth/2, scrollViewHeight+25);
    self.lineView.layer.cornerRadius = 2;
    self.lineView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.lineView];
    
    
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}

-(void)signUp:(UIButton*)signButton
{
    
    MainTVC *onePage = [MainTVC new];
    UINavigationController *onePageNav = [[UINavigationController alloc] initWithRootViewController:onePage];
    self.tabIcon = [UIImage imageNamed:@"001"];
    self.tabSelectedIcon = [UIImage imageNamed:@"001"];
    onePage.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"探索" image:self.tabIcon selectedImage:self.tabSelectedIcon];
    
    ClassListTVC *twoPage = [ClassListTVC new];
    UINavigationController *twoPageNav = [[UINavigationController alloc] initWithRootViewController:twoPage];
    self.tabIcon = [UIImage imageNamed:@"002"];
    self.tabSelectedIcon = [UIImage imageNamed:@"002"];
    twoPage.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"課程列表" image:self.tabIcon selectedImage:self.tabSelectedIcon];
    
    
    NSArray *controllers = [[NSArray alloc] initWithObjects:onePageNav,twoPageNav, nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = controllers;
    
    self.tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:self.tabBarController animated:YES completion:nil];

    
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
