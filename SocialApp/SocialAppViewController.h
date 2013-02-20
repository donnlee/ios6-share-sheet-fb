//
//  SocialAppViewController.h
//  SocialApp
//
//  Created by Donn Lee on 2/13/13.
//  Copyright (c) 2013 ploo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface SocialAppViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextView *postText;
@property (strong, nonatomic) IBOutlet UIImageView *postImage;

- (IBAction)selectImage:(id)sender;
- (IBAction)sendPost:(id)sender;
- (IBAction)hideKeyboard:(id)sender;



@end
