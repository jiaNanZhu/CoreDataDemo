//
//  ViewController.m
//  ZJNCoreDataDemo
//
//  Created by 朱佳男 on 2017/10/31.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Person+CoreDataClass.h"
#import "Card+CoreDataClass.h"
#import <CoreData/CoreData.h>
@interface ViewController ()
{
    AppDelegate *app;
    NSManagedObjectContext *context;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    context = app.persistentContainer.viewContext;
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
            [self coreDataChange];
            break;
        case 3:
            //查
            [self coreDataSelect];
            break;
        default:
            break;
    }
}
//添加用户
-(void)coreDataAdd{
    NSEntityDescription *personEntity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    Person *person = [[Person alloc]initWithEntity:personEntity insertIntoManagedObjectContext:context];
    person.name = [NSString stringWithFormat:@"商宇%d号员工",arc4random()%10];
    person.age = arc4random()%20;
    person.sex = 0;
    person.phone = [NSString stringWithFormat:@"18135697075"];
    
    NSEntityDescription *cardEntity = [NSEntityDescription entityForName:@"Card" inManagedObjectContext:context];
    Card *card1 = [[Card alloc]initWithEntity:cardEntity insertIntoManagedObjectContext:context];
    card1.cardNumber = [NSString stringWithFormat:@"%d",arc4random()%100];
    
    Card *card2 = [[Card alloc]initWithEntity:cardEntity insertIntoManagedObjectContext:context];
    card2.cardNumber = [NSString stringWithFormat:@"%d",arc4random()%100];
    
    [person addCardsObject:card1];
    [person addCardsObject:card2];
    
    [context insertObject:person];
    [context save:nil];
}
//删
-(void)coreDataDelete{
    NSEntityDescription *personEntity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:personEntity];
    NSPredicate *perdicate = [NSPredicate predicateWithFormat:@"name=%@",@"商宇2号员工"];
    [request setPredicate:perdicate];
    NSArray *array = [context executeFetchRequest:request error:nil];
    if (array.count) {
        for (Person *person in array) {
            [context deleteObject:person];
        }
        [context save:nil];
        NSLog(@"删除完毕");
    }else{
        NSLog(@"查无此人");
    }
}
//改
-(void)coreDataChange{
    NSEntityDescription *personEntity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:personEntity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@",@"商宇3号员工"];
    [request setPredicate:predicate];
    NSArray *array = [context executeFetchRequest:request error:nil];
    if (array.count) {
        for (Person *person in array) {
            person.name = @"朱佳男";
        }
        [context save:nil];
        NSLog(@"修改完成");
    }else{
        NSLog(@"查无此人");
    }

}
//查
-(void)coreDataSelect{
    NSEntityDescription *personEntity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:personEntity];
    NSArray *array = [context executeFetchRequest:request error:nil];
    if (array.count) {
        for (Person *person in array) {
            NSLog(@"%@",person.name);
            for (Card *card in person.cards) {
                NSLog(@"%@",card.cardNumber);
            }
        }
    }else{
        NSLog(@"尚未添加用户");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
