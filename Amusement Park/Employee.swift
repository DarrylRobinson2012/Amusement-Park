//
//  Entrant.swift
//  Amusement Park
//
//  Created by Darryl Robinson  on 3/22/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation



class Employee: Entrant{

    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var areaAccess: [AreaAcess] = []
    var rideAcess: [RideAccess] = []
    var discountOnFood: Int? = 15
    var discountOnMerchandise: Int? = 25
    var entrantType: EntrantType
    var dateOfBirth: Date?
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode:String?, entrantType: EntrantType, dateOfBirth: Date? ) throws {
        
        guard let firstNameUnwrapped = firstName else {
            throw InitializerError.missingFirstName
        }
        guard let lastNameUnwrapped = lastName else {
            throw InitializerError.missingLastName
        }
        guard let streetAddressUnwrapped = streetAddress else {
            throw InitializerError.missingStreetAddress
        }
        guard let cityUnwrapped = city else {
            throw InitializerError.missingCity
        }
        guard let stateUnwrapped = state else {
            throw InitializerError.missingState
        }
        guard let zipCodeUnwrapped = zipCode else {
            throw InitializerError.missingZipCode
        }
        if let dateOfBirthUnwrapped = dateOfBirth {
            self.dateOfBirth = dateOfBirthUnwrapped
        }
        
        self.firstName = firstNameUnwrapped
        self.lastName = lastNameUnwrapped
        self.streetAddress = streetAddressUnwrapped
        self.city = cityUnwrapped
        self.state = stateUnwrapped
        self.zipCode = zipCodeUnwrapped
        self.entrantType = entrantType
        
    }
}


class FoodServiceEmployee: Employee {
    override init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .FoodServiceEmployee , dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.areaAccess = [.amusementAreas, .kitchenAreas]
    }
}

class RideServiceEmployee : Employee {
    override init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType, dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.areaAccess = [.amusementAreas, .rideControlAreas]
    }
    
}

class MaintenanceEmployee : Employee {
    override init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType, dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.areaAccess = [.amusementAreas, .rideControlAreas, .kitchenAreas, .maintenanceAreas]
    }
    
}

class Manager: Employee {
    override init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType, dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.areaAccess = [.amusementAreas, .rideControlAreas, .kitchenAreas, .maintenanceAreas,.officeAreas]
        self.discountOnFood = 25
        self.discountOnMerchandise = 25
        
    }
}





