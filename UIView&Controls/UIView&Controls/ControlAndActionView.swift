//
//  ControlAndActionView.swift
//  UIView&Controls
//
//  Created by henrytran1803 on 2/20/25.
//

import Foundation
import UIKit


public class ControlAndActionView: UIView {
    // MARK: - Declare UI
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        return button
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Hello, World!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.addTarget(self, action: #selector(handleSwitchChange), for: .valueChanged)
        return switchControl
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    var progress: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progress = 0.5
        return progress
    }()
    
    var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["One", "Two", "Three"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        return segmentedControl
    }()
    
    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(button)
        addSubview(label)
        addSubview(switchControl)
        addSubview(activityIndicator)
        addSubview(progress)
        addSubview(segmentedControl)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            switchControl.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            switchControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            activityIndicator.topAnchor.constraint(equalTo: switchControl.bottomAnchor, constant: 20),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            progress.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 20),
            progress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            progress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            segmentedControl.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            segmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - Handlers
    @objc func handleTap() {
        label.text = "Button Tapped!"
    }
    
    @objc func handleSwitchChange() {
        let state = switchControl.isOn ? "ON" : "OFF"
        label.text = "Switch is \(state)"
    }
    
    @objc func handleSegmentChange() {
        let selected = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) ?? ""
        label.text = "Selected: \(selected)"
    }
}
