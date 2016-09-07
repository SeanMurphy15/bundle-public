//
//  ToolBar.swift
//  Bundle
//
//  Created by Sean Murphy on 4/27/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation


class Toolbar: UITabBar{

    let toolBar = UIToolbar()
    toolBar.barStyle = UIBarStyle.Default
    toolBar.translucent = true
    let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "doneDatePickerPressed")

    // if you remove the space element, the "done" button will be left aligned
    // you can add more items if you want
    toolBar.setItems([space, doneButton], animated: false)
    toolBar.userInteractionEnabled = true
    toolBar.sizeToFit()
}