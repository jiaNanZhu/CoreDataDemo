//
//  ViewController.m
//  CoreDataDemo3
//
//  Created by 朱佳男 on 2016/12/19.
//  Copyright © 2016年 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "ZJNRequestManager.h"
#import "PersonManager.h"
#import <CoreData/CoreData.h>
#import "Person+CoreDataClass.h"
@interface ViewController ()
{
    UITextField *textF;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestDataFromServer];
    [self creatView];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)requestDataFromServer{
    NSString *urlString = @"http://soft.dashouzhang.org/dsz/app/user/treeDept.json";
    NSDictionary *dic = @{@"parentId":@"",@"sessionId":@"8a22447a5914a363015915f096d60047",@"updatetime":@""};
    [ZJNRequestManager postWithUrlString:urlString parameters:dic success:^(id data) {
        NSLog(@"请求成功");
        NSArray *usersArray = data[@"data"][@"users"];
        for (NSDictionary *dic in usersArray) {
            [[PersonManager sharePersonManager]insertPersonWithDictionary:dic];
        }
    } failure:^(NSError *error) {
        NSLog(@"请求失败");
    }];
}
-(void)creatView{
    textF = [[UITextField alloc]initWithFrame:CGRectMake(30, 100, self.view.bounds.size.width-60, 40)];
    [self.view addSubview:textF];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 200, self.view.bounds.size.width-60, 40);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"查找" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)selectButtonClick:(UIButton *)button{
    if (textF.text.length == 0) {
        NSLog(@"请输入想要查找的人名");
        return;
    }
    NSArray *array = [[PersonManager sharePersonManager]selectPersonFromLocalWithName:textF.text];
    if (array.count) {
        
        Person *person = array[0];
        NSLog(@"%@的uid是%@",textF.text,person.uid);

    }else
    {
        NSLog(@"没有检索到数据");
    }
    
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
