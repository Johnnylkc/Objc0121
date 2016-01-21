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
    
    [self allUI];
    
    
    
}


-(void)allUI
{
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 200)];
    self.headerView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.tableHeaderView = self.headerView;
    
    self.headerImage = [[UIImageView alloc] initWithFrame:self.headerView.frame];
    self.headerImage.contentMode = UIViewContentModeScaleAspectFill;
    self.headerImage.clipsToBounds = YES;
    NSURL *url = [NSURL URLWithString:[self.nextDic objectForKey:@"photo"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.headerImage setImageWithURLRequest:request placeholderImage:nil success:nil failure:nil];
    [self.headerView addSubview:self.headerImage];
    
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
