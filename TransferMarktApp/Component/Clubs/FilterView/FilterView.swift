//
//  FilterView.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 13.04.2022.
//

import UIKit

protocol FilterViewDelegate{
    func filterBtnTapped(selectedLig: String)
}

class FilterView: UIView, CustomViewProtocol {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    var delegate: FilterViewDelegate?
    
    private var selectedLig: LigName?
    private lazy var pickerView = UIPickerView()
    private lazy var ligs = LigName.allCases
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initiliaze()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initiliaze()
    }
    
    private func initiliaze(){
        commonInit(for: nibName())
        createPickerView()
        textField.placeholder = "Lig Seç"
    }
    
    private func createPickerView(){
        pickerView.delegate = self
        pickerView.dataSource = self
        textField.inputView = pickerView
        createToolbar()
    }
    
    private func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissPicker))
        toolBar.setItems([doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    @objc private func dismissPicker() {
        contentView.endEditing(true)
        delegate?.filterBtnTapped(selectedLig: selectedLig?.rawValue ?? "")
    }
}

// pickerview reusable yap
extension FilterView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ligs.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ligs[row].ligName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = ligs[row].ligName
        selectedLig = ligs[row]
    }
}
