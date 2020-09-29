import UIKit

class MainViewController: UIViewController {

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
        imageview.image = UIImage(named:"covid19-logo")
//        imageview.makeRounded()
        return imageview
        
    }()
    
    private let regBtn: AuthUIBtn = {
        let button = AuthUIBtn(type: .system)
        button.setTitle("Create an Account", for: .normal)
        button.titleLabel?.font=UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
        button.addTarget(self, action: #selector(showRegPage), for: .touchUpInside)
        
        return button
    } ()
    
    private let loginButton: AuthUIBtn = {
        let button = AuthUIBtn(type: .system)
        button.setTitle("Already Have an Account?", for: .normal)
        button.titleLabel?.font=UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.light)
        button.addTarget(self, action: #selector(showLoginPage), for: .touchUpInside)
        
        return button
    }()

    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    @objc func showRegPage() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func showLoginPage() {
          let vc = LoginViewController()
          navigationController?.pushViewController(vc, animated: true)
      }
        
         
    
    
     //MARk:- helper Function
    func configUI(){
        configNavBar()
        
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
        titleLabel.centerX(inView: view)
        
        view.addSubview(logoView)
        logoView.anchor(top: titleLabel.bottomAnchor, paddingTop: 50, width: 200, height: 157)
        logoView.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [regBtn, loginButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24

        view.addSubview(stack)
        stack.anchor(top: logoView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 100, paddingLeft: 16, paddingRight: 16)

    }
    
    
    
        func configNavBar(){
            navigationController?.navigationBar.isHidden = true
            navigationController?.navigationBar.barStyle = .default
        }
        
        
     

    }
