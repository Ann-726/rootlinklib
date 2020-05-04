//
//  DataViewController.m
//  rootlink
//
//  Copyright © 2018年 rootlink. All rights reserved.
//

#import "DataViewController.h"
#import "MJHAFNetworking.h"
#import "MJHCategoriesHeader.h"
#import "DataViewController.h"
#import "DataTableViewCell.h"
@interface DataViewController ()
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong)  NSMutableArray *dataArray;

@end

@implementation DataViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] init];
#pragma mark 动态设备ID需要注释
    [self requestData:@""];
#pragma mark 动态设备ID需要放开
//    [self requestData];
}

- (IBAction)reSet:(id)sender {
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
#pragma mark 动态设备ID需要注释
     [self requestData:@""];
#pragma mark 动态设备ID需要放开
//    [self requestData];
}

- (IBAction)logOut:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)requestData {
    [SVProgressHUD show];
    NSString *urlString = @"http://www.rootlink.cn/api/device/all";

    NSMutableDictionary *muParameterDic = [NSMutableDictionary dictionary];
    
    [[MJHAFNetworking shareMJHAFNetworking]MJHGet:[urlString stringToUTF8String] parameter:muParameterDic  timeOutInterval:30 success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([[responseObject objectForKey:@"status"] longValue] == 200) {
            [SVProgressHUD showSuccessAndDismiss:@"success"];
            [self deviceDataHandle:[responseObject objectForKey:@"msg"]];
        }else{
            [SVProgressHUD showErrorAndDismiss:[responseObject objectForKey:@"error"]];
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorAndDismiss:[NSString stringWithFormat:@"%@",error]];
        
    }];
}

- (void)deviceDataHandle:(NSArray *)array {
    for (NSDictionary *dic in array) {
        [self requestData:[dic objectForKey:@"deviceId"]];
    }
}

- (void)requestData:(NSString *)deviceId {
    [SVProgressHUD show];
    NSString *urlString = @"http://www.rootlink.cn/api/sensor/all";
    NSMutableDictionary *muParameterDic = [NSMutableDictionary dictionary];
#pragma mark 动态设备ID需要注释
    [muParameterDic setObject:@"e04d49a9-086e-483a-8c8e-883b5f6707c5"  forKey:@"deviceId"];
#pragma mark 动态设备ID需要放开
//    [muParameterDic setObject:deviceId  forKey:@"deviceId"];

    [[MJHAFNetworking shareMJHAFNetworking]MJHGet:[urlString stringToUTF8String] parameter:muParameterDic  timeOutInterval:30 success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([[responseObject objectForKey:@"status"] longValue] == 200) {
            [SVProgressHUD dismiss];
            [self dataHandle:[responseObject objectForKey:@"msg"]];
         }else{
            [SVProgressHUD showErrorAndDismiss:[responseObject objectForKey:@"error"]];
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorAndDismiss:[NSString stringWithFormat:@"%@",error]];
        
    }];
}


- (void)dataHandle:(NSArray *)dataArray {
    
    for (NSDictionary *dictionary in dataArray) {
        if (![self.dataArray containsObject:dictionary]) {
            [self.dataArray addObject:dictionary];
        }
    }
    [self.tableView reloadData];
}
#pragma mark UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DataTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    NSDictionary *dataDic = [self.dataArray objectAtIndex:indexPath.row];
    cell.contentLabel.text = [NSString stringWithFormat:@"%@：%@   %@",[dataDic objectForKey:@"description"],[dataDic objectForKey:@"value1"],[dataDic objectForKey:@"unit"]];
    cell.imageView.image = [UIImage imageNamed:[dataDic objectForKey:@"description"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
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
