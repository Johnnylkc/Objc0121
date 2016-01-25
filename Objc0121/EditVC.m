//
//  EditVC.m
//  Objc0121
//
//  Created by 劉坤昶 on 2016/1/25.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "EditVC.h"

@interface EditVC () <UITextFieldDelegate>
{
//    NSMutableDictionary *textDict;

    
    
}

@property(strong,nonatomic) UIButton *cancelButton;
@property(strong,nonatomic) UITextField *nameTextField;
@property(strong,nonatomic) UIButton *enterButton;


@end

@implementation EditVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self allUI];

    
}


-(void)allUI
{
    
    self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 50, 30)];
    self.cancelButton.backgroundColor = [UIColor clearColor];
    [self.cancelButton setTitle:@"取 消" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.cancelButton];
    
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    self.nameTextField.center = CGPointMake(self.view.frame.size.width/2, 200);
    self.nameTextField.delegate = self;
    [self.nameTextField setBorderStyle:UITextBorderStyleBezel];
    [self.view addSubview:self.nameTextField];
    
    self.enterButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    self.enterButton.center = CGPointMake(self.view.frame.size.width/2, 250);
    [self.enterButton setBackgroundColor:[UIColor orangeColor]];
    [self.enterButton setTitle:@"確 定" forState:UIControlStateNormal];
    [self.enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.enterButton addTarget:self action:@selector(enter:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.enterButton];
    
    
    
    
    
    
    
}


-(void)cancel:(UIButton*)cancelButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)enter:(UIButton*)enterButton
{
    NSMutableDictionary *textDict = [@{@"name":self.nameTextField.text}mutableCopy];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"addUserInfo" object:nil userInfo:textDict];

    [self dismissViewControllerAnimated:YES completion:nil];
    
   
    
}



- (void)didReceiveMemoryWarning
{
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
