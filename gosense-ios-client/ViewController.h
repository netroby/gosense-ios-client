//
//  ViewController.h
//  gosense-ios-client
//
//  Created by HuZhiFeng on 15/11/19.
//  Copyright © 2015年 netroby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, NSURLConnectionDelegate>
{
    NSMutableData *_responseData;
    NSInteger *page;
}

@end

