//
//  UserProfileViewController.swift
//  ECGame
//
//  Created by hfcb on 1/14/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import ObjectMapper

class UserProfileViewController: UIViewController,UIGestureRecognizerDelegate, UIScrollViewDelegate {
   
    //MARK:- IBOutlets
    @IBOutlet weak var backButtonOutlet: UIButton!
    @IBOutlet weak var user_profile_BackView: UIView!
    @IBOutlet weak var userProfilePictureImageView: CustomImageView!
    @IBOutlet weak var user_camera_ImageView: UIImageView!
    @IBOutlet weak var user_PrimeMem_ImageView: UIImageView!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var userStatusLabel: UILabel!
    @IBOutlet weak var user_balanceLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userGenderTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userCountryTextField: UITextField!
    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var rollingTextField: UITextField!
    
    //Title outlet
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var genderTitleLabel: UILabel!
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var countryTitleLabel: UILabel!
    @IBOutlet weak var rollingTitleLabel: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    //MARK:- Var/Let -
    var validation = Validation()
    var imagePicker: ImagePicker!
    let picker = UIPickerView()
    var arrayOfGender = [Gender.Male,Gender.Female]
    var arrayOfcountries: [String] = []
    var activeTextField = 0
    // Model object for userprofile
    var userProfile : UserProfileModel?

    
     //MARK:- View Life Cycle
     override func viewDidLoad() {
        super.viewDidLoad()
        self.loadBasicView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //getUserProfileDetailsAPI()
    }

    //MARK:- Custom Method
    func loadBasicView() {
        
        navTitle.text = ProfileScreen.profileString.localiz().uppercased()
        nameTitleLabel.text = ProfileScreen.nameString.localiz().uppercased()
        genderTitleLabel.text = ProfileScreen.genderString.localiz().uppercased()
        emailTitleLabel.text = ProfileScreen.emailString.localiz().uppercased()
        countryTitleLabel.text = ProfileScreen.countryString.localiz().uppercased()
        rollingTitleLabel.text = ProfileScreen.rollingString.localiz().uppercased()
        cancelBtn.setTitle(ProfileScreen.cancleString.localiz().uppercased(), for: .normal)
        saveBtn.setTitle(ProfileScreen.saveString.localiz().uppercased(), for: .normal)
        
        let profileImageTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.imagePickerActionTapped))
        profileImageTapGesture.numberOfTouchesRequired = 1
        user_camera_ImageView.addGestureRecognizer(profileImageTapGesture)
        user_camera_ImageView.isUserInteractionEnabled =  true
        
        let viewprofileTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.viewProfileimageActionTapped))
        viewprofileTapGesture.numberOfTouchesRequired = 1
        userProfilePictureImageView.addGestureRecognizer(viewprofileTapGesture)
        userProfilePictureImageView.isUserInteractionEnabled =  true
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        createPickerView()
        createToolbar()
        getUserProfileDetailsAPI()
    }

    func updateProfileViewWithData(userDatObject : UserProfileData?) {
        userNameTextField.text = userDatObject?.name
        userGenderTextField.text = "Pending"
        userEmailTextField.text = userDatObject?.email
        userCountryTextField.text =  userDatObject?.country
        userIDLabel.text = userDatObject!.name+": ID "+userDatObject!.userApiId
        user_balanceLabel.text = userDatObject!.userBalance.createCurrencyString()
        userStatusLabel.text = userDatObject?.lastActivity
        if userDatObject!.isBanned {
            user_PrimeMem_ImageView.isHidden = false
        } else {
            user_PrimeMem_ImageView.isHidden = true
        }
        if userDatObject!.gender == 0 {
            userGenderTextField.text = arrayOfGender[0]
        } else if userDatObject!.gender == 1 {
            userGenderTextField.text = arrayOfGender[1]
        } else {
           userGenderTextField.text = arrayOfGender[2]
        }
        rollingTextField.text = userDatObject!.rollingAmount.createCurrencyString()
    }

    //MARK:- IBAction
    @IBAction func OnClickCancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func OnClickSaveButton(_ sender: Any) {
        self.OnTapSaveProfileButton()
    }
    @IBAction func OnClickBackButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: UserDefaultsKey.isProfileShow)
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- IBAction Methods
    @objc func imagePickerActionTapped(_ sender: UITapGestureRecognizer) {
        self.imagePicker.present(from: sender.view!)
    }
    @objc func viewProfileimageActionTapped(_ sender: UITapGestureRecognizer) {
        if (UserDefaults.standard.bool(forKey:UserDefaultsKey.isProfileShow) == true){
        
            let viewObj = appDelegate.getSidemenuStoryBoardSharedInstance().instantiateViewController(withIdentifier: ShowUserProfileViewController.className()) as! ShowUserProfileViewController
            viewObj.newImage = userProfilePictureImageView.image
           
            self.present(viewObj, animated: true, completion: nil) //self.navigationController?.pushViewController(viewObj, animated: true)
            
        }
    }
    
    //MARK:- Gesture Action
    func OnTapSaveProfileButton()  {
      guard let nametext = userNameTextField.text, !nametext.isEmpty else {
         self.makeToastInBottomWithMessage(AlertField.emptyNameString)
         return
      }
      if validation.isValidInput(Input: userNameTextField.text ?? "") == false{
         self.makeToastInBottomWithMessage(AlertField.validUserNameString)
         return
      }
      guard let gendertext = userGenderTextField.text, !gendertext.isEmpty else {
        self.makeToastInBottomWithMessage(AlertField.emptyGenderString)
        return
      }
      guard let emailtext = userEmailTextField.text, !emailtext.isEmpty else {
         self.makeToastInBottomWithMessage(AlertField.emptyEmailString)
         return
      }
      if validation.isValidEmail(testStr: userEmailTextField.text ?? "") == false{
         self.makeToastInBottomWithMessage(AlertField.emailNotValidString)
         return
      }
      guard let countrytext = userCountryTextField.text, !countrytext.isEmpty else {
        self.makeToastInBottomWithMessage(AlertField.emptyCountryString)
        return
      }
      guard let rollingtext = rollingTextField.text, !rollingtext.isEmpty else {
      self.makeToastInBottomWithMessage(AlertField.emptyRollingString)
         return
      }
        self.userProfile?.data![0].name = userNameTextField.text!
        self.userProfile?.data![0].country = userCountryTextField.text!
        self.userProfile?.data![0].email = userEmailTextField.text!
        updateUserProfileDetailsAPI(userDatObject: self.userProfile?.data![0])
    }
    
    //MARK:- PickerView Method
    func createPickerView() {
          //Picker Delegate
          picker.delegate = self
          picker.delegate?.pickerView?(picker, didSelectRow: 0, inComponent: 0)
          userGenderTextField.inputView = picker
          userCountryTextField.inputView = picker
          picker.backgroundColor = UIColor.white
          //Get Country List From NSLocal
          var countries: [String] = []
          for code in NSLocale.isoCountryCodes as [String] {
              let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
              let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
              countries.append(name)
          }
          arrayOfcountries = countries.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending
        }
      }
     //ADD DONE BUTTON TO PICKER
      func createToolbar()  {
          let toolbar = UIToolbar()
          toolbar.sizeToFit()
          toolbar.tintColor = UIColor.blue
          toolbar.backgroundColor = UIColor.black
          let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.closePickerView))
          toolbar.setItems([doneButton], animated: false)
          toolbar.isUserInteractionEnabled = true
          userGenderTextField.inputAccessoryView = toolbar
          userCountryTextField.inputAccessoryView = toolbar
      }
      @objc func closePickerView() {
          view.endEditing(true)
      }
}

//MARK:- ImagePickerDelegate
extension UserProfileViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        UserDefaults.standard.set(true, forKey: UserDefaultsKey.isProfileShow)
        self.userProfilePictureImageView.image = image
    }
}

//MARK:- Comman PickerView Delegate
extension UserProfileViewController : UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            
        switch activeTextField  {
            case 1:
                return arrayOfGender.count
            case 2:
                return arrayOfcountries.count
            default:
                return arrayOfcountries.count
        }
     }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        switch activeTextField{
            case 1:
                return arrayOfGender[row]
            case 2:
                return arrayOfcountries[row]
            default:
                return arrayOfcountries[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch activeTextField{
            case 1:
                userGenderTextField.text =  arrayOfGender[row]
                self.userProfile?.data![0].gender = row
                break
            case 2:
                userCountryTextField.text = arrayOfcountries[row]
                self.userProfile?.data![0].country = arrayOfcountries[row]
                break
            default:
                userGenderTextField.text =  arrayOfGender[row]
                break
        }
      }
      func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
      }
      func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 60.0
      }
      func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            
            switch activeTextField{
            case 1:
                var label:UILabel
                if let v = view as? UILabel{
                    label = v
                }
                else{
                    label = UILabel()
                }
                label.textColor = UIColor.black
                label.font = UIFont(name: "Optima", size: 16)
                label.text = arrayOfGender[row]
                return label
            case 2:
                let parentView = UIView()
                let label = UILabel(frame: CGRect(x: 60, y: 0, width:300, height: 50))
                label.textColor = UIColor.black
                label.font = UIFont(name: "Optima", size: 16)
                label.text = arrayOfcountries[row]
                parentView.addSubview(label)
                return parentView
            default:
                return UILabel()
            }
        }
        
    }

//MARK:- TextField Delegate
extension UserProfileViewController : UITextFieldDelegate {
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            userNameTextField.resignFirstResponder()
            userEmailTextField.becomeFirstResponder()
        }else if textField == userEmailTextField {
            userEmailTextField.resignFirstResponder()
            rollingTextField.becomeFirstResponder()
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
        case userGenderTextField:
            activeTextField = 1
            picker.reloadAllComponents()
        case userCountryTextField:
            activeTextField = 2
            picker.reloadAllComponents()
        default:
            activeTextField = 0
        }
    }
}

extension UserProfileViewController {
    func getUserProfileDetailsAPI() {
        if NetworkManager.sharedInstance.isInternetAvailable(){
            self.showHUD(progressLabel: AlertField.loaderString)
            let stateURL : String = UrlName.baseUrl + UrlName.viewUserProfile
            let params = ["userId" : "3_0001_0008_00055_00"]  as [String : Any]
            NetworkManager.sharedInstance.commonNetworkCallWithHeader(header: [:], url: stateURL, method: .post, parameters: params, completionHandler: { (json, status) in
                guard let jsonValue = json else {
                    self.dismissHUD(isAnimated: true)
                    return
                }
                self.userProfile = Mapper<UserProfileModel>().map(JSONObject: jsonValue )
                
                if  self.userProfile?.code == 200, self.userProfile!.status {
                    if let list = self.userProfile?.data, !list.isEmpty {
                        self.updateProfileViewWithData(userDatObject: self.userProfile?.data![0])
                   }
                }
                self.dismissHUD(isAnimated: true)
            })
        }else{
            self.showNoInternetAlert()
        }
    }
    
    func updateUserProfileDetailsAPI(userDatObject : UserProfileData?) {
        if NetworkManager.sharedInstance.isInternetAvailable(){
            self.showHUD(progressLabel: AlertField.loaderString)
            let stateURL : String = UrlName.baseUrl + UrlName.updateUserProfileUrl + UrlName.API_Token
            let params = ["name" : userDatObject!.name, "gender" : userDatObject!.gender, "country" : userDatObject!.country, "email" : userDatObject!.email] as [String : Any]
            NetworkManager.sharedInstance.commonNetworkCallWithHeader(header: [:], url: stateURL, method: .post, parameters: params, completionHandler: { (json, status) in
                guard let jsonValue = json else {
                    self.dismissHUD(isAnimated: true)
                    return
                }
                self.userProfile = Mapper<UserProfileModel>().map(JSONObject: jsonValue )
                if  self.userProfile?.code == 200, self.userProfile!.status {
                    if let list = self.userProfile?.data, !list.isEmpty {
                        self.updateProfileViewWithData(userDatObject: self.userProfile?.data![0])
                    }
                } else {
                    self.userProfile?.data! = []
                    self.userProfile?.data?.append(userDatObject!)
                }
                self.dismissHUD(isAnimated: true)
            })
        }else{
            self.showNoInternetAlert()
        }
    }
}

