//
//  PostCell.m
//  Objc0121
//
//  Created by 劉坤昶 on 2016/1/25.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
        [self.contentView addSubview:self.nameLabel];
        
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
