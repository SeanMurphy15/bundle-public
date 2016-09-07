//
//  Notification.swift
//  Bundle
//
//  Created by Sean Murphy on 4/26/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation


class Notification{

    var invitedToUserGroup : Bool
    var invitedToBundleEvent : Bool
    var paymentSent : Bool
    var paymentReceived : Bool

    init?(invitedToUserGroup : Bool, invitedToBundleEvent : Bool, paymentSent : Bool, paymentReceived : Bool){

        self.invitedToUserGroup = invitedToUserGroup
        self.invitedToBundleEvent = invitedToBundleEvent
        self.paymentSent = paymentSent
        self.paymentReceived = paymentReceived


    }


}