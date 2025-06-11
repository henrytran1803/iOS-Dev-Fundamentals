//
//  ThirdViewController.swift
//  HomeWork_Buoi13_TranVietAnh
//
//  Created by Việt Anh Trần on 11/6/25.
//
import UIKit

class ThirdViewController: UIViewController {

    private let yearTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter year (2025)"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        return tf
    }()

    private let regionTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter region (de)"
        tf.borderStyle = .roundedRect
        return tf
    }()

    private let fetchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fetch Holidays", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        fetchButton.addTarget(self, action: #selector(fetchButtonTapped), for: .touchUpInside)
    }

    private func setupUI() {
        [yearTextField, regionTextField, fetchButton, label].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            yearTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            yearTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            yearTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            regionTextField.topAnchor.constraint(equalTo: yearTextField.bottomAnchor, constant: 12),
            regionTextField.leadingAnchor.constraint(equalTo: yearTextField.leadingAnchor),
            regionTextField.trailingAnchor.constraint(equalTo: yearTextField.trailingAnchor),

            fetchButton.topAnchor.constraint(equalTo: regionTextField.bottomAnchor, constant: 20),
            fetchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            label.topAnchor.constraint(equalTo: fetchButton.bottomAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: yearTextField.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: yearTextField.trailingAnchor),
            label.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        ])
    }

    @objc private func fetchButtonTapped() {
        guard let yearText = yearTextField.text,
              let year = Int(yearText),
              let region = regionTextField.text?.lowercased(),
              !region.isEmpty else {
            label.text = "Please enter valid year and region."
            return
        }

        let api = HolidayAPI(year: year, region: region)
        api.execute { [weak self] result in
            switch result {
            case let .success(response):
                let holidayText = response
                    .sorted { $0.key < $1.key }
                    .map { "\($0.key): \($0.value)" }
                    .joined(separator: "\n")

                self?.label.text = holidayText
                print("Holidays: \(response)")
            case let .failure(error):
                self?.label.text = "Error: \(error.localizedDescription)"
                print("Error fetching holidays: \(error.localizedDescription)")
            }
        }
    }
}
