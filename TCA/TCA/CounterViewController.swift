//
//  CounterViewController.swift
//  TCA
//
//  Created by Việt Anh Trần on 27/4/25.
//
import UIKit
import Combine
import ComposableArchitecture

class CounterViewController: UIViewController {
    let store: StoreOf<CounterReducer>
    private let viewStore: ViewStoreOf<CounterReducer>
    
    private let countLabel = UILabel()
    private let incrementButton = UIButton(type: .system)
    private let decrementButton = UIButton(type: .system)
    
    private var cancellables: Set<AnyCancellable> = []

    init(store: StoreOf<CounterReducer>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        bind()
    }
    
    private func setupUI() {
        countLabel.font = .systemFont(ofSize: 36)
        countLabel.textAlignment = .center
        incrementButton.setTitle("+", for: .normal)
        decrementButton.setTitle("-", for: .normal)
        
        let stack = UIStackView(arrangedSubviews: [decrementButton, countLabel, incrementButton])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func bind() {
        viewStore.publisher.count()
            .sink { [weak self] count in
                self?.countLabel.text = "\(count)"
            }
            .store(in: &cancellables)
        
        incrementButton.addTarget(self, action: #selector(didTapIncrement), for: .touchUpInside)
        decrementButton.addTarget(self, action: #selector(didTapDecrement), for: .touchUpInside)
    }
    
    @objc private func didTapIncrement() {
        viewStore.send(.incrementButtonTapped)
    }
    
    @objc private func didTapDecrement() {
        viewStore.send(.decrementButtonTapped)
    }
}
