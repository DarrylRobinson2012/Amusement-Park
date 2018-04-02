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
    
}

// Enumerations for all different types of Entrants
enum EntrantType: String {
    case ClassicGuest
    case VIPGuest
    case ChildGuest
    case FoodServiceEmployee
    case RideServiceEmployee
    case MaintenanceEmployee
    case Manager
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
protocol  Entrant: StaffInfo {
    
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
    
    
    init(firstName: String? = nil, lastname: String? = nil, streetAdress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType, dateOfBirth: Date? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil) {
        
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
    }
}








































