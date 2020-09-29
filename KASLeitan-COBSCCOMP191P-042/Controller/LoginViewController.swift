import UIKit
import FirebaseAuth
import MapKit
import LocalAuthentication

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Helvetica", size: 36)
        label.textColor = UIColor.appNameColor
        
        return label
    }()
    
    private lazy var logoView: UIImageView = {
        let imageview = UIImageView()
        //        imageview.frame = CGRect(x: 0, y: 0, width: 10, height: 25)
        imageview.image = UIImage(named:"covid19-logo")
        //        imageview.makeRounded()
        //        imageview.layer.masksToBounds = true
        
        // view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageview
        
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFiled)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let emailTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let passwordTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    private let loginButton: AuthUIBtn = {
        let button = AuthUIBtn(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()
    
    let regBtn: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't Have an Account Yet?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        attributedTitle.append(NSAttributedString(string: "Register", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.appNameColor]))
        
        button.addTarget(self, action: #selector(handleShowRegister), for: .touchUpInside)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NawBar
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Videos"
        
        configureUI()
    }
    
    
    // MARK: - Selectors
    
    @objc func handleSignIn() {
        guard let email = emailTextFiled.text else { return }
        guard let password = passwordTextFiled.text else { return }
        
        if(email.count==0){
            let ac = UIAlertController(title: "Log In", message: "Please enter email", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
            self.present(ac, animated: true)
            return;
        }
        
        if(!email.contains("@") || !email.contains(".")){
            let ac = UIAlertController(title: "Log In", message: "Please enter email correctly", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
            self.present(ac, animated: true)
            return;
        }
        
        if(password.count==0){
            let ac = UIAlertController(title: "Log In", message: "Please enter password", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
            self.present(ac, animated: true)
            return;
        }
        
        if(password.count<6){
            let ac = UIAlertController(title: "Log In", message: "Password should contain least 6 charactors", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
            self.present(ac, animated: true)
            return;
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                let ac = UIAlertController(title: "Log In", message: "\(error.localizedDescription)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
                self.present(ac, animated: true)
                print("DEBUG: Failed to log user with error \(error.localizedDescription)")
                return
            }
            
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            
            guard let controller = keyWindow?.rootViewController as? MainTabBarController else { return }
            controller.setTabBar()
            
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func handleShowRegister() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Helper Function
    
    func configureUI() {
        
        configureNavigationBar()
        
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 50)
        titleLabel.centerX(inView: view)
        
        view.addSubview(logoView)
        logoView.anchor(top: titleLabel.bottomAnchor, paddingTop: 50, width: 200, height: 140)
        logoView.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: logoView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(regBtn)
        regBtn.centerX(inView: view)
        regBtn.anchor(top: loginButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .default
    }
    
    
    
    
    
    
}
