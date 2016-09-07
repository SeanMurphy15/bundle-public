//
//  CreateBundleVC.swift
//  Bundle
//
//  Created by Sean Murphy on 4/13/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class CreateBundleVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate, UICollectionViewDelegateFlowLayout{


    @IBOutlet weak var enterButton: UIButton!

    @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("bundleNameCell", forIndexPath: indexPath) as! BundleNameCell
            cell.bundleNameTextField.becomeFirstResponder()

            
            cell.textFieldShouldReturn(cell.bundleNameTextField)
            return cell

        }

        if indexPath.item == 1 {

            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("priceTypeCell", forIndexPath: indexPath) as! PriceTypeCell
            cell.resignFirstResponder()
            return cell

        }

        if indexPath.item == 2 {


            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("perPersonCell", forIndexPath: indexPath) as! PerPersonCell
            cell.priceTextField.becomeFirstResponder()
            return cell

        }

        if indexPath.item == 3 {

            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("minimumPeopleCell", forIndexPath: indexPath) as! MinimumPeopleCell
            cell.minimumPeopleTextField.becomeFirstResponder()
            return cell

        }

        if indexPath.item == 4 {

            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("maximumPeopleCell", forIndexPath: indexPath) as! MaximumPeopleCell
            cell.maximumPeopleTextField.becomeFirstResponder()
            return cell
        }

        if indexPath.item == 5 {

            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("startDateCell", forIndexPath: indexPath) as! StartDateCell
            cell.dateTextField.placeholder = ResourceController.currentDate()
            cell.respondWithDatePicker()
            return cell

        }

        if indexPath.item == 6 {

            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("endDateCell", forIndexPath: indexPath) as! EndDateCell
            cell.dateTextField.placeholder = ResourceController.currentDate()
            cell.respondWithDatePicker()
            return cell

        } else {

            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("descriptionCell", forIndexPath: indexPath) as! DescriptionCell
            cell.descriptionTextView.becomeFirstResponder()
            return cell

        }


    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }



    @IBAction func enterButtonPressed(sender: AnyObject) {

        scrollToCell()


    }


    func scrollToCell(){

        let currentIndexPath = collectionView.indexPathsForVisibleItems()

        for cell in currentIndexPath{

            let currentIndex = cell.item

            let nextCell = currentIndex + 1

            let indexOfNextCell = NSIndexPath(forItem: nextCell, inSection: 0)

            if currentIndex < 7 {

                collectionView.scrollToItemAtIndexPath(indexOfNextCell, atScrollPosition: .CenteredHorizontally, animated: true)

            } else {

                performSegueWithIdentifier("toLocationVC", sender: nil)
            }
        }



    }


    }

    

