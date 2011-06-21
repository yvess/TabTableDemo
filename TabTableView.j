@import <AppKit/CPTableView.j>
@import <AppKit/CPTextField.j>

@implementation TabTableView : CPTableView
{
}

- (id)initWithCoder:(CPCoder)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self)
    {
        [self setAllowsColumnSelection:NO];
    }
    [[CPNotificationCenter defaultCenter] 
        addObserver:self 
        selector:@selector(textFieldFocused:) 
        name:CPTextFieldDidFocusNotification 
        object:nil];
    return self;
}

- (void)textFieldFocused:(CPNotification)aNotification {
    var currentTextField = [aNotification object];
    
    [[CPNotificationCenter defaultCenter] 
        addObserver:self 
        selector:@selector(textFieldBlured:) 
        name:CPTextFieldDidBlurNotification 
        object:currentTextField];
}

- (void)textFieldBlured:(CPNotification)aNotification {
    var currentTextField = [aNotification object];
    var columnNr = [self columnAtPoint:[currentTextField center]] + 1; // got the next column with +1
    var tableColumns = [self tableColumns];
    var selectedRow = [self selectedRow];
    if (columnNr >= [tableColumns count]) {
        columnNr = columnNr - 1; // stay at current column
    }
    [self editColumn:columnNr row:selectedRow withEvent:nil select:YES];
    [[CPNotificationCenter defaultCenter] 
        removeObserver:self 
        name:CPTextFieldDidBlurNotification 
        object:currentTextField];
}

@end