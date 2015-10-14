//
//  SliderViewController.m
//  qq仿
//
//  Created by hsbc on 15/7/14.
//  Copyright (c) 2015年 Zp. All rights reserved.
//

#import "SliderViewController.h"
#import "SliderHeaderView.h"
#import "SliderBottomView.h"

@interface SliderViewController ()<UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSetUp];
}
- (void)initSetUp {
    
    CGSize size = self.view.bounds.size;
    // 1:添加头部视图
    SliderHeaderView *sliderHeader = [SliderHeaderView sliderHeaderView];
    [self.view addSubview:sliderHeader];
    
    // 2:添加tableView
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(sliderHeader.frame), 280, 368);
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    // 3:添加底部视图
    SliderBottomView *sliderBottom = [SliderBottomView sliderBottomView];
    CGRect frame = sliderBottom.frame;
    frame.origin.y = size.height - 50;
    sliderBottom.frame = frame;
    sliderBottom.backgroundColor = [UIColor colorWithRed:38/255.0 green:41/255.0 blue:46/255.0 alpha:1.0];
    [self.view addSubview:sliderBottom];

}

#pragma mark - tableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.imageView.image = [UIImage imageNamed:@"sidebar_file"];
    cell.textLabel.text = @"测试";
    return cell;
}


@end
