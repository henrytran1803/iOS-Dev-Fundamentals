//
//  ViewController.swift
//  UIKITBasic
//
//  Created by henrytran1803 on 2/6/25.
//

import UIKit

// MARK: - Container ViewController
class ViewController: UIViewController {
    
    private var menuVC: MenuViewController?
    private var mainVC: MainViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViewControllers()
    }
    
    private func setupChildViewControllers() {
        // Khởi tạo child viewcontrollers
        let menuViewController = MenuViewController()
        let mainViewController = MainViewController()
        
        // Add Menu VC như một child
        addChild(menuViewController)
        view.addSubview(menuViewController.view)
        menuViewController.view.frame = CGRect(x: 0, y: 0,
                                             width: 200,
                                             height: view.bounds.height)
        menuViewController.didMove(toParent: self)
        
        // Add Main VC như một child
        addChild(mainViewController)
        view.addSubview(mainViewController.view)
        mainViewController.view.frame = CGRect(x: 200, y: 0,
                                             width: view.bounds.width - 200,
                                             height: view.bounds.height)
        mainViewController.didMove(toParent: self)
        
        // Lưu reference
        self.menuVC = menuViewController
        self.mainVC = mainViewController
        
        // Setup delegate cho menu
        menuViewController.delegate = self
    }
    
    private func removeChildViewController(_ viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

// MARK: - Menu ViewController
protocol MenuViewControllerDelegate: AnyObject {
    func didSelectMenuItem(_ item: MenuItem)
}

class MenuViewController: UIViewController {
    
    weak var delegate: MenuViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupMenuItems()
    }
    
    private func setupMenuItems() {
        // Setup menu buttons/items
        let button = UIButton(frame: CGRect(x: 20, y: 100, width: 160, height: 44))
        button.setTitle("Menu Item 1", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func buttonTapped() {
        delegate?.didSelectMenuItem(.item1)
    }
}

// MARK: - Main ViewController
class MainViewController: UIViewController {
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Main Content"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        contentLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
        contentLabel.center = view.center
        view.addSubview(contentLabel)
    }
    
    func updateContent(for menuItem: MenuItem) {
        contentLabel.text = "Selected: \(menuItem)"
    }
}

// MARK: - Menu Delegate
extension ViewController: MenuViewControllerDelegate {
    func didSelectMenuItem(_ item: MenuItem) {
        mainVC?.updateContent(for: item)
    }
}

// MARK: - MenuItem Enum
enum MenuItem {
    case item1
    case item2
    case item3
}
