//
//  DetailTVC.m
//  Objc0121
//
//  Created by 劉坤昶 on 2016/1/22.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "DetailTVC.h"
#import "DetailCell.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"


@interface DetailTVC ()

@property(strong,nonatomic) UIView *headerView;
@property(strong,nonatomic) UIImageView *headerImage;

@end

@implementation DetailTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[DetailCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.backgroundColor = [UIColor grayColor];
    
    ////stausBar textColor
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    
    [self allUI];
        ////下面這三行 分別是
    ////第一行 ： NavBar的BackgroundImage 給他一個Image 但沒有給他任何圖（值）
    ////第二行 ： NavBar的ShadowImage 也是給他一個Image 但沒有給他任何圖（值）
    ////第三行 ： NavBar的translucent(透明)，預設是NO不透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.translucent = YES;
    
    
    ////下面這行原本有用到 預設是YES 如果改成NO 那圖片就可以頂到螢幕最上方 但後來沒有用了
    // self.automaticallyAdjustsScrollViewInsets = NO;

    
    
}


////如果沒有在這把NavBar的設定改回原本的預設狀態 那回到前一頁NavBar也會變透明跟這頁一樣
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = YES;

}


-(void)allUI
{
    ////headerView的底VIew
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 200)];
    self.headerView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.tableHeaderView = self.headerView;
    
    ////要加在headerView上的Image
    self.headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, -65, self.headerView.frame.size.width, self.headerView.frame.size.height + 65)];
    self.headerImage.contentMode = UIViewContentModeScaleAspectFill;
    self.headerImage.clipsToBounds = YES;
    NSURL *url = [NSURL URLWithString:[self.nextDic objectForKey:@"photo"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.headerImage setImageWithURLRequest:request placeholderImage:nil success:nil failure:nil];
    [self.headerView addSubview:self.headerImage];
    


    
}


////UITableViewController原本就有UIScrollView的特性 直接用即可
- ( void )scrollViewDidScroll:( UIScrollView *)scrollView;
{
 
    ////我原本一直用self.tableView.contentoffset.y 去試 原來要用scrollView ， 100這參數就看你的要拉到哪 自行設定
    if (scrollView.contentOffset.y >100)
    {
        ////用animation是因為會突然出現NavBar 我希望有點緩衝
        [UIView animateWithDuration:0.2 animations:^{
            
            [self.navigationController.navigationBar setShadowImage:nil];
            self.navigationController.navigationBar.translucent = NO;
           
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

        }];
       
    }
    else if (scrollView.contentOffset.y  < 100)
    {
        
        [UIView animateWithDuration:0.2 animations:^{
           

            [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
            [self.navigationController.navigationBar setShadowImage:[UIImage new]];
            self.navigationController.navigationBar.translucent = YES;
            
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;


        }];
        
    }
    
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight;
    
    if (indexPath.row == 0)
    {
        rowHeight = 200;
    }
    else
    {
        rowHeight = 60;
    }
    
    
    return rowHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    cell.bandName.text = @"";
    cell.bandName.text = self.nextDic[@"name"];
    
    
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
