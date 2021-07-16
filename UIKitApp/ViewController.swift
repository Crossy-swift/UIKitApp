//
//  ViewController.swift
//  UIKitApp
//
//  Created by Артем Репин on 16.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var sliderLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // mainLabel
        mainLabel.text = ""
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // SegmentedControl
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .yellow
        slider.thumbTintColor = .blue
        
        // sliderLabel
        sliderLabel.text = String(slider.value)
        
        // datePicker
        // ios locale identifier
        datePicker.locale = Locale(identifier: "ru_RU")
        
    }
    
    @IBAction func segmentedControlAction() {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
            sliderLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
            sliderLabel.textColor = .blue
        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .orange
            sliderLabel.textColor = .orange
        }
    }
    
    @IBAction func sliderAction() {
        sliderLabel.text = String(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
           showAlert(with: "Text field is empty", and: "Please enter your Name")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", and: "Please enter your Name")
            return
        }
        
        mainLabel.text = textField.text
        textField.text = ""
    }
    
    @IBAction func chooseDate() {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.locale = Locale(identifier: "ru_RU")
        mainLabel.text = dateFormater.string(from: datePicker.date)
    }
    
}

// MARK: - Private Methods
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}
