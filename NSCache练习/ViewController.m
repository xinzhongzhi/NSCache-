//
//  ViewController.m
//  NSCache练习
//
//  Created by 辛忠志 on 2017/9/5.
//  Copyright © 2017年 辛忠志. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSCacheDelegate>
@property (strong,nonatomic)NSCache * cache;
@end

@implementation ViewController
#pragma mark - ---------- Lazy Loading（懒加载） ----------

#pragma mark - ----------   Lifecycle（生命周期） ----------
- (void)viewDidLoad {
    [super viewDidLoad];
    /*缓存大小*/
    self.cache = [[NSCache alloc]init];
    self.cache.totalCostLimit = 5;
    self.cache.delegate = self;
    NSLog(@"%@",self.cache.name);
    NSLog(@"%@",self.cache);
}
#pragma mark - ---------- Private Methods（私有方法） ----------

#pragma mark initliaze data(初始化数据)

#pragma mark config control（布局控件）

#pragma mark networkRequest (网络请求)

#pragma mark actions （点击事件）

#pragma mark IBActions （点击事件xib）
- (IBAction)addCache:(UIButton *)sender {
    
    for (int i = 1; i<10; i++) {
        // 在缓存中设置指定键名对应的值，并且指定回收成本，以便进行计算存储在缓存中对象的总成本，当出现内存警告或者超出总成本时，缓存就会进行删除部分元素的操作。
        NSString *str = [NSString stringWithFormat:@"在这里进行了存储数据%@",@(i)];
        [self.cache setObject:str forKey:@(i) cost:1];
    }
    
//    // NSCache的Key只是对对象进行了Strong引用，而非拷贝，
//    NSString *str = [NSString stringWithFormat:@"在这里进行了存储数据"];
//    for (int i = 0 ; i < 10 ; i++) {
//        // 设置成本数为1
//        [self.cache setObject:str forKey:@(i) cost:0];
//        NSLog(@"存储数据----%@",@(i));
//    }
}
- (IBAction)checkCache:(UIButton *)sender {
    NSLog(@"---------------------------------------------");
    for (int i = 0; i < 10 ; i++) {
        NSString *str = [self.cache objectForKey:@(i)];
        if (str) {
            NSLog(@"取出缓存中存储的数据-----%@",@(i));
        }
    }
}
- (IBAction)cleanCache:(UIButton *)sender {
    [self.cache removeAllObjects];
    NSLog(@"清理缓存");
}
#pragma mark - NSCacheDelegate
// 即将回收对象的时候进行调用，实现代理方法之前要遵守NSCacheDelegate协议。
- (void)cache:(NSCache *)cache willEvictObject:(id)obj{
    NSLog(@"回收--------%@",obj);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
