//
//  ViewController.m
//  NavigationBarAlpha
//
//  Created by Limingkai on 16/3/18.
//  Copyright © 2016年 ctbri. All rights reserved.
//

#import "ViewController.h"


static const NSInteger NavigationBarHeight  = 64.0f;

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray =[NSMutableArray arrayWithCapacity:50];
    for (NSInteger i = 0; i < 50;i++) {
        [_dataArray addObject:[NSString stringWithFormat:@"%ld",i]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offSetY = scrollView.contentOffset.y;
    if (offSetY < -NavigationBarHeight) {
        [self setNavigationBarAlpha:0.0f];
    } else {
        CGFloat alpha = (offSetY + NavigationBarHeight)/ NavigationBarHeight;
        [self setNavigationBarAlpha:alpha];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavigationBarAlpha:0.0f];
}


- (void)setNavigationBarAlpha:(CGFloat)alpha {
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    UIView *bgView = [navigationBar valueForKey:@"_backgroundView"];
    bgView.alpha = alpha;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}



@end
