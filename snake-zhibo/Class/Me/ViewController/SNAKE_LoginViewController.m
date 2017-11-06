//
//  SNAKE_LoginViewController.m
//  snake-zhibo
//
//  Created by Snake on 17/7/6.
//  Copyright © 2017年 Snake. All rights reserved.
//

#import "SNAKE_LoginViewController.h"
#import "UMSocial.h"
#import "SNAKE_UserHelper.h"
#import "SNAKE_TabBarViewController.h"

@interface SNAKE_LoginViewController ()

@end

@implementation SNAKE_LoginViewController

- (IBAction)sinaLogin:(id)sender
{
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            
          //  NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
           

            
            [SNAKE_UserHelper sharedUser].nickName = snsAccount.userName;
            [SNAKE_UserHelper sharedUser].iconUrl = snsAccount.iconURL;
            [SNAKE_UserHelper saveUser];  //保存入本地
            
            self.view.window.rootViewController = [[SNAKE_TabBarViewController alloc] init];

             
        } else {
            
            NSLog(@"登录失败");
        }
        
    });
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
