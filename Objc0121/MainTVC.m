//
//  MainTVC.m
//  Objc0121
//
//  Created by 劉坤昶 on 2016/1/21.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "MainTVC.h"
#import "MainCell.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"



@interface MainTVC ()

@property(strong,nonatomic)NSMutableArray *jsonArray;

@end

@implementation MainTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[MainCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.backgroundColor =
    [[UIColor alloc] initWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];


    [self afnetworking];
    
    
    
    
}


-(void)afnetworking
{
    
    NSURL *URL = [NSURL URLWithString:@"http://www.pa9.club/api/v1/stores"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject)
    {
       
        //NSLog(@"JSON: %@", responseObject);
        NSDictionary *dic = responseObject;
        self.jsonArray = dic[@"data"];
        NSLog(@"aaaaaa%@",self.jsonArray);
        [self.tableView reloadData];

    
    } failure:^(NSURLSessionTask *operation, NSError *error)
    {
        NSLog(@"Error: %@", error);
    }];

}


- (void)didReceiveMemoryWarning
{
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
    return self.jsonArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  260;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *dicForCell = self.jsonArray[indexPath.row];
    
    
    cell.backgroundColor = [UIColor clearColor];
    
   
    NSURL *url = [NSURL URLWithString:[dicForCell objectForKey:@"photo"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [cell.bigImage setImageWithURLRequest:request placeholderImage:nil success:nil failure:nil];
    
    
    cell.bandName.text = @"uuuuu";

    
    
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
