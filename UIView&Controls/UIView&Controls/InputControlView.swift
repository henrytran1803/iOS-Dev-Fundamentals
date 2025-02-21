//
//  InputControlView.swift
//  UIView&Controls
//
//  Created by henrytran1803 on 2/19/25.
//
import UIKit

class InputControlView: UIView, UITextFieldDelegate, UITextViewDelegate, UISearchBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: - Declare
    var labelView: UILabel = {
        let labelView = UILabel()
        labelView.textColor = .black
        labelView.text = "Input Control"
        labelView.textAlignment = .center
        labelView.numberOfLines = 0
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.placeholder = "Enter text..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .systemBackground
        searchBar.layer.cornerRadius = 8
        searchBar.layer.masksToBounds = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 8
        textView.layer.masksToBounds = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()

    var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()

    // Dữ liệu cho UIPickerView
    let pickerData = ["Option 1", "Option 2", "Option 3", "Option 4"]

    // MARK: - INIT

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()

        // Gán delegate
        textField.delegate = self
        textView.delegate = self
        searchBar.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        datePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UI

    private func setupUI() {
        addSubview(labelView)
        addSubview(textField)
        addSubview(searchBar)
        addSubview(textView)
        addSubview(pickerView)
        addSubview(datePicker)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            searchBar.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            textView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            pickerView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8),
            pickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            pickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            datePicker.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 8),
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            labelView.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 8),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }

    // MARK: - Delegate Methods

    // ✅ `UITextField` cập nhật label khi nhấn Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        labelView.text = "TextField: \(textField.text ?? "")"
        textField.resignFirstResponder()
        return true
    }

    // ✅ `UITextView` cập nhật label khi thay đổi nội dung
    func textViewDidChange(_ textView: UITextView) {
        labelView.text = "TextView: \(textView.text ?? "")"
    }

    // ✅ `UISearchBar` cập nhật label khi nhập văn bản
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        labelView.text = "SearchBar: \(searchText)"
    }

    // ✅ `UIPickerView` cập nhật label khi chọn giá trị
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelView.text = "PickerView: \(pickerData[row])"
    }

    // ✅ `UIDatePicker` cập nhật label khi thay đổi ngày
    @objc func datePickerChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        labelView.text = "DatePicker: \(formatter.string(from: sender.date))"
    }
}
