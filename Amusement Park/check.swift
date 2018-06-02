//
//  check.swift
//  Amusement Park
//
//  Created by Darryl Robinson  on 3/27/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation

//Class for each Checkpoint
//Each check point generate new pass, and also checks the generated pass from all other check points
class CheckPoint {
    static let delayInSeconds: Double = 5
    static let numberOfCharacters: Int = 5 // number of characters to compare for birthday - dd..mm
    
    //Static function to generate passes, takes an entrant and return a pass
    // This method can generate all types of passes
    static func generatePass(entrant: Entrant) -> Pass {
        // finalPass will be assigned with a pass to be returned
        var finalPass = Pass(entrantType: entrant.entrantType)
        
     
        switch entrant.entrantType {
        case    .ClassicGuest:
            // Creating an instnace of ClassicGuest
            let classicGuest = ClassicGuest()
            //Using the instance propertied of ClassicGuest to create a pass
            var pass = Pass(entrantType: classicGuest.entrantType)
            pass.rideAcess = classicGuest.rideAcess
            pass.areaAccess = classicGuest.areaAccess
            
            finalPass = pass
            
            
        case .VIPGuest:
            let vipGuest = VIPGuest()
            var pass = Pass(entrantType: vipGuest.entrantType)
            pass.rideAcess = vipGuest.rideAcess
            pass.areaAccess = vipGuest.areaAccess
            
            finalPass = pass
        
        case .ChildGuest:
            do {
                let childGuest = try ChildGuest(dateofBirth: entrant.dateOfBirth, entrantType: entrant.entrantType)
                var pass = Pass(entrantType: childGuest.entrantType, dateOfBirth: entrant.dateOfBirth)
                pass.rideAcess = childGuest.rideAcess
                pass.areaAccess = childGuest.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .SeasonPassGuest:
            do {
                    //Creating an instance
                let seasonPassGuest = try SeasonPassGuest(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.streetAddress, zipcode: entrant.zipCode)
                // Contructing a Pass
                var pass = Pass(firstName: seasonPassGuest.firstName, lastname: seasonPassGuest.lastName, entrantType: seasonPassGuest.entrantType, dateOfBirth: seasonPassGuest.dateOfBirth)
                pass.rideAcess = seasonPassGuest.rideAcess
                pass.areaAccess = seasonPassGuest.areaAccess
                pass.discountOnFood = seasonPassGuest.discountOnFood
                pass.discountOnMerchandise = seasonPassGuest.discountOnMerchandise
                
                finalPass = pass
                
            } catch {
                print(error)
            }
        case .SeniorGuest:
            do {
                // Creating an instance
                let seniorGuest = try SeniorGuest(firstName: entrant.firstName, lastName: entrant.lastName, dateOfBirth: entrant.dateOfBirth)
                //Constructing a pass
                var pass = Pass(firstName: seniorGuest.firstName, lastname: seniorGuest.lastName, entrantType: seniorGuest.entrantType, dateOfBirth: entrant.dateOfBirth)
                pass.rideAcess = seniorGuest.rideAcess
                pass.areaAccess = seniorGuest.areaAccess
                pass.discountOnFood = seniorGuest.discountOnFood
                pass.discountOnMerchandise = seniorGuest.discountOnMerchandise
            
                finalPass = pass
            } catch {
                print(error)
            }
            
            
        case .FoodServiceEmployee:
            do {
                //Creating an instance of FoodServiceEmployee
                let foodServiceEmployee = try FoodServiceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType, dateOfBirth: entrant.dateOfBirth)
                //Using the instance properties of foodServiceEmployee to create a pass
                var pass = Pass(firstName: foodServiceEmployee.firstName, lastname: foodServiceEmployee.lastName, entrantType: foodServiceEmployee.entrantType)
                pass.rideAcess = foodServiceEmployee.rideAcess
                pass.areaAccess = foodServiceEmployee.areaAccess
                
                finalPass = pass
            } catch  {
                print(error)
            }
        case .RideServiceEmployee:
            do {
                let rideServiceEmployee = try RideServiceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType, dateOfBirth: entrant.dateOfBirth)
                var pass = Pass(firstName: rideServiceEmployee.firstName, lastname: rideServiceEmployee.lastName, entrantType: rideServiceEmployee.entrantType)
                
                pass.rideAcess = rideServiceEmployee.rideAcess
                pass.areaAccess = rideServiceEmployee.areaAccess
                finalPass = pass
                
            } catch {
                print(error)
            }
        case .MaintenanceEmployee:
            do {
                let maintenanceEmployee = try MaintenanceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType, dateOfBirth: entrant.dateOfBirth)
                var pass = Pass(firstName: maintenanceEmployee.firstName, lastname: maintenanceEmployee.lastName, entrantType: maintenanceEmployee.entrantType)
                pass.rideAcess = maintenanceEmployee.rideAcess
                pass.areaAccess = maintenanceEmployee.areaAccess
                
                finalPass = pass
                
            } catch {
                print(error)
            }
        case .Manager:
                do {
                    let manager = try Manager(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType, dateOfBirth: entrant.dateOfBirth)
                    var pass = Pass(firstName: manager.firstName, lastname: manager.lastName, entrantType: manager.entrantType)
                    pass.rideAcess = manager.rideAcess
                    pass.areaAccess = manager.areaAccess
                    
                    finalPass = pass
                    
                    
                } catch {
                    print(error)
            }
            
        case .ContractEmployee:
            do {
                //Creating an instance
                let contractEmployee = try ContractEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, projectNumber: entrant.projectNumber ,dateOfBirth: entrant.dateOfBirth)
                //Creating the pass
                var pass = Pass(firstName: contractEmployee.firstName, lastname: contractEmployee.lastName, streetAdress: contractEmployee.streetAddress, city: contractEmployee.city, state: contractEmployee.state, zipCode: contractEmployee.zipCode, entrantType: contractEmployee.entrantType,  dateOfBirth: contractEmployee.dateOfBirth)
                pass.rideAcess = contractEmployee.rideAcess
                pass.areaAccess = contractEmployee.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
        case .Vendor:
            do {
                //Creating an instance
                let vendor = try Vendor(firstName: entrant.firstName, lastName: entrant.lastName, vendorCompany: entrant.vendorCompany, dateOfBirth: entrant.dateOfBirth, dateOfVisit: entrant.dateOfVisit)
                
                //creating the pass
                var pass = Pass(firstName: vendor.firstName, lastname: vendor.lastName, entrantType: vendor.entrantType, dateOfBirth: vendor.dateOfBirth, vendorCompany: vendor.vendorCompany, dateOfVisit: vendor.dateOfVisit)
            } catch {
                 print(error)
            }
        
            
        }
            return finalPass
    }
    
    
        
        //Method to check the pass and allow entry to areas
        //Equivalent to Swipe method, This methof can handle all atyoe of passes
        
            static func checkPassForAreaAccess(pass: inout Pass, to area: AreaAcess) -> String {
            
                var phrase = " "
            if pass.areaAccess.contains(area) {
                //Extra credit, preventing swipe
                // if pass is already swiped, pass.swipe is not nil
                // prevent new swipes sooner than 5 seconds
                if let registeredSwipeTime = pass.swipeTime {
                    let currentTime = Date()
                    let registeredSwipeTimePlusDelay = registeredSwipeTime.addingTimeInterval(delayInSeconds)
                    if currentTime < registeredSwipeTimePlusDelay {
                        phrase = " This has just been swiped, try again later... \nCurrent Time: \(currentTime)\nLast swipe : \(registeredSwipeTime)"
        
                    } else {
                        pass.swipeTime = currentTime
                        phrase = "\(pass.entrantType) --- Allowed entry to \(area) at \(pass.swipeTime!)"
                    }
                    // if pass is not swiped yet, pass.swipe is nil
                    // current time will be assigned to pass.swipeTime and allow entry
                } else {
                    pass.swipeTime = Date()
                    phrase = "Pass swiped at: \(pass.swipeTime!)\n\(pass.entrantType) ---Alowed entry to \(area)\n at \(pass.swipeTime!)"
                }
                    
                    //Extra credit, birthday message
                    if pass.dateOfBirth != nil{
                    let today = Date()
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd.MM.yy"
                    let formattedDateOfBirth = formatter.string(from: pass.dateOfBirth!)
                    let formattedToday = formatter.string(from: today)
                    
                    //first 5 characters are needed to check the birthday with the following format -> dd.MM
                    if formattedDateOfBirth.prefix(numberOfCharacters) == formattedToday.prefix(numberOfCharacters) {
                        if let firsnameUnwrapped = pass.firstName {
                            print("Happy Birthday dear \(firsnameUnwrapped)")
                            
                        } else  {
                            print("Happy Birthday Dear \(pass.entrantType)")
                        }
                    }
                    
                }
            } else {
            phrase = "\(pass.entrantType) --- Denied entry to \(area)"
        }
                return phrase
    }
}
