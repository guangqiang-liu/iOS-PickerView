//
//  ViewController.m
//  WLPickerView
//
//  Created by 刘光强 on 2018/5/18.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "ViewController.h"
#import "WLPickerViewManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *dateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dateButton.frame = CGRectMake(100, 100, 100, 100);
    [dateButton setTitle:@"date" forState:UIControlStateNormal];
    [dateButton addTarget:self action:@selector(dateAction) forControlEvents:UIControlEventTouchUpInside];
    dateButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:dateButton];
    
    UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    selectButton.frame = CGRectMake(100, 200, 100, 100);
    [selectButton setTitle:@"select" forState:UIControlStateNormal];
    [selectButton addTarget:self action:@selector(selectAction) forControlEvents:UIControlEventTouchUpInside];
    selectButton.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:selectButton];
    
    UIButton *addressButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addressButton.frame = CGRectMake(100, 300, 100, 100);
    [addressButton setTitle:@"address" forState:UIControlStateNormal];
    [addressButton addTarget:self action:@selector(addressAction) forControlEvents:UIControlEventTouchUpInside];
    addressButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:addressButton];
    
}

- (void)dateAction {
    [WLPickerViewManager shareManger].datePicker.toolBar.cancelBarTintColor = [UIColor redColor];
    [WLPickerViewManager shareManger].datePicker.toolBar.titleBarTitle = @"选择日期";
    [WLPickerViewManager shareManger].datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    [[WLPickerViewManager shareManger] showDatePickerWithTitle:@"Chose your date of birth" cancelTitle:@"Cancel" commitTitle:@"Confirm" firstDate:nil minDate:nil maxDate:nil datePickerMode:UIDatePickerModeDate tag:1 commitBlock:^(NSDate *date) {
        
    } cancelBlock:^{
        
    }];
}

- (void)selectAction {
    [[WLPickerViewManager shareManger] showPickerViewWithCustomDataArray:@[@"1", @"2", @"3", @"4"] keyMapper:@"name" tag:1 title:@"选择英雄" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(id model) {
    } cancelBlock:^{
    }];
}

- (void)addressAction {
    [[WLPickerViewManager shareManger] showMOFSAddressPickerWithDefaultAddress:@"广西壮族自治区-玉林市-容县" title:@"选择地址" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(NSString *address, NSString *zipcode) {
    } cancelBlock:^{
        
    }];
}

@end
