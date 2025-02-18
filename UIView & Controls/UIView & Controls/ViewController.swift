//
//  ViewController.swift
//  UIView & Controls
//
//  Created by henrytran1803 on 2/17/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Components"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let standardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Standard Button", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text here"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let items = ["First", "Second", "Third"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    private let switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Switch Control"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private let progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.progress = 0.7
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    private let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.value = 5
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    private let stepperLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [titleLabel, standardButton, textField, segmentedControl,
         slider, switchControl, switchLabel, activityIndicator,
         progressView, stepper, stepperLabel, imageView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        // ScrollView constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // Component constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            standardButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            standardButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            standardButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            standardButton.heightAnchor.constraint(equalToConstant: 44),
            
            textField.topAnchor.constraint(equalTo: standardButton.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            segmentedControl.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            slider.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            slider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            switchControl.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 20),
            switchControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            switchLabel.centerYAnchor.constraint(equalTo: switchControl.centerYAnchor),
            switchLabel.leadingAnchor.constraint(equalTo: switchControl.trailingAnchor, constant: 10),
            
            activityIndicator.topAnchor.constraint(equalTo: switchControl.bottomAnchor, constant: 20),
            activityIndicator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            progressView.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 20),
            progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            stepper.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 20),
            stepper.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            stepperLabel.centerYAnchor.constraint(equalTo: stepper.centerYAnchor),
            stepperLabel.leadingAnchor.constraint(equalTo: stepper.trailingAnchor, constant: 10),
            
            imageView.topAnchor.constraint(equalTo: stepper.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupActions() {
        standardButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        switchControl.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
    }
    
    // MARK: - Actions
    @objc private func buttonTapped() {
        let alert = UIAlertController(title: "Button Tapped",
                                    message: "You tapped the standard button",
                                    preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        print("Selected segment: \(sender.selectedSegmentIndex)")
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        print("Slider value: \(sender.value)")
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        print("Switch value: \(sender.isOn)")
    }
    
    @objc private func stepperValueChanged(_ sender: UIStepper) {
        stepperLabel.text = "\(Int(sender.value))"
    }
}
