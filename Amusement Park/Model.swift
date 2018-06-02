//
//  Model.swift
//  Amusement Park
//
//  Created by Darryl Robinson  on 3/24/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation
//This file for all enumerations and protocols

//Eneumeration for Acess Areas
enum AreaAcess: String{
    case amusementAreas
    case kitchenAreas
    case rideControlAreas
    case maintenanceAreas
    case officeAreas
}

//Emumeratiom fpr all Types of Ride Acess
enum RideAccess: String {
    case accessAllRides
    case skipAllRides
}

//Enumeration for all different types of errors
enum InitializerError: Error {
    case missingDateOfBirth
    case missingFirstName
    case missingLastName
    case missingStreetAddress
    case missingCity
    case missingState
    case missingZipCode
    case olderThenAgeLimit
    case missingProjectNumber
    case missingVendorCompany
    case missingDateOfVisit
    case invalidProjectNumber
    
}

// Enumerations for all different types of Entrants
enum EntrantType: String {
    case ClassicGuest
    case VIPGuest
    case ChildGuest
    case SeasonPassGuest
    case SeniorGuest
    case FoodServiceEmployee
    case RideServiceEmployee
    case MaintenanceEmployee
    case ContractEmployee
    case Manager
    case Vendor
    
}

enum VendorCompany: String {
    case Amazon
    case Apple
    case Uber
    case Telsa
}

//Enum for top buttons in first row
enum FirstRowButtonType {
    case Guest
    case Employee
    case Manager
    case Vendor
}

//Enum for top buttons in second row
enum SecondRowButtonType {
    case Child
    case Adult
    case Senior
    case VIP
    case SeasonPass
    case FoodService
    case RideService
    case Maintenance
    case Contract
    
}

protocol ContractInfo {
    var projectNumber: Int?  { get set }
    
}
protocol VendorInfo {
    var vendorCompany: VendorCompany? {get set }
    var dateOfVisit: Date? {get set }
}

protocol DiscountInfo {
    var discountOnFood: Int?  { get set }
    var discountOnMerchandise: Int? {get set }
}
//Protocol for Staff info
protocol StaffInfo {
    var firstName: String? {get set }
    var lastName: String? {get set }
    var streetAddress: String? {get set}
    var city: String?  {get set}
    var state: String? {get set }
    var zipCode: String? {get set}
}

// Protocol to make a custom type Entrant
//Entrant is a protocol which requires all the properties
protocol  Entrant: StaffInfo, ContractInfo, VendorInfo, DiscountInfo {
    
    var areaAccess: [AreaAcess] {get set }
    var rideAcess: [RideAccess] {get set }
    var entrantType: EntrantType {get set }
    var dateOfBirth: Date? {get set }
    var discountOnFood: Int? { get set }
    var discountOnMerchandise: Int? {get set }
    
}
//Protocol for swipeTime
protocol SwipeTime {
    var swipeTime: Date? {get set }
    
}

//Structure for the pass 
struct Pass: Entrant, SwipeTime {
    
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var entrantType: EntrantType
    var rideAcess: [RideAccess] = []
    var areaAccess: [AreaAcess] = []
    var dateOfBirth: Date?
    var discountOnFood: Int?
    var discountOnMerchandise: Int?
    var swipeTime: Date? = nil
    var projectNumber: Int?
    var vendorCompany: VendorCompany?
    var dateOfVisit: Date?
    
    
    init(firstName: String? = nil, lastname: String? = nil, streetAdress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType, dateOfBirth: Date? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil, projectNumber: Int? = nil, vendorCompany: VendorCompany? = nil, dateOfVisit: Date? = nil ) {
        
        self.firstName = firstName
        self.lastName = lastname
        self.streetAddress = streetAdress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.entrantType = entrantType
        self.dateOfBirth = dateOfBirth
        self.discountOnFood = discountOnFood
        self.discountOnMerchandise = discountOnMerchandise
        self.projectNumber = projectNumber
        self.vendorCompany = vendorCompany
        self.dateOfVisit = dateOfVisit
    }
}








































