//
//  ViewController.m
//  CoreDataDemo2
//
//  Created by 朱佳男 on 2016/12/14.
//  Copyright © 2016年 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Person+CoreDataClass.h"
#import <CoreData/CoreData.h>
@interface ViewController ()
{
    AppDelegate *app;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self creatButton];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)creatButton{
    NSArray *array = @[@"增",@"删",@"改",@"查"];
    for (int i = 0; i <4; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(30+i *60, 100, 40, 40);
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.tag = i ;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}
-(void)buttonClick:(UIButton *)button{
    switch (button.tag) {
        case 0:
            //增
            [self coreDataAdd];
            break;
        case 1:
            //删
            [self coreDataDelete];
            break;
        case 2:
            //改
            [self coreDataUpdate];
            break;
        case 3:
            //查
            [self coreDataSelect];
            break;
        default:
            break;
    }
}
-(void)coreDataAdd{
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
    person.name = [NSString stringWithFormat:@"花花%d",arc4random()%10];
    person.age = [[NSNumber numberWithInteger:15] integerValue];
    [app.persistentContainer.viewContext save:nil];
    
}
-(void)coreDataDelete{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@",@"花花8"];
    [request setPredicate:predicate];
    
    NSArray *array = [app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    if (array.count) {
        for (Person *person in array) {
            [app.persistentContainer.viewContext deleteObject:person];
        }
        [app.persistentContainer.viewContext save:nil];
        NSLog(@"删除完毕");
    }else
    {
        NSLog(@"没有检索到数据");
    }
}
-(void)coreDataUpdate{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name!=%@",@"朱佳男"];
    [request setPredicate:predicate];
    NSArray *array = [app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    if (array.count) {
        for (Person *person in array) {
            person.name = @"朱佳男";
        }
        [app.persistentContainer.viewContext save:nil];
        NSLog(@"朱佳男");
    }else
    {
        NSLog(@"无检索数据");
    }
}
-(void)coreDataSelect{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entity];
    NSArray *array = [app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    for (Person *person in array) {
        NSLog(@"%@",person.name);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
