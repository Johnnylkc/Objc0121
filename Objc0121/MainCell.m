//
//  MainCell.m
//  Objc0121
//
//  Created by 劉坤昶 on 2016/1/21.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.basicView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 355, 250)];
        self.basicView.backgroundColor = [UIColor whiteColor];
        self.basicView.layer.cornerRadius = 5;
        [self.contentView addSubview:self.basicView];
        
       
        self.bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 355, 170)];
        self.bigImage.contentMode = UIViewContentModeScaleAspectFill;
        self.bigImage.clipsToBounds = YES;
        [self.basicView addSubview:self.bigImage];
        
        
        self.bandName = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, 355, 20)];
        self.bandName.font = [UIFont systemFontOfSize:20];
        //self.bandName.backgroundColor = [UIColor orangeColor];
        self.bandName.textAlignment = NSTextAlignmentCenter;
        [self.basicView addSubview:self.bandName];
        
    
        
        
        [self autoLayout];
        
    }
    
    return self;
}



-(void)autoLayout
{
    [self.basicView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.bigImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.bandName setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *dic = @{@"basicView":self.basicView,@"bigImage":self.bigImage,@"bandName":self.bandName};
    
    ////basicView
    NSArray *basicViewH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[basicView]-10-|" options:0 metrics:nil views:dic];
    [self.contentView addConstraints:basicViewH];
    
    NSArray *basicViewV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[basicView]-10-|" options:0 metrics:nil views:dic];
    [self.contentView addConstraints:basicViewV];
    
    
    ////bigImage
    NSArray *bigImageH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bigImage(basicView)]|" options:0 metrics:nil views:dic];
    [self.contentView addConstraints:bigImageH];
    
    NSArray *bigImageV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[bigImage(170)]" options:0 metrics:nil views:dic];
    [self.contentView addConstraints:bigImageV];
    
    
    ////bandName
    NSArray *bandNameH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bandName(basicView)]|" options:0 metrics:nil views:dic];
    [self.contentView addConstraints:bandNameH];
    
    NSArray *bandNameV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[bigImage]-5-[bandName(20)]" options:0 metrics:nil views:dic];
    [self.contentView addConstraints:bandNameV];
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
