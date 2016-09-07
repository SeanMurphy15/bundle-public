//
//  Constants.swift
//  Bundle
//
//  Created by Sean Murphy on 8/30/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation


enum Icons {
	case ChaseBank
	case WellsFargoBank
	case Stripe
	case CitibankBank
	case ApplePay
	case VisaCard
	case MasterCard
	case DiscoverCard
	case AmexCard
	case DefaultCard
	case VisaCardLargeDark
	case MasterCardLargeDark
	case DiscoverCardLargeDark
	case AmexCardLargeDark
	case ChaseBankLarge
	case StripeBankLarge
	case DefaultCardLarge

	var icon: UIImage {
		switch self {
		case .ApplePay: return UIImage(named: "icon-applepay")!
		case .CitibankBank: return UIImage(named: "icon-citibank-bank")!
		case .Stripe: return UIImage(named: "icon-stripe")!
		case .WellsFargoBank: return UIImage(named: "icon-wellsfargo-bank")!
		case .ChaseBank: return UIImage(named: "icon-chase-bank")!
		case .VisaCard: return UIImage(named: "icon-visa-card")!
		case .MasterCard: return UIImage(named: "icon-mastercard-card")!
		case .DiscoverCard: return UIImage(named: "icon-discover-card")!
		case .DefaultCard: return UIImage(named: "icon-default-card")!
		case .AmexCard: return UIImage(named: "icon-amex-card")!
		case .VisaCardLargeDark: return UIImage(named: "icon-visa-card-large-dark")!
		case .MasterCardLargeDark: return UIImage(named: "icon-mastercard-card-large-dark")!
		case .DiscoverCardLargeDark: return UIImage(named: "icon-discover-card-large-dark")!
		case .AmexCardLargeDark: return UIImage(named: "icon-amex-card-large-dark")!
		case .ChaseBankLarge: return UIImage(named: "icon-chase-bank-large")!
		case .StripeBankLarge: return UIImage(named: "icon-stripe-bank-large")!
		case .DefaultCardLarge: return UIImage(named: "icon-default-card-large")!

		}
	}
}

enum TimeFormat {
	case MonthAndYear
	case Time

	var type: String {
		switch self{
		case .MonthAndYear: return "MM/yyyy"
		case .Time: return "hh:mm aa"
		}
	}
}
