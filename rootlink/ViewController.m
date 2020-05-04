//
//  ViewController.m
//  rootlink
//
//  Copyright © 2018年 rootlink. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Toast.h"
#import "MJHAFNetworking.h"
#import "MJHCategoriesHeader.h"
#import "DataViewController.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *acountTf;
@property (strong, nonatomic) IBOutlet UITextField *passwordTf;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
//    DataViewController *controller = [[DataViewController alloc] init];
//    controller.navigationItem.title  = @"获取设备信息";
//    controller.sensorId = @"fa8ffe19-c5be-4519-86f9-c7f3f7ea4de9";
//    [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark --
//登录
-(IBAction)login{
    if ([self.acountTf.text isEqualToString:@""]) {
        [self.view makeToast:@"请输入账号" duration:2 position:CSToastPositionCenter];
    }else if ([self.passwordTf.text isEqualToString:@""]){
        [self.view makeToast:@"请输入密码" duration:2 position:CSToastPositionCenter];
    }else{
        //开始请求
        [SVProgressHUD show];
        NSString *urlString = @"http://www.rootlink.cn/api/login";
        NSMutableDictionary *muParameterDic = [NSMutableDictionary dictionary];
        [muParameterDic setObject:self.acountTf.text forKey:@"username"];
        [muParameterDic setObject:self.passwordTf.text forKey:@"password"];
        [muParameterDic setObject:@"false" forKey:@"rememberMe"];

        [[MJHAFNetworking shareMJHAFNetworking]MJHPost:[urlString stringToUTF8String] parameter:muParameterDic  timeOutInterval:30 success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([[responseObject objectForKey:@"status"] longValue] == 200) {
                [SVProgressHUD showSuccessAndDismiss:@"success"];
                [self setCookie:[responseObject objectForKey:@"msg"] ];
                DataViewController *controller = [[DataViewController alloc] init];
                controller.navigationItem.title  = @"获取设备信息";
                [self.navigationController pushViewController:controller animated:YES];
            }else{
                [SVProgressHUD showErrorAndDismiss:[responseObject objectForKey:@"error"]];

            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [SVProgressHUD showErrorAndDismiss:[NSString stringWithFormat:@"%@",error]];

        }];
        
    }
}

- (void)setCookie:(NSDictionary *)requestSerializer {
    // 创建一个可变字典存放cookie
    NSMutableDictionary *fromappDict = [NSMutableDictionary dictionary];
    [fromappDict setObject:[requestSerializer objectForKey:@"LoginToken"] forKey:@"LoginToken"];
    [fromappDict setObject:[requestSerializer objectForKey:@"token"] forKey:@"token"];
    [fromappDict setObject:[requestSerializer objectForKey:@"userId"] forKey:@"userId"];
    [fromappDict setObject:[requestSerializer objectForKey:@"key"] forKey:@"key"];
    [[NSUserDefaults standardUserDefaults] setObject: fromappDict forKey:@"loginData"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [fromappDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        // 设定 cookie
        NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:
                                [NSDictionary dictionaryWithObjectsAndKeys:
                                 key,NSHTTPCookieName,
                                 obj,NSHTTPCookieValue,
                                 nil]];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        
    }];
    NSData * cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey:@"cookie"];
    [defaults synchronize];
    
   
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
    self.acountTf.text = @"";
    self.passwordTf.text = @"";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
