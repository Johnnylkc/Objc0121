//
//  ClassListCell.m
//  Objc0121
//
//  Created by 劉坤昶 on 2016/1/23.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "ClassListCell.h"

@implementation ClassListCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.classImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 120, 80)];
        self.classImage.contentMode = UIViewContentModeScaleAspectFill;
        self.classImage.clipsToBounds = YES;
        self.classImage.layer.cornerRadius = 5;
        [self.contentView addSubview:self.classImage];
        
    }
    
    return self;
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
