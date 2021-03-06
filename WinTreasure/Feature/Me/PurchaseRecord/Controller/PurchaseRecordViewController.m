//
//  PurchaseRecordViewController.m
//  WinTreasure
//
//  Created by Apple on 16/6/15.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "PurchaseRecordViewController.h"
#import "PurchaseHeader.h"
#import "PurchaseRecordCell.h"

@interface PurchaseRecordViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *layouts;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PurchaseRecordViewController

- (NSMutableArray *)layouts {
    if (!_layouts) {
        _layouts = [NSMutableArray array];
    }
    return _layouts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购买记录";
    [self setupPurchaseHeader];
    [self getData];
}

- (void)getData {
    for (int i=0; i<8; i++) {
        PurchaseRecordModel *model = [[PurchaseRecordModel alloc]init];
        PurchaseRecordLayout *layout = [[PurchaseRecordLayout alloc]initWithModel:model];
        [self.layouts addObject:layout];
    }
    [_tableView reloadData];
}

- (void)setupPurchaseHeader {
    PurchaseHeader *header = [PurchaseHeader puchaseHeader];
    [self.view addSubview:header];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.layouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PurchaseRecordCell *cell = [PurchaseRecordCell cellWithTableView:tableView];
    PurchaseRecordLayout *layout = _layouts[indexPath.row];
    [cell setLayOut:layout];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    PurchaseRecordLayout *layout = _layouts[indexPath.row];
    return layout.height;
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
