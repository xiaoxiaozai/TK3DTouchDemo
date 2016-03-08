//
//  ViewController.m
//  TK3DTouchDemo
//
//  Created by 翟宇 on 16/3/8.
//  Copyright © 2016年 翟宇. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewController.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate>
@property (nonatomic,strong)UIButton* clickBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.clickBtn = [[UIButton alloc]init];
    self.clickBtn.frame = CGRectMake(100, 200, 200, 50);
    self.clickBtn.backgroundColor = [UIColor blueColor];
    [self.clickBtn setTitle:@"touch me" forState:UIControlStateNormal];
    [self.view addSubview:self.clickBtn];
    //check if the device supports 3DTouch
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
    }
}


#pragma mark - Previewing delegate

- (UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    ShowViewController *detailVC = [[ShowViewController alloc]init];

    detailVC.preferredContentSize = CGSizeMake(0.0, 320.0);

    previewingContext.sourceRect = self.clickBtn.frame;

    return detailVC;
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
