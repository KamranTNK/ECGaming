//
//  DatePickerView.swift
//  ECGame
//
//  Created by hfcb on 1/21/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import UIKit
import SimpleAnimation

class DatePickerView: UIView{

    //MARK:- IBOutlet
    @IBOutlet weak var pickerView: UIDatePicker!
    @IBOutlet weak var customPickerView: UIView!
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var cancelBtnOutlet: UIButton!
    @IBOutlet weak var okBtnOutlet: UIButton!
    
    //MARK:- Let/Var
    let dateFormatter = DateFormatter()
    weak var delegate:datePickerOpen?
    
    //MARK:- View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        dateTitle.text = AlertField.selectDateString.localiz()
        cancelBtnOutlet.setTitle(AlertField.cancelString.localiz(), for: .normal)
        okBtnOutlet.setTitle(AlertField.okString.localiz(), for: .normal)
        let identifier = LanguageManager.shared.currentLanguage
        pickerView.locale = NSLocale.init(localeIdentifier: identifier.rawValue) as Locale
    }
    override func layoutSubviews() {
        cancelBtnOutlet.setCornerRadiusOfButton(cornerRadiusValue: 10)
        okBtnOutlet.setCornerRadiusOfButton(cornerRadiusValue: 10)
        customPickerView.setCornerRadiusOfView(cornerRadiusValue: 20)
    }
    
    //MARK:- IBAction
    @IBAction func OnClickCancelButton(_ sender: UIButton) {
        self.removePickerView()
        delegate?.opendatePickerAction(selectedDate: "")
    }
    @IBAction func OnClickOkButton(_ sender: UIButton) {
        self.removePickerView()
        self.setDateToButtonObject()
    }

    //MARK:- IBAction Method
    func removePickerView() {
        self.popIn()
        self.removeFromSuperview()
    }
    func setDateToButtonObject() {
        delegate?.opendatePickerAction(selectedDate: dateFormatter.string(from: pickerView.date))
    }
}
