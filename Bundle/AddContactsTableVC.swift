//
//  AddContactsTableVC.swift
//  Bundle
//
//  Created by Sean Murphy on 4/14/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class AddContactsTableVC: UITableViewController, UISearchResultsUpdating{

    var searchController: UISearchController!

    var contactsArray: [String] = ["Sean", "Misha", "Gio", "Zhen","Jake"]


    override func viewDidLoad() {
        super.viewDidLoad()

        setupSearchController()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!.lowercaseString

        let contactsSearchResultsTableVC = searchController.searchResultsController as! ContactsSearchResultsTableVC

        contactsSearchResultsTableVC.filteredContacts = contactsArray.filter({ $0.lowercaseString.containsString(searchTerm) })
        contactsSearchResultsTableVC.tableView.reloadData()
    }

    func setupSearchController() {
        let resultsViewController = UIStoryboard(name: "CreateBundle", bundle: nil).instantiateViewControllerWithIdentifier("contactsSearchResults")

        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.barTintColor = UIColor(red: 4/255, green: 197/255, blue: 255/255, alpha: 1.0)
        searchController.searchBar.alpha = 1.0
        searchController.searchBar.placeholder = "Search Users"
        searchController.hidesNavigationBarDuringPresentation = true

        definesPresentationContext = true
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactsArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath)

        cell.textLabel?.text = contactsArray[indexPath.row]

        return cell
    }



}
