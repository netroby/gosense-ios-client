//
//  ViewController.m
//  gosense-ios-client
//
//  Created by HuZhiFeng on 15/11/19.
//  Copyright © 2015年 netroby. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *realData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *apiUrl = @"https://www.netroby.com/api?page=%@";
    NSString *realApiUrl = [NSString stringWithFormat:apiUrl, @"1"];
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    [[delegateFreeSession dataTaskWithURL: [NSURL URLWithString:realApiUrl]
                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                            NSLog(@"Got response %@ with error %@.\n", response, error);
                            NSLog(@"Data:\n%@\nEND Data\n",
                                  [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding]);
                            realData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                            NSLog(@"%@", realData);
                            NSLog(@"%@", [[realData objectAtIndex:0] objectForKey:@"title"]);
                            NSLog(@"%@", [[realData objectAtIndex:0] objectForKey:@"aid"]);
                            [self.tableView reloadData];
                            
                        }
      ] resume];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    }
    NSLog(@"%@", [[realData objectAtIndex:0] objectForKey:@"title"]);
    cell.textLabel.text = @"Demo";
    return  cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
