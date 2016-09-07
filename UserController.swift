//
//  UserController.swift
//  Bundle
//
//  Created by Sean Murphy on 4/20/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper


class UserController{

	static var sharedInstance = UserController()
	static var authToken = "Bearer \(UserController.sharedInstance.fetchCurrentUserAuthToken()!)"
	static var baseURL = "http://api-bundle-dev.azurewebsites.net"
	static let headers = ["Authorization": authToken, "Content-Type": "application/json"]

	// MARK: - LOGIN USER

	static func loginUser(email: String, password: String, completion:(success: Bool,  messageTitle: String, message: String, authToken: String?)->Void){

		if let parameters: [String:AnyObject]? = ["email": email,"password": password] {

			Alamofire.request(.POST, "\(baseURL)/auth/login", parameters: parameters, encoding: .JSON, headers: nil).validate().responseJSON { (response) in

				if response.result.isFailure {

					print("FAILED TO LOGIN USER")
					completion(success: false, messageTitle: "Failed to Login", message: "Unable to login with these credentials. Please try again.", authToken : nil)

				} else {

					let json = JSON(response.result.value!)

					if let authToken = json["authToken"].string{

						LocalDataController.saveLocalString(authToken, key: "authToken")
						print("CURRENT AUTH TOKEN: \(authToken)")
						completion(success: true, messageTitle: "", message: "", authToken: authToken)
					}

				}
			}
		}
	}

	// MARK: - REGISTER USER

	static func registerUser(email: String, password: String, confirmPassword: String, termsAndConditions: Bool, completion:(success: Bool, messageTitle: String, message: String)->Void){

		ParameterController.prepareRegisterUserPOSTParameters(email, password: password, confirmPassword: confirmPassword, termsAndConditions: termsAndConditions) { (success, registrationParameters, messageTitle, message) in

			if success {

				Alamofire.request(.POST, "\(baseURL)/auth/register", parameters: registrationParameters, encoding: .JSON).validate().responseJSON { (response) in

					if response.result.isFailure{

						completion(success: false, messageTitle: "Error", message: "There seems to be problem. Please check your connection or try again.")

					} else {

						completion(success: true, messageTitle: messageTitle, message: message)
					}
				}


			} else {

				completion(success: false, messageTitle: messageTitle, message: message)
			}
		}
	}


	// MARK: - FETCH USER LINK STATUS

	static func fetchUserLinkStatus(completion:(google: Bool, facebook: Bool)->Void){

		Alamofire.request(.GET, "\(baseURL)/user/linked", headers: headers).validate()
			.responseJSON { response in

				if response.result.isFailure {
					print("THERE WAS AN ERROR WITH THE REQUEST")

				} else {

					let json = JSON(response.result.value!)

					if let google = json["google"].bool{

						if google == false {

							completion(google: false, facebook: false)

						} else {

							completion(google: true, facebook: false)

						}
					}

					if let facebook = json["facebook"].bool{

						if facebook == false {

							completion(google: false, facebook: false)

						} else {

							completion(google: false, facebook: true)

						}
					}
				}
		}
	}

	// MARK: - FETCH CURRENT USER AUTHTOKEN

	func fetchCurrentUserAuthToken() -> String?{

		if let authToken = LocalDataController.loadLocalString("authToken"){

			return authToken
		}

		return nil
	}

	// MARK: - FETCH ASSOCIATED USERS

	static func fetchAssociatedUsers(completion:(success:Bool, user: User?)->Void){

		Alamofire.request(.GET, "\(baseURL)/user/associated/users", headers: headers).validate()
			.responseJSON { response in

				var dataDictionary : [String: AnyObject?] = [:]

				if response.result.isFailure{

					print("FAILED TO GET ASSOCIATED USERS")
					debugPrint(response)
					completion(success: false, user: nil)

				} else {
					var object = 0
					let resultCount = response.result.value?.count
					let json = JSON(response.result.value!)

					while object < resultCount{

						if let id = json[object]["id"].int{

							dataDictionary.updateValue(id, forKey: "id")
						} else{

							dataDictionary.updateValue(nil, forKey: "id")
						}

						if let email = json[object]["email"].string{

							dataDictionary.updateValue(email, forKey: "email")
						} else{

							dataDictionary.updateValue("", forKey: "email")
						}

						if let imageUrl = json[object]["imageUrl"].string{

							dataDictionary.updateValue(imageUrl, forKey: "imageUrl")
						} else{

							dataDictionary.updateValue("", forKey: "imageUrl")
						}

						if let firstName = json[object]["firstName"].string{

							dataDictionary.updateValue(firstName, forKey: "firstName")
						} else{

							dataDictionary.updateValue("", forKey: "firstName")
						}

						if let lasName = json[object]["lasName"].string{

							dataDictionary.updateValue(lasName, forKey: "lasName")
						} else{

							dataDictionary.updateValue("", forKey: "lasName")
						}

						if let gender = json[object]["gender"].string{

							dataDictionary.updateValue(gender, forKey: "gender")
						} else{

							dataDictionary.updateValue("", forKey: "gender")
						}

						if let gender = json[object]["gender"].string{

							dataDictionary.updateValue(gender, forKey: "gender")
						} else{

							dataDictionary.updateValue("", forKey: "gender")
						}

						if let birthDate = json[object]["birthDate"].string{

							dataDictionary.updateValue(birthDate, forKey: "birthDate")
						} else{

							dataDictionary.updateValue("", forKey: "birthDate")
						}

						if let phoneNumber = json[object]["phoneNumber"].string{

							dataDictionary.updateValue(phoneNumber, forKey: "phoneNumber")
						} else{

							dataDictionary.updateValue("", forKey: "phoneNumber")
						}

						if let facebookAccessToken = json[object]["facebookAccessToken"].string{

							dataDictionary.updateValue(facebookAccessToken, forKey: "facebookAccessToken")
						} else{

							dataDictionary.updateValue("", forKey: "facebookAccessToken")
						}

						if let googlePlusAccessToken = json[object]["googlePlusAccessToken"].string{

							dataDictionary.updateValue(googlePlusAccessToken, forKey: "googlePlusAccessToken")
						} else{

							dataDictionary.updateValue("", forKey: "googlePlusAccessToken")
						}

						if let user = User(id: dataDictionary["id"] as! Int,
							email: dataDictionary["email"] as! String,
							imageUrl: dataDictionary["imageUrl"] as? String,
							firstName: dataDictionary["firstName"] as? String,
							lastName: dataDictionary["lastName"] as? String,
							gender: dataDictionary["gender"] as? String,
							birthDate: dataDictionary["birthDate"] as? String,
							phoneNumber: dataDictionary["phoneNumber"] as? String,
							facebookAccessToken: dataDictionary["facebookAccessToken"] as? String,
							googlePlusAccessToken: dataDictionary["googlePlusAccessToken"] as? String){

							completion(success: true, user: user)

							object += 1


							if object == resultCount{

								print("\(object) ASSOCIATED USERS FETCHED")
							}

						} else {

							completion(success: false, user: nil)
						}

					}
				}
		}
	}



	//MARK: - FETCH CURRENT USER

	static func fetchCurrentUser(completion:(success:Bool, user: User?)->Void){

		Alamofire.request(.GET, "\(baseURL)/user", headers: headers).validate()
			.responseJSON { response in

				var dataDictionary : [String: AnyObject?] = [:]

				if response.result.isFailure{

					print("UNABLE TO TO FETCH USER. A NETWORK ERROR MAY HAVE OCCURRED")
					completion(success: false, user: nil)

				} else {
					let json = JSON(response.result.value!)


					if let id = json["id"].int{

						dataDictionary.updateValue(id, forKey: "id")
					} else{

						dataDictionary.updateValue(nil, forKey: "id")
					}

					if let email = json["email"].string{

						dataDictionary.updateValue(email, forKey: "email")
					} else{

						dataDictionary.updateValue(nil, forKey: "email")
					}

					if let imageUrl = json["imageUrl"].string{

						dataDictionary.updateValue(imageUrl, forKey: "imageUrl")
					} else{

						dataDictionary.updateValue(nil, forKey: "imageUrl")
					}

					if let firstName = json["firstName"].string{

						dataDictionary.updateValue(firstName, forKey: "firstName")
					} else{

						dataDictionary.updateValue(nil, forKey: "firstName")
					}

					if let lastName = json["lastName"].string{

						dataDictionary.updateValue(lastName, forKey: "lastName")
					} else{

						dataDictionary.updateValue(nil, forKey: "lastName")
					}

					if let gender = json["gender"].string{

						dataDictionary.updateValue(gender, forKey: "gender")
					} else{

						dataDictionary.updateValue(nil, forKey: "gender")
					}

					if let gender = json["gender"].string{

						dataDictionary.updateValue(gender, forKey: "gender")
					} else{

						dataDictionary.updateValue(nil, forKey: "gender")
					}

					if let birthDate = json["birthDate"].string{

						dataDictionary.updateValue(birthDate, forKey: "birthDate")
					} else{

						dataDictionary.updateValue(nil, forKey: "birthDate")
					}

					if let phoneNumber = json["phoneNumber"].string{

						dataDictionary.updateValue(phoneNumber, forKey: "phoneNumber")
					} else{

						dataDictionary.updateValue(nil, forKey: "phoneNumber")
					}

					if let facebookAccessToken = json["facebookAccessToken"].string{

						dataDictionary.updateValue(facebookAccessToken, forKey: "facebookAccessToken")
					} else{

						dataDictionary.updateValue(nil, forKey: "facebookAccessToken")
					}

					if let googlePlusAccessToken = json["googlePlusAccessToken"].string{

						dataDictionary.updateValue(googlePlusAccessToken, forKey: "googlePlusAccessToken")
					} else{

						dataDictionary.updateValue(nil, forKey: "googlePlusAccessToken")
					}

					print(dataDictionary)
					if let user = User(id: dataDictionary["id"] as! Int,
						email: dataDictionary["email"] as! String,
						imageUrl: dataDictionary["imageUrl"] as? String,
						firstName: dataDictionary["firstName"] as? String,
						lastName: dataDictionary["lastName"] as? String,
						gender: dataDictionary["gender"] as? String,
						birthDate: dataDictionary["birthDate"] as? String,
						phoneNumber: dataDictionary["phoneNumber"] as? String,
						facebookAccessToken: dataDictionary["facebookAccessToken"] as? String,
						googlePlusAccessToken: dataDictionary["googlePlusAccessToken"] as? String){

						completion(success: true, user: user)
					} else {

						completion(success: false, user: nil)
						print("UNABLE TO TO FETCH USER")
					}


				}
		}
	}


	//MARK: - FETCH USER NOTIFICATIONS


	static func fetchUserNotifications(completion:(success:Bool, notification: Notification?)->Void){

		Alamofire.request(.GET, "\(baseURL)/user/notifications", headers: headers).validate().responseJSON { (response) in

			var dataDictionary : [String:Bool] = [:]

			if response.result.isFailure{

				completion(success: false, notification: nil)
				print("FAILED TO GET USER NOTIFICATIONS")

			} else {

				let json = JSON(response.result.value!)

				if let invitedToUserGroup = json["invitedToUserGroup"].bool{
					dataDictionary.updateValue(invitedToUserGroup, forKey: "invitedToUserGroup")
				} else if json["invitedToUserGroup"].boolValue == false {
					dataDictionary.updateValue(false, forKey: "invitedToUserGroup")
				}
				if let invitedToBundleEvent = json["invitedToBundleEvent"].bool{
					dataDictionary.updateValue(invitedToBundleEvent, forKey: "invitedToBundleEvent")
				} else if json["invitedToBundleEvent"].boolValue == false {
					dataDictionary.updateValue(false, forKey: "invitedToBundleEvent")
				}
				if let paymentSent = json["paymentSent"].bool{
					dataDictionary.updateValue(paymentSent, forKey: "paymentSent")
				} else if json["paymentSent"].boolValue == false {
					dataDictionary.updateValue(false, forKey: "paymentSent")
				}
				if let paymentReceived = json["paymentReceived"].bool{
					dataDictionary.updateValue(paymentReceived, forKey: "paymentReceived")
				} else if json["paymentReceived"].boolValue == false {
					dataDictionary.updateValue(false, forKey: "paymentReceived")
				}

				if let notification = Notification(invitedToUserGroup: dataDictionary["invitedToUserGroup"]!,
					invitedToBundleEvent: dataDictionary["invitedToBundleEvent"]!,
					paymentSent: dataDictionary["paymentSent"]!,
					paymentReceived: dataDictionary["paymentReceived"]!){

					completion(success: true, notification: notification)

				} else {

					completion(success: false, notification: nil)
					print("UNABLE TO TO FETCH USER NOTIFICATIONS")

				}
			}
		}

	}


//	//MARK: - FETCH USER DEBIT CARDS
//
//	static func fetchUserDebitCards(completion:(success: Bool, debitCards: DebitCard?)->Void){
//
//		Alamofire.request(.GET, "\(baseURL)/user/commercemethod?isCollection=true", encoding: .JSON, headers: headers).validate().responseArray { (response: Response<[DebitCard], NSError>) in
//
//			if response.result.isFailure{
//
//				completion(success: false, debitCards: nil)
//
//			} else {
//
//				if let debitCards = response.result.value{
//
//					for debitCard in debitCards {
//
//						if debitCard.financialType == 0 {
//
//							completion(success: true, debitCards: debitCard)
//
//						}
//					}
//				}
//			}
//		}
//	}

	//MARK: - FETCH USER CREDIT CARDS

	static func fetchUserCards(completion:(success: Bool, cards: Card?)->Void){

		Alamofire.request(.GET, "\(baseURL)/user/commercemethod", encoding: .JSON, headers: headers).validate().responseArray { (response: Response<[Card], NSError>) in

			if response.result.isFailure{

				completion(success: false, cards: nil)

			} else {

				if let cards = response.result.value{

					for card in cards {


							completion(success: true, cards: card)

						
					}
				}
			}
		}
	}

	//MARK: - FETCH USER BANK ACCOUNTS

	static func fetchUserBankAccounts(completion:(success: Bool, bankAccounts: BankAccount?)->Void){

		Alamofire.request(.GET, "\(baseURL)/user/commercemethod?isCollection=true", encoding: .JSON, headers: headers).validate().responseArray { (response: Response<[BankAccount], NSError>) in

			if response.result.isFailure{

				completion(success: false, bankAccounts: nil)

			} else {

				if let bankAccounts = response.result.value{

					for bankAccount in bankAccounts {

						if bankAccount.financialType == 2 {

							completion(success: true, bankAccounts: bankAccount)

						}
					}
				}
			}
		}
	}


	//MARK: - UPDATE USER

	static func updateUser(id: Int, firstName: String, lastName: String, gender: String?, birthDate: String?, phoneNumber: String?, completion:(success: Bool, messageTitle: String, message: String)->Void){

		ParameterController.prepareUserPUTParameters(id, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, phoneNumber: phoneNumber) { (success, user, messageTitle, message) in

			if success {

				Alamofire.request(.PUT, "\(baseURL)/user", parameters: user, encoding: .JSON, headers: headers).validate().responseJSON { (response) in

					if response.result.isFailure{

						debugPrint(response)

						completion(success: false, messageTitle: "Oops!", message: "There seems to be a problem. Please try again or check your settings.")

					} else {

						completion(success: true, messageTitle: messageTitle, message: message)
					}
				}

			} else {

				completion(success: false, messageTitle: messageTitle, message: message)

			}
		}

	}

	//MARK: - POST USER COMMERCE METHOD

	static func postUserCommerceMethod(name: String, number: String, cvc: String, expirationMonth: String, expirationYear: String, currency: String, type: String, ipAddress: String, country: String, isDebit: Bool, completion:(success: Bool, messageTitle: String, message: String)->Void){

		ParameterController.prepareUserCommerceMethodPOSTParameters(name, number: number, cvc: cvc, expirationMonth: expirationMonth, expirationYear: expirationYear, currency: currency, type: type, ipAddress: ipAddress, country: country, isDebit: isDebit) { (success, commerceMethod, messageTitle, message) in

			if success {

				Alamofire.request(.POST, "\(baseURL)/user/commercemethod", parameters: commerceMethod, encoding: .JSON, headers: headers).validate().responseJSON { (response) in

					if response.result.isFailure{

						completion(success: false, messageTitle: "Error", message: "There seems to be a problem. Please check your network settings or try again.")

					} else {

						completion(success: true, messageTitle: messageTitle, message: message)

					}
				}

			} else {

				completion(success: false, messageTitle: messageTitle, message: message)
			}
		}
	}


	//MARK: - UPDATE USER COMMERCE METHOD

	static func updateUserCommerceMethod(id: Int?, name: String, expirationMonth: String, expirationYear: String, isPaymentDefault: Bool, isCollectionDefault: Bool, completion:(success: Bool, messageTitle: String, message: String)->Void){

		ParameterController.prepareUserCommerceMethodPUTParameters(id, name: name, expirationMonth: expirationMonth, expirationYear: expirationYear, isPaymentDefault: isPaymentDefault, isCollectionDefault: isCollectionDefault) { (success, commerceMethod, messageTitle, message) in

			if success {

				Alamofire.request(.PUT, "\(baseURL)/user/commercemethod", parameters: commerceMethod, encoding: .JSON, headers: headers).validate().responseJSON { (response) in

					if response.result.isFailure{

						completion(success: false, messageTitle: "Error", message: "There seems to be a problem. Please check your network settings or try again.")

					} else {

						completion(success: true, messageTitle: messageTitle, message: message)
					}
				}
			} else {

				completion(success: false, messageTitle: messageTitle, message: message)
			}
		}


	}

//	static func updateUserDebitCard(id: Int, name: String?, expirationMonth: String?, expirationYear: String?, isPaymentDefault: Bool?, isCollectionDefault: Bool?, completion:(success: Bool)->Void){
//		let debitCard = DebitCard(id: id, name: name, expirationMonth: expirationMonth, expirationYear: expirationYear, isPaymentDefault: isPaymentDefault, isCollectionDefault: isCollectionDefault)
//
//		let parameters = Mapper().toJSON(debitCard)
//
//		Alamofire.request(.POST, "\(baseURL)/user/commercemethod", parameters: parameters, encoding: .JSON, headers: headers).validate().responseJSON { (response) in
//
//			if response.result.isFailure{
//				completion(success: false)
//			} else {
//				completion(success: true)
//
//			}
//		}
//	}

	//MARK: - DELETE COMMERCE METHOD BY ID

	static func deleteCommerceMethodByID(commerceMethodID: Int?, completion:(success: Bool, messageTitle: String, message: String)->Void){

		if let id = commerceMethodID {

			Alamofire.request(.DELETE, "\(baseURL)/user/commercemethod/\(id)", encoding: .JSON, headers: headers).validate().responseJSON { (response) in

				if response.result.isFailure{

					completion(success: false, messageTitle: "Error", message: "Unable to delete account.")

				} else {

					completion(success: true, messageTitle: "Success!", message: "Account has been successfully deleted.")
				}
			}
		} else {

			completion(success: false, messageTitle: "Oops!", message: "There seems to be a problem. Please try again.")
		}

	}



	//MARK: - EMAIL USER PASSWORD RESET TOKEN

	static func emailUserPasswordToken(email: String, completion:(success: Bool, messageTitle: String, message: String)-> Void){

		let email = email.stringByReplacingOccurrencesOfString("@", withString: "%40")

		Alamofire.request(.GET, "\(baseURL)/auth/passwordreset?email=\(email)", encoding: .JSON).validate().responseJSON { (response) in

			if response.result.isFailure{

				completion(success: false, messageTitle: "Error", message: "There seems to be a problem. Please check your internet connection or try again.")

			} else {

				let json = JSON(response.result.value!)

				if let success = json["success"].bool{

					if success == true {

						let email = email.stringByReplacingOccurrencesOfString("%40", withString: "@")

						completion(success: true, messageTitle: "Success!", message: "A password reset token has been succesfully sent to \(email).")

					} else {

						completion(success: false, messageTitle: "Oops!", message: "There seems to be a problem. Please try again.")
					}
				}

			}
		}
	}

	//MARK: - UPDATE USER PASSWORD

	static func updateUserPassword(currentPassword: String, newPassword: String, confirmPassword: String, completion:(success: Bool, messageTitle: String, message: String)-> Void){


		ParameterController.prepareUserPasswordPUTParameters(currentPassword, newPassword: newPassword, confirmPassword: confirmPassword) { (success, passwordParameters, messageTitle, message) in

			if success {

				Alamofire.request(.PUT, "\(baseURL)/auth/passwordupdate", parameters: passwordParameters, encoding: .JSON, headers: headers).validate().responseJSON { (response) in

					if response.result.isFailure{

						completion(success: false, messageTitle: "Error", message: "Failed to update password.")

					} else {

						completion(success: true, messageTitle: messageTitle, message: message)

					}
				}


			} else {

				completion(success: false, messageTitle: messageTitle, message: message)
			}
		}
	}


	//MARK: - POST BANK ACCOUNT

	static func postBankAccount(accountHolderName: String, currency: String, country: String, accountNumber: String, routingNumber: String, ipAddress: String?, type: String, completion:(success: Bool, messageTitle: String, message: String)->Void){

		ParameterController.prepareBankAccountPOSTParameters(accountHolderName, currency: currency, country: country, accountNumber: accountNumber, routingNumber: routingNumber, ipAddress: ipAddress, type: type) { (success, bankAccountParameters, messageTitle, message) in

			if success {

				Alamofire.request(.POST, "\(baseURL)/user/commercemethod/bankaccount", parameters: bankAccountParameters, encoding: .JSON, headers: headers).validate().responseJSON { (response) in

					if response.result.isFailure{

						completion(success: false, messageTitle: "Error", message: "There seems to be a problem. Please check your network settings or try again.")

					} else {

						completion(success: true, messageTitle: messageTitle, message: message)
					}
				}


			} else {

				completion(success: false, messageTitle: messageTitle, message: message)
			}
		}

	}


	// MARK: FETCH USER TRANSACTIONS

	static func fetchUserTransactions(completion:(success: Bool, transactions : [ Transaction]?)->Void){

		Alamofire.request(.GET, "\(baseURL)/user/transaction", encoding: .JSON, headers: headers).responseArray { (response: Response<[Transaction], NSError>) in

			if response.result.isFailure {

				completion(success: false, transactions: nil)

			} else {

				if let transactions = response.result.value{

					completion(success: true, transactions: transactions)
				}
			}
		}
	}

}























