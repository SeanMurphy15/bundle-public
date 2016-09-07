//
//  AppearanceController.swift
//  Bundle
//
//  Created by Sean Murphy on 5/16/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import UIKit


class AppearanceController {



}

extension UIColor {

    func darkGray() -> UIColor {

        let darkGray = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1.0)
        return darkGray
    }

    func lightGray() -> UIColor{

        let lightGray = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return lightGray
    }
}

extension UITableView {

    func darkTableView() -> UITableView{
    let tableView = UITableView()
    tableView.backgroundColor?.darkGray()
        tableView.separatorColor?.lightGray()

        return tableView
    }
}