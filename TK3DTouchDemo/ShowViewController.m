//
//  ShowViewController.m
//  TK3DTouchDemo
//
//  Created by 翟宇 on 16/3/8.
//  Copyright © 2016年 翟宇. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()
@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    UIButton* returnBtn = [[UIButton alloc]init];
    returnBtn.frame = CGRectMake(20, 64, 200, 50);
    [returnBtn setTitle:@"点我回城" forState:UIControlStateNormal];
    [returnBtn addTarget:self action:@selector(backToBefore) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];
    // Do any additional setup after loading the view.
}

- (void)backToBefore {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    return @[
             [UIPreviewAction actionWithTitle:@"First button" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                 NSLog(@"button selected");
             }],

             [UIPreviewAction actionWithTitle:@"Second button" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                 NSLog(@"button selected 2");
             }]
             ];
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
