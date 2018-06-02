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
    var projectNumber: Int?
    var vendorCompany: VendorCompany?
    var dateOfVisit: Date?
    
    
    
    
    
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode:String?, entrantType: EntrantType, dateOfBirth: Date?, projectNumber: Int? = nil ) throws {
        
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
        
        /*DateOfBirth is not mandoatory for employees, so we dont
         halt the program excurtion if DATE is missing
 
 
 */
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
        self.projectNumber = projectNumber
        
    }
}


class FoodServiceEmployee: Employee {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .FoodServiceEmployee , dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.areaAccess = [.amusementAreas, .kitchenAreas]
    }
}

class RideServiceEmployee : Employee {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .RideServiceEmployee , dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.areaAccess = [.amusementAreas, .rideControlAreas]
    }
    
}

class MaintenanceEmployee : Employee {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .MaintenanceEmployee , dateOfBirth: Date?) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth )
        self.areaAccess = [.amusementAreas, .rideControlAreas, .kitchenAreas, .maintenanceAreas]
    }
    
}

class Manager: Employee {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .Manager , dateOfBirth: Date? ) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.areaAccess = [.amusementAreas, .rideControlAreas, .kitchenAreas, .maintenanceAreas,.officeAreas]
        self.discountOnFood = 25
        self.discountOnMerchandise = 25
        
    }
}

class ContractEmployee : Employee {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .ContractEmployee , projectNumber: Int?, dateOfBirth: Date? ) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType, dateOfBirth: dateOfBirth, projectNumber: projectNumber )
        self.areaAccess = []
        
        guard let projectNumberUnwrapped = projectNumber else {
            throw InitializerError.missingProjectNumber
        }
        
        switch projectNumberUnwrapped {
        case 1001:
            self.areaAccess = [.amusementAreas, .rideControlAreas]
        case 1002:
            self.areaAccess = [.amusementAreas, .rideControlAreas, .maintenanceAreas]
        case 1003:
            self.areaAccess = [.amusementAreas, .rideControlAreas, .kitchenAreas, .maintenanceAreas, .officeAreas]
        case 2001:
            self.areaAccess = [.officeAreas]
        case 2002:
            self.areaAccess = [.kitchenAreas, .maintenanceAreas]
        default:
            throw InitializerError.invalidProjectNumber
        }
    
}


}


