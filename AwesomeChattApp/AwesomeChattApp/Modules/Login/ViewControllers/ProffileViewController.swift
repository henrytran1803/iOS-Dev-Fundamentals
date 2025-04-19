
// Custom Transition Animator
import UIKit
class ProfileTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let isPresenting: Bool
    let originFrame: CGRect
    
    init(isPresenting: Bool, originFrame: CGRect) {
        self.isPresenting = isPresenting
        self.originFrame = originFrame
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        if isPresenting {
            // Presenting animation (ContentVC -> DetailVC)
            guard let detailVC = toVC as? DetailProfileViewController,
                  let contentVC = fromVC as? ProfileContentViewController else {
                return
            }
            
            // Add the toVC's view to the container view
            containerView.addSubview(detailVC.view)
            detailVC.view.alpha = 0
            
            // Create a snapshot of the profile image to animate
            guard let originalImageView = contentVC.getProfileImageView(),
                  let targetImageView = detailVC.getProfileImageView() else {
                return
            }
            
            let originalFrame = originalImageView.convert(originalImageView.bounds, to: containerView)
            let finalFrame = targetImageView.convert(targetImageView.bounds, to: containerView)
            
            // Create a temporary image view to animate
            let tempImageView = UIImageView(frame: originalFrame)
            tempImageView.image = originalImageView.image
            tempImageView.contentMode = .scaleAspectFill
            tempImageView.clipsToBounds = true
            tempImageView.layer.cornerRadius = originalFrame.width / 2
            containerView.addSubview(tempImageView)
            
            // Hide the original and target image views during animation
            originalImageView.isHidden = true
            targetImageView.isHidden = true
            
            // Perform the animation
            UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: []) {
                tempImageView.frame = finalFrame
                tempImageView.layer.cornerRadius = finalFrame.width / 2
                detailVC.view.alpha = 1
            } completion: { _ in
                // Clean up
                tempImageView.removeFromSuperview()
                originalImageView.isHidden = false
                targetImageView.isHidden = false
                
                // Notify the transition context that we're done
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
            
        } else {
            // Dismissing animation (DetailVC -> ContentVC)
            guard let detailVC = fromVC as? DetailProfileViewController,
                  let contentVC = toVC as? ProfileContentViewController else {
                return
            }
            
            // Add the toVC's view to the container below the fromVC's view
            containerView.insertSubview(contentVC.view, belowSubview: detailVC.view)
            
            // Get the image views for animation
            guard let originalImageView = detailVC.getProfileImageView(),
                  let targetImageView = contentVC.getProfileImageView() else {
                return
            }
            
            let originalFrame = originalImageView.convert(originalImageView.bounds, to: containerView)
            let finalFrame = targetImageView.convert(targetImageView.bounds, to: containerView)
            
            // Create a temporary image view to animate
            let tempImageView = UIImageView(frame: originalFrame)
            tempImageView.image = originalImageView.image
            tempImageView.contentMode = .scaleAspectFill
            tempImageView.clipsToBounds = true
            tempImageView.layer.cornerRadius = originalFrame.width / 2
            containerView.addSubview(tempImageView)
            
            // Hide the original and target image views during animation
            originalImageView.isHidden = true
            targetImageView.isHidden = true
            
            // Animate the transition
            UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: []) {
                tempImageView.frame = finalFrame
                tempImageView.layer.cornerRadius = finalFrame.width / 2
                detailVC.view.alpha = 0
            } completion: { _ in
                // Clean up
                tempImageView.removeFromSuperview()
                originalImageView.isHidden = false
                targetImageView.isHidden = false
                
                // Notify the transition context that we're done
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
}

class ProfileContentViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    // MARK: - Properties
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.systemBlue.cgColor
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "profileImage")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Photographer"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGestures()
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .white
        
        // Add subviews
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(detailsLabel)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            detailsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            detailsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            detailsLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
    }
    
    private func setupGestures() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - Actions
    @objc private func profileImageTapped() {
        let detailVC = DetailProfileViewController()
        detailVC.profileImage = profileImageView.image
        detailVC.modalPresentationStyle = .custom
        detailVC.transitioningDelegate = self
        present(detailVC, animated: true)
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let originFrame = profileImageView.superview?.convert(profileImageView.frame, to: nil) else {
            return nil
        }
        return ProfileTransitionAnimator(isPresenting: true, originFrame: originFrame)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let originFrame = profileImageView.superview?.convert(profileImageView.frame, to: nil) else {
            return nil
        }
        return ProfileTransitionAnimator(isPresenting: false, originFrame: originFrame)
    }
    
    // Expose profileImageView for the transition animation
    func getProfileImageView() -> UIImageView? {
        return profileImageView
    }
}

// DetailProfileViewController.swift
class DetailProfileViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    // MARK: - Properties
    var profileImage: UIImage?
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tanya Nguyen"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "London, UK"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical latin."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let changePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let rippleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateRippleEffect()
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .white
        
        // Set the profile image
        profileImageView.image = profileImage
        
        // Add subviews
        view.addSubview(backgroundView)
        view.addSubview(rippleView)
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
        view.addSubview(changePhotoButton)
        view.addSubview(backButton)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.heightAnchor.constraint(equalToConstant: 200),
            
            rippleView.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            rippleView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            rippleView.widthAnchor.constraint(equalToConstant: 220),
            rippleView.heightAnchor.constraint(equalToConstant: 220),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 24),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bioLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 24),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            changePhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            changePhotoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            changePhotoButton.widthAnchor.constraint(equalToConstant: 40),
            changePhotoButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Configure the ripple view with rounded corners
        profileImageView.layer.cornerRadius = 100
        rippleView.layer.cornerRadius = 110
    }
    
    private func setupActions() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        changePhotoButton.addTarget(self, action: #selector(changePhotoButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Animations
    private func animateRippleEffect() {
        // Create multiple ripple layers for wave effect
        for i in 0..<3 {
            let rippleLayer = CAShapeLayer()
            let circularPath = UIBezierPath(arcCenter: .zero, radius: 110, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
            
            rippleLayer.path = circularPath.cgPath
            rippleLayer.lineWidth = 2.0
            rippleLayer.fillColor = UIColor.clear.cgColor
            rippleLayer.strokeColor = UIColor.systemBlue.withAlphaComponent(0.5).cgColor
            rippleLayer.position = CGPoint(x: rippleView.bounds.midX, y: rippleView.bounds.midY)
            rippleLayer.opacity = 0
            
            // Add the ripple layer to the ripple view
            rippleView.layer.addSublayer(rippleLayer)
            
            // Create animations
            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimation.fromValue = 1.0
            scaleAnimation.toValue = 1.3
            
            let opacityAnimation = CABasicAnimation(keyPath: "opacity")
            opacityAnimation.fromValue = 0.6
            opacityAnimation.toValue = 0
            
            let animationGroup = CAAnimationGroup()
            animationGroup.animations = [scaleAnimation, opacityAnimation]
            animationGroup.duration = 2.0
            animationGroup.repeatCount = .infinity
            animationGroup.timingFunction = CAMediaTimingFunction(name: .easeOut)
            animationGroup.beginTime = CACurrentMediaTime() + Double(i) * 0.6 // Stagger the animations
            
            rippleLayer.add(animationGroup, forKey: "rippleEffect")
        }
    }
    
    // MARK: - Actions
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func changePhotoButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
}

// MARK: - UIImagePickerControllerDelegate
// MARK: - UIViewControllerTransitioningDelegate
extension DetailProfileViewController {
    // Expose profileImageView for the transition animation
    func getProfileImageView() -> UIImageView? {
        return profileImageView
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let contentVC = dismissed as? ProfileContentViewController,
              let originFrame = contentVC.getProfileImageView()?.superview?.convert(contentVC.getProfileImageView()!.frame, to: nil) else {
            return nil
        }
        return ProfileTransitionAnimator(isPresenting: false, originFrame: originFrame)
    }
}

// MARK: - UIImagePickerControllerDelegate
extension DetailProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            profileImageView.image = selectedImage
        }
        
        picker.dismiss(animated: true)
    }
}
