//
//  ViewController.swift
//  Amusement Park
//
//  Created by Darryl Robinson  on 3/22/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var MainView: UIView!
    
    @IBOutlet weak var GuestLabel: UILabel!
    @IBOutlet weak var EmployeeLabel: UILabel!
    @IBOutlet weak var MangerLabel: UILabel!
    @IBOutlet weak var Vendors: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    
    @IBOutlet weak var DOBLabel: UILabel!
    @IBOutlet weak var DOBtextfeild: UITextField!
    
    @IBOutlet weak var SSNLabel: UILabel!
    @IBOutlet weak var SSNTextFeild: UITextField!
    
    
    
    @IBOutlet weak var ProjectLabel: UILabel!
    @IBOutlet weak var ProjectTextFeild: UITextField!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var FirstNameTextFeild: UITextField!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var LastNameTextFeild: UITextField!
    
    @IBOutlet weak var CompanyLabel: UILabel!
    @IBOutlet weak var CompanyTextFeild: UITextField!
    
    @IBOutlet weak var AddyLabel: UILabel!
    @IBOutlet weak var AddyTextFeild: UITextField!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var CityTextFeild: UITextField!
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var StateTextFeild: UITextField!
    
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var ZipTextFeild: UITextField!
    
    
    @IBOutlet weak var GeneratePass: UIButton!
    
    @IBOutlet weak var PopulateData: UIButton!
    
    
    
    var firstRowButton: FirstRowButtonType? = nil
    var secondRowButton: SecondRowButtonType? = nil
    
    var pass: Pass? = nil
    let companyData: [String] = [VendorCompany.Amazon.rawValue, VendorCompany.Apple.rawValue, VendorCompany.Telsa.rawValue, VendorCompany.Uber.rawValue]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideButtons()
        
        
        //observer for keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        //Adding Done button for all input fields(keyboard, UIPicker)
        addDoneButton()
        
        //setting placeholders for textfields
        insertPlaceHolders()
        
        //Company Picker
        let companyPicker = UIPickerView()
        CompanyTextFeild.inputView = companyPicker
        companyPicker.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        
        //Adding event to the labels
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGuest))
        GuestLabel.isUserInteractionEnabled = true
        GuestLabel.addGestureRecognizer(tap)
        
    
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapEmployee))
        EmployeeLabel.isUserInteractionEnabled = true
        EmployeeLabel.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapManger))
        MangerLabel.isUserInteractionEnabled = true
        MangerLabel.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapVendor))
        Vendors.isUserInteractionEnabled = true
        Vendors.addGestureRecognizer(tap4)
       
 
        //Changed label text this way because I was being lazy.
        SSNLabel.text = "Date Of Visit"
    
    }
        // Do any additional setup after loading the view, typically from a nib.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if segue.identifier == "showPASS" {
            let vc = segue.destination as! PassViewController
            vc.pass = pass
        }
    }
    
    
    
    @objc func tapGuest(sender:UITapGestureRecognizer){
        print("tap working")
        showButtons()
        Button1.setTitle("Child", for: .normal)
        Button2.setTitle("Adult", for: .normal)
        Button3.setTitle("VIP", for: .normal)
        Button4.setTitle("Senior", for: .normal)
        Button5.setTitle("SeasonPass", for: .normal)
        firstRowButton = FirstRowButtonType.Guest
    }
     @objc func tapEmployee(sender:UITapGestureRecognizer){
    print("Employee tapped")
        showButtons()
        Button1.setTitle("Food Service", for: .normal)
        Button2.setTitle("Ride service", for: .normal)
        Button3.setTitle("Maintenance", for: .normal)
        Button4.setTitle("Contract", for: .normal)
        Button5.isHidden = true
        firstRowButton = FirstRowButtonType.Employee
        
    }
    @objc func tapManger(sender:UITapGestureRecognizer){
        print("Manager tapped")
        hideButtons()
        firstRowButton = FirstRowButtonType.Manager
        setActiveTextFeilds()
    }
    @objc func tapVendor(sender:UITapGestureRecognizer){
        print("Vendor tapped")
        hideButtons()
        firstRowButton = FirstRowButtonType.Vendor
        setActiveTextFeilds()
    }
    
    @IBAction func taplabel1(sender: UIButton){
      
        if  sender.titleLabel?.text == "Child" {
            secondRowButton = SecondRowButtonType.Child
            setActiveTextFeilds()
          
        }
        if sender.titleLabel?.text == "Food Service" {
            secondRowButton = SecondRowButtonType.FoodService
            setActiveTextFeilds()
            
        }
        
    }
   
    @IBAction func taplabel2(_ sender: UIButton) {
        if sender.titleLabel?.text == "Adult" {
            secondRowButton = SecondRowButtonType.Adult
            setActiveTextFeilds()
        }
        if sender.titleLabel?.text == "Ride Service" {
            secondRowButton = SecondRowButtonType.RideService
            setActiveTextFeilds()
        }
        
    }
    @IBAction func taplabel3(sender: UIButton){
        if sender.titleLabel?.text == "VIP" {
            secondRowButton = SecondRowButtonType.VIP
            setActiveTextFeilds()
        }
        if sender.titleLabel?.text == "Maintenance" {
            secondRowButton = SecondRowButtonType.Maintenance
            setActiveTextFeilds()
        }
        
    }
    @IBAction func taplabel4(sender: UIButton){
        if sender.titleLabel?.text == "Senior" {
            secondRowButton = SecondRowButtonType.Senior
            setActiveTextFeilds()
        }
        if sender.titleLabel?.text == "Contract" {
            secondRowButton = SecondRowButtonType.Contract
            setActiveTextFeilds()
        }
        
    }
    @IBAction func taplabel5(sender: UIButton){
        if sender.titleLabel?.text == "SeasonPass" {
            secondRowButton = SecondRowButtonType.SeasonPass
            setActiveTextFeilds()
        }
       
        
    }
    
  
    
    // date pickers
    
    func dateOfBirthPicker() {
        let datePickerView: UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        DOBtextfeild.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(ViewController.updateDateOfBirthFromValueChanged), for: UIControlEvents.valueChanged)
        }
    
    @objc func updateDateOfBirthFromValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = " dd -MM -yyyy"
        DOBtextfeild.text = dateFormatter.string(from: sender.date)
    }
    
    //excute me only  when vendor come and ssn changes to date of visit
    func DateOfVisitPicker(_ sender: UITextView) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        SSNTextFeild.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ViewController.updateDateOfVisitFromValueChanged), for: UIControlEvents.valueChanged)
    }
    
    @objc func updateDateOfVisitFromValueChanged(sender: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM-yyyy"
        SSNTextFeild.text = dateFormater.string(from: sender.date)
    }
    
    //helper functions for company Picker -----
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent compent: Int) -> Int {
        return companyData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent compenent: Int) -> String? {
        return companyData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didselectRow row: Int, inComponent component: Int) {
        CompanyTextFeild.text = companyData[row]
    }
    
    func generatePass(_ sender: UIButton) {
        guard let firstRowButtonUnwrapped = firstRowButton else {
            print("Empty")
            return
        }
    }
    
    @IBAction func genPass(_ sender: UIButton) {
        
        guard let firstRowButtonUnwrapped = firstRowButton else {
            print("Empty")
         return
    }
        switch firstRowButtonUnwrapped {
        case .Guest:
            //There are 5 options for Guests
            //Child
                if secondRowButton == SecondRowButtonType.Child {
                    let dateFromString =  createDateFormatter(textField: DOBtextfeild)
                  
                    do {
                        let child = try ChildGuest(dateofBirth: dateFromString)
                        pass = CheckPoint.generatePass(entrant: child)
                    } catch {
                        genericAlert(error: error)
                    }
                }
            //Adult
                if secondRowButton == SecondRowButtonType.Adult {
                    let adult = ClassicGuest()
                    pass = CheckPoint.generatePass(entrant: adult)
            }
            
            //Senior
                if secondRowButton == SecondRowButtonType.Senior {
                    let datefromString = createDateFormatter(textField: DOBtextfeild)
                    do {
                        let senior = try SeniorGuest(firstName: FirstNameTextFeild.text, lastName: LastNameTextFeild.text, dateOfBirth: datefromString)
                        pass = CheckPoint.generatePass(entrant: senior)
                    }catch {
                        genericAlert(error: error)
                    }
            }
            //VIP
                if secondRowButton == SecondRowButtonType.VIP {
                    let vip = VIPGuest()
                    pass = CheckPoint.generatePass(entrant: vip)
            }
            //SeasonPass
                if secondRowButton == SecondRowButtonType.SeasonPass {
                    let dateFromString = createDateFormatter(textField: DOBtextfeild)
                    do { let seasonPassGuest = try SeasonPassGuest(firstName: FirstNameTextFeild.text, lastName: LastNameTextFeild.text, streetAddress: AddyTextFeild.text, city: CityTextFeild.text, state: StateTextFeild.text, zipcode: ZipTextFeild.text, dateOfBirth: dateFromString)
                        
                        pass = CheckPoint.generatePass(entrant: seasonPassGuest)
                        
                    } catch {
                        genericAlert(error: error)
                    }
            }
            
        case .Employee:
            //there are 4 options for employees
            //foodServiceEmployee
            
            if secondRowButton == SecondRowButtonType.FoodService {
                let dateFromString = createDateFormatter(textField: DOBtextfeild)
                do {
                    let foodServiceEmployee = try FoodServiceEmployee(firstName: FirstNameTextFeild.text, lastName: LastNameTextFeild.text, streetAddress: AddyTextFeild.text, city: CityTextFeild.text, state: StateTextFeild.text, zipCode: ZipTextFeild.text, dateOfBirth: dateFromString)
                    
                    pass = CheckPoint.generatePass(entrant:foodServiceEmployee)
                    
                    
                } catch {
                    genericAlert(error: error)
                }
            }
            //RideServiceEmployee
            if secondRowButton == SecondRowButtonType.RideService {
                let datefromString = createDateFormatter(textField: DOBtextfeild)
                do {
                    let rideServiceEmployee = try RideServiceEmployee(firstName: FirstNameTextFeild.text, lastName: LastNameTextFeild.text, streetAddress: AddyTextFeild.text, city: CityTextFeild.text, state: StateTextFeild.text, zipCode: ZipTextFeild.text, dateOfBirth: datefromString)
                    
                    pass = CheckPoint.generatePass(entrant: rideServiceEmployee)
                } catch {
                    genericAlert(error: error)
                }
            }
            //MaintenanceEmployee
            if secondRowButton == SecondRowButtonType.Maintenance {
                let dateFromString = createDateFormatter(textField: DOBtextfeild)
                do {
                    let maintenanceEmployee = try MaintenanceEmployee(firstName: FirstNameTextFeild.text, lastName: LastNameTextFeild.text, streetAddress: AddyTextFeild.text, city: CityTextFeild.text, state: StateTextFeild.text, zipCode: ZipTextFeild.text, dateOfBirth: dateFromString)
                    
                    pass = CheckPoint.generatePass(entrant: maintenanceEmployee)
                } catch {
                    genericAlert(error: error)
                }
                
            }
            //ContractEmployee
            if secondRowButton == SecondRowButtonType.Contract {
                if let projectNumberUnwrapped = ProjectTextFeild.text {
                    let dateFromString = createDateFormatter(textField: DOBtextfeild)
                    do {
                        let contractEmployee = try ContractEmployee(firstName: FirstNameTextFeild.text, lastName: LastNameTextFeild.text, streetAddress: AddyTextFeild.text, city: CityTextFeild.text, state: StateTextFeild.text, zipCode: ZipTextFeild.text, projectNumber: Int(projectNumberUnwrapped), dateOfBirth: dateFromString)
                        
                        pass = CheckPoint.generatePass(entrant: contractEmployee)
                    } catch {
                        genericAlert(error: error)
                    }
                }
            }
        case .Manager:
            let dateFromString = createDateFormatter(textField: DOBtextfeild)
            do {
                let manager = try Manager(firstName: FirstNameTextFeild.text, lastName: LastNameTextFeild.text, streetAddress: AddyTextFeild.text, city: CityTextFeild.text, state: StateTextFeild.text, zipCode: ZipTextFeild.text, dateOfBirth: dateFromString)
                pass = CheckPoint.generatePass(entrant: manager)
            } catch {
                genericAlert(error: error)
            }
            
        case .Vendor:
            let dateOfBirthFromString = createDateFormatter(textField: DOBtextfeild)
            let dateOfVisitFromString = createDateFormatter(textField: SSNTextFeild)
            

            if let vendorCompanyUnwrapped = CompanyTextFeild.text {

            do {
                
                
                let vendor = try Vendor(firstName: firstNameLabel.text, lastName: LastNameTextFeild.text, vendorCompany: VendorCompany(rawValue: vendorCompanyUnwrapped), dateOfBirth: dateOfBirthFromString, dateOfVisit: dateOfVisitFromString)
                    
                    
                    
                    pass = CheckPoint.generatePass(entrant: vendor)
                    
                } catch {
                    
                    genericAlert(error: error)
                }
            }
            
      
        }
    }
    @IBAction func  populateData(sender: UIButton) {
    guard let firstRowButtonUnwrapped = firstRowButton else {
            
            print("Empty")
            
            return
            
        }
        switch firstRowButtonUnwrapped {
            case .Guest:
            // There are 5 options for Guests
            //Child
                if secondRowButton == SecondRowButtonType.Child {
                DOBtextfeild.text = "03-01-2013"
                 
        }
                // Adult
                if secondRowButton == SecondRowButtonType.Adult {
        }
                // Senior
            
                if secondRowButton == SecondRowButtonType.Senior {
                FirstNameTextFeild.text = "Drew"
                LastNameTextFeild.text = "Brees"
                DOBtextfeild.text = "09-01-1974"
                
            }
                // VIP
                if secondRowButton == SecondRowButtonType.VIP {
                }
                // SeasonPass
            
                if secondRowButton == SecondRowButtonType.SeasonPass {
                FirstNameTextFeild.text = "Payton"
                LastNameTextFeild.text = "Manning"
                AddyTextFeild.text = "dolphin drive"
                CityTextFeild.text = "Atlanta"
                StateTextFeild.text = "Georgia"
                ZipTextFeild.text = "30298"
                
            }
            
            
            
        case .Employee:
            
            // There are 4 options for employees
            
            // FoodServiceEmployee
            
            if secondRowButton == SecondRowButtonType.FoodService {
                
                FirstNameTextFeild.text = "Tom"
                LastNameTextFeild.text = "Brady"
                AddyTextFeild.text = "Chasing lane"
                CityTextFeild.text = "Balitimore"
                StateTextFeild.text = "Maryland"
                ZipTextFeild.text = "12344"
            
            }
            
            
            
            // RideServiceEmployee
            
            if secondRowButton == SecondRowButtonType.RideService {
                
                FirstNameTextFeild.text = "Mike"
                LastNameTextFeild.text = "Vick"
                AddyTextFeild.text = "Central Ave"
                CityTextFeild.text = "Atlanta"
                StateTextFeild.text = "Georgia"
                ZipTextFeild.text = "34592"
                
            }
            
            
            
            // MaintenanceEmployee
            
            if secondRowButton == SecondRowButtonType.Maintenance {
                
                FirstNameTextFeild.text = "Daventee"
                LastNameTextFeild.text = "Freeman"
                AddyTextFeild.text = "Jesse street"
                CityTextFeild.text = "Miami"
                StateTextFeild.text = "Florida"
                ZipTextFeild.text = "000030"
                
            }
            
            
            
            // ContractEmployee
            
            if secondRowButton == SecondRowButtonType.Contract {
                
                FirstNameTextFeild.text = "Jimmi"
                LastNameTextFeild.text = "Hendrix"
                AddyTextFeild.text = "Yen terrace"
                CityTextFeild.text = "Beanville "
                StateTextFeild.text = "Oregon"
                ZipTextFeild.text = "80842"
                ProjectTextFeild.text = "1002"
                
            }
            
            
            
        case .Manager:
            
            FirstNameTextFeild.text = "Julio"
            LastNameTextFeild.text = "Jones"
            AddyTextFeild.text = "Tulip Lane"
            CityTextFeild.text = "Birgmingham"
            StateTextFeild.text = "Alabama"
            ZipTextFeild.text = "89388"
            
            
            
            
            
        case .Vendor:
            
            FirstNameTextFeild.text = "Jack"
            LastNameTextFeild.text = "Ma"
            CompanyTextFeild.text = "Telsa"
            DOBtextfeild.text = "01-01-1960"
            SSNTextFeild.text = "01-01-2015"
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    //helper methods
    // Method to hide the buttons at the second row
    func hideButtons() {
        Button1.isHidden = true
        Button2.isHidden = true
        Button3.isHidden = true
        Button4.isHidden = true
        Button5.isHidden = true
        
    }
    // method to show tht buttons at the second row
    func showButtons() {
        Button1.isHidden = false
        Button2.isHidden = false
        Button3.isHidden = false
        Button4.isHidden = false
        Button5.isHidden = false
        }
    
    func disableAllTextFields() {
        disableTextField(textField: DOBtextfeild)
        disableTextField(textField: SSNTextFeild)
        disableTextField(textField: ProjectTextFeild)
        disableTextField(textField: FirstNameTextFeild)
        disableTextField(textField: LastNameTextFeild)
        disableTextField(textField: CompanyTextFeild)
        disableTextField(textField: AddyTextFeild)
        disableTextField(textField: CityTextFeild)
        disableTextField(textField: StateTextFeild)
        disableTextField(textField: ZipTextFeild)
        }
    
    func enableAllTextFields() {
        enabledTextField(textField: DOBtextfeild)
        enabledTextField(textField: SSNTextFeild)
        enabledTextField(textField: ProjectTextFeild)
        enabledTextField(textField: FirstNameTextFeild)
        enabledTextField(textField: LastNameTextFeild)
        enabledTextField(textField: CompanyTextFeild)
        enabledTextField(textField: AddyTextFeild)
        enabledTextField(textField: CityTextFeild)
        enabledTextField(textField: StateTextFeild)
        enabledTextField(textField: ZipTextFeild)
    }
    
    
    func disableTextField(textField: UITextField) {
        textField.isEnabled = false
        textField.backgroundColor = UIColor.lightGray
        textField.text = " "
        
    }
    
    func enabledTextField(textField: UITextField) {
        textField.isEnabled = true
        textField.backgroundColor = UIColor.white
        textField.text = " "
    
    }
    
    func validateAllTextFields() {
        
    }
    
    //function to set placeholders for textfields
    func insertPlaceHolders() {
        FirstNameTextFeild.placeholder = "First Name"
        LastNameTextFeild.placeholder = "Last Name"
        AddyTextFeild.placeholder = "Street Address"
        CityTextFeild.placeholder = "City "
        StateTextFeild.placeholder = "State"
        ProjectTextFeild.placeholder = "Project "
        ZipTextFeild.placeholder = "Zip Code"
        
    }
    
    
    //function to add done button for all the inout fields(keyboard, UIPicker)
    func addDoneButton()  {
        // toolbar
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(ViewController.dismissPicker))
        DOBtextfeild.inputAccessoryView = toolBar
        SSNTextFeild.inputAccessoryView = toolBar
        ProjectTextFeild.inputAccessoryView = toolBar
        FirstNameTextFeild.inputAccessoryView = toolBar
        LastNameTextFeild.inputAccessoryView = toolBar
        CompanyTextFeild.inputAccessoryView = toolBar
        AddyTextFeild.inputAccessoryView = toolBar
        CityTextFeild.inputAccessoryView = toolBar
        StateTextFeild.inputAccessoryView = toolBar
        ZipTextFeild.inputAccessoryView = toolBar
        
    }
        
    
    
    //function to enable/disable textfields
    func setActiveTextFeilds() {
      guard let firstRowButtonUnwrapped = firstRowButton else {
            print(" nahh ")
        return
        }
        switch firstRowButtonUnwrapped {
            
        case .Guest:
            //child
                if let secondRowButtonUnwrapped = secondRowButton {
                    if secondRowButtonUnwrapped ==  .Child {
                        disableAllTextFields()
                        enabledTextField(textField: DOBtextfeild)
                    }
            }
            //Adult
                if let secondRowButtonUnrwapped = secondRowButton  {
                    if secondRowButtonUnrwapped == .Adult {
                        disableAllTextFields()
                    }
                    
            }
            //Senior
                if let secondRowButtonUnwrapped = secondRowButton {
                    if secondRowButtonUnwrapped == .Senior{
                        disableAllTextFields()
                        enabledTextField(textField: DOBtextfeild)
                        enabledTextField(textField: FirstNameTextFeild)
                        enabledTextField(textField: LastNameTextFeild)
                 }
            }
            //VIP
                if let secondRowButtonUnrapped = secondRowButton {
                    if secondRowButtonUnrapped == .VIP {
                        disableAllTextFields()
                        
                    }
            }
            //SeasonPass
                if let secondRowButtonUnwrapped = secondRowButton {
                    if secondRowButtonUnwrapped == .SeasonPass {
                        enableAllTextFields()
                        disableTextField(textField: SSNTextFeild)
                        disableTextField(textField: ProjectTextFeild)
                        disableTextField(textField: CompanyTextFeild)
                    }
            }
            
        case .Employee:
            //Food Service
            
            if let secondRowButtonUnwrapped = secondRowButton {
                if secondRowButtonUnwrapped == .FoodService {
                        enableAllTextFields()
                        disableTextField(textField: SSNTextFeild)
                        disableTextField(textField: ProjectTextFeild)
                        disableTextField(textField: CompanyTextFeild)
                }
            }
            //Ride Service
            
            if let secondRowButtonUnwrapped = secondRowButton {
                if secondRowButtonUnwrapped == .RideService {
                        enableAllTextFields()
                    disableTextField(textField: SSNTextFeild)
                    disableTextField(textField: ProjectTextFeild)
                    disableTextField(textField: CompanyTextFeild)
                }
            }
            //Contract
            
            if let secondRowButtonUnwrapped = secondRowButton {
                if secondRowButtonUnwrapped == .Contract {
                        enableAllTextFields()
                        disableTextField(textField: SSNTextFeild)
                        disableTextField(textField: CompanyTextFeild)
                }
            }
            
        case .Manager:
            enableAllTextFields()
            disableTextField(textField: SSNTextFeild)
            disableTextField(textField: ProjectTextFeild)
            disableTextField(textField: CompanyTextFeild)
            
            
        case .Vendor:
            enableAllTextFields()
            disableTextField(textField: ProjectTextFeild)
            disableTextField(textField: AddyTextFeild)
            disableTextField(textField: CityTextFeild)
            disableTextField(textField: StateTextFeild)
            disableTextField(textField: ZipTextFeild)
            SSNLabel.text = "Date Of Visit"
            
            
        }
        
        
        
    }
    
    
    
    
    

}
