//
//  PostTVC.m
//  Objc0121
//
//  Created by 劉坤昶 on 2016/1/25.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "PostTVC.h"
#import "PostCell.h"
#import "EditVC.h"



#import "AFNetworking.h"
@interface PostTVC ()
{
    NSMutableArray *nameArray;
}



@end

@implementation PostTVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.tableView.rowHeight = 100;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[PostCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *plusButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(show:)];
    [self.navigationItem setRightBarButtonItem:plusButton animated:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateData:) name:@"addUserInfo" object:nil];


    nameArray = [NSMutableArray new];
    

}



//-(void)AFNetworkingGET
//{
//    
//    NSURL *URL = [NSURL URLWithString:@"http://jsonplaceholder.typicode.com/users"];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//       
//        
//        NSLog(@"JSON: %@", responseObject);
//    
//    
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//    
//}


-(void)show:(id)sender
{
    EditVC *controller = [EditVC new];
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)updateData:(NSNotification*)addUserInfo
{
    NSDictionary *dic = addUserInfo.userInfo;
    [nameArray insertObject:dic atIndex:0];
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationRight];
    
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
    return nameArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *dicForCell = nameArray[indexPath.row];
    
    cell.nameLabel.text = dicForCell[@"name"];
    
    
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
