//
//  DetailCell.m
//  Objc0121
//
//  Created by 劉坤昶 on 2016/1/22.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "DetailCell.h"

@implementation DetailCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 300)];
        self.topImage.contentMode = UIViewContentModeScaleAspectFit;
        self.topImage.clipsToBounds = YES;
        [self.contentView addSubview:self.topImage];
        
        self.bandName = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
        self.bandName.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:self.bandName];
        
        
    }
    
    
    
    return  self;
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
