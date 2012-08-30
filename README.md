ISTabBar
========

Customizable UITabBar for iOS 5+

Here is a class to easily customize an UITabBar on iOS 5 onwards, by just changing a few parameters in a .plist file. It is very easy to use and it doesn't require any code to be written.

You can customize the following parameters in your TabBar:

    Background Image:   
    Selected Box Image:
    Default Image (for each item):
    Selected Image (for each item):
    Settings for the titles:
    Font family and size
    Vertical offset
    Text color
         Default
         Selected

How to personalize your own tab bar with ISTabBar

1 - FirstAdd the ISTabBar.h and ISTabBar.m files in your project.
2 - Add the ISTabBarSettings file in your project.
3 - Select the UITabBar item you wish to customize in the corresponding .xib file.

4 - In the Custom Class panel, set it to be ISTabBar, this will make this UITabBar inherit from our new class.

5 - Open ISTabBarSettings.plist and customize it as you see fit. You can see how ours looks below:

That's all! Run the app now and you should see the Tab Bar customized with the items you set for it in the .plist file.