//
//  EmployeeCellTableViewCell.m
//  Employee Project
//
//  Created by Ashish limje on 13/12/14.
//  Copyright (c) 2014 Ashish limje. All rights reserved.
//

#import "EmployeeCellTableViewCell.h"

@implementation EmployeeCellTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
