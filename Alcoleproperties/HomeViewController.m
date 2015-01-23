//
//  HomeViewController.m
//  Alcoleproperties
//
//  Created by Mac on 23/01/15.
//  Copyright (c) 2015 alcoleproperties. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColor+HexColor.h"
#import "CommunityViewController.h"


@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    CGRect mainFrame;
    NSArray *SearchparamObject;
}
@property (nonatomic,retain) UITableView *BookingTable;
@property (nonatomic,retain) NSMutableArray *BookingDataArray;
@property (nonatomic,retain) UIActivityIndicatorView *MainActivity;
@end

@implementation HomeViewController
int BookingListWebAlertTag = 9658;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        mainFrame = [[UIScreen mainScreen] bounds];
        self.view.layer.frame = CGRectMake(0, 0, mainFrame.size.width, mainFrame.size.height);
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:[self UIViewSetHeaderViewWithbackButton:NO]];
    [self.view addSubview:[self UIViewSetFooterView]];
    
    /**
     *  TableView Decleration
     */
    
    _BookingTable = [[UITableView alloc] initWithFrame:CGRectMake(5, 50,mainFrame.size.width-10, mainFrame.size.height-110)];
    [_BookingTable setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_BookingTable];
    [_BookingTable setDataSource:self];
    [_BookingTable setSeparatorColor:[UIColor clearColor]];
    [_BookingTable setDelegate:self];
    [_BookingTable setBounces:YES];
    [_BookingTable setHidden:YES];
    
    _MainActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGRect frame = _MainActivity.frame;
    frame.origin.x = mainFrame.size.width / 2 - frame.size.width / 2;
    frame.origin.y = mainFrame.size.height / 2 - frame.size.height / 2;
    _MainActivity.frame = frame;
    [_MainActivity setColor:[UIColor colorFromHex:0xe66a4c]];
    [_MainActivity startAnimating];
    [self.view addSubview:_MainActivity];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [_MainActivity stopAnimating];
            [_BookingTable setHidden:NO];
        });
    });
}

#pragma tableview datasource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"tableView width %f",tableView.layer.frame.size.width);
    UITableViewCell *mainTableCell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, tableView.layer.frame.size.width-10, 150)];
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(1, 1, tableView.layer.frame.size.width-2, 140)];
    [backgroundView setBackgroundColor:[UIColor colorFromHex:0xffffff]];
    [backgroundView.layer setBorderColor:[UIColor colorFromHex:0xdbdbdb].CGColor];
    [backgroundView.layer setCornerRadius:2.0f];
    [backgroundView.layer setBorderWidth:1.0f];
    [mainTableCell addSubview:backgroundView];
    
    UIButton *MakeAsDefaultButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 104, 100, 30)];
    [MakeAsDefaultButton setBackgroundColor:[UIColor clearColor]];
    [MakeAsDefaultButton.layer setBorderColor:[UIColor colorFromHex:0xdbdbdb].CGColor];
    [MakeAsDefaultButton.layer setBorderWidth:1.0f];
    [MakeAsDefaultButton addTarget:self action:@selector(MakeAsDefault:) forControlEvents:UIControlEventTouchUpInside];
    [MakeAsDefaultButton setTitleColor:[UIColor colorFromHex:0xe66a4c] forState:UIControlStateNormal];
    [MakeAsDefaultButton setTitle:@"Make As Defalut" forState:UIControlStateNormal];
    [MakeAsDefaultButton.titleLabel setFont:[UIFont fontWithName:@"Arial" size:12.0f]];
    [backgroundView addSubview:MakeAsDefaultButton];
    
    UIButton *DetailsButton = [[UIButton alloc] initWithFrame:CGRectMake(tableView.layer.frame.size.width-107,  104, 100, 30)];
    [DetailsButton setBackgroundColor:[UIColor clearColor]];
    [DetailsButton.layer setBorderColor:[UIColor colorFromHex:0xdbdbdb].CGColor];
    [DetailsButton.layer setBorderWidth:1.0f];
    [DetailsButton setTitleColor:[UIColor colorFromHex:0xe66a4c] forState:UIControlStateNormal];
    [DetailsButton setTitle:@"Details" forState:UIControlStateNormal];
    [DetailsButton addTarget:self action:@selector(Details:) forControlEvents:UIControlEventTouchUpInside];
    [DetailsButton.titleLabel setFont:[UIFont fontWithName:@"Arial" size:12.0f]];
    [backgroundView addSubview:DetailsButton];
    
    UIView *FooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 98, tableView.layer.frame.size.width-2, 1)];
    [FooterView setBackgroundColor:[UIColor colorFromHex:0xe3e5e8]];
    [backgroundView addSubview:FooterView];
    
    return mainTableCell;
}

-(IBAction)MakeAsDefault:(id)sender
{
    NSLog(@"MakeAsDefault");
    CommunityViewController *Community =[[CommunityViewController alloc] init];
    [self GotoDifferentViewWithAnimation:Community];
}

-(IBAction)Details:(id)sender
{
    NSLog(@"Details");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma tableview delegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
