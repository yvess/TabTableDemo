/*
 * AppController.j
 * TabTableDemo
 *
 * Created by You on June 22, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "Person.j"
@import "TabTableView.j"


@implementation AppController : CPObject
{
    CPWindow        theWindow; //this "outlet" is connected automatically by the Cib
	CPMutableArray  persons;
	IBOutlet        CPArrayController personController;
	IBOutlet        TabTableView myTable;
}

-(id)init
{
	persons = [[CPMutableArray alloc] init];
	
	for (var i = 10 - 1; i >= 0; i--){
		// This is called when the application is done loading.
		var me = [[Person alloc] init];
		[me setValue:@"Peter" + i forKey:@"firstName"];
		[me setValue:@"Mueller" + i forKey:@"lastName"];
		[me setValue:@"test@test.com" + i forKey:@"email"];
		[me setValue:[CPNumber numberWithFloat:i]*10 forKey:@"age"];
		[persons addObject:me];
	};
	
	return self;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];
}

@end
