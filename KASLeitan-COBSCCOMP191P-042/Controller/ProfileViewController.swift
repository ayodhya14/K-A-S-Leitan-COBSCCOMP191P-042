import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    var safeArea: UILayoutGuide!
    
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        let boldConfig = UIImage.SymbolConfiguration(pointSize: .zero, weight: .bold, scale: .large)
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: boldConfig), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleGoBack), for: .touchUpInside)
        return button
    }()
    
    private let titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont(name: "Helvetica", size: 26)
        label.textColor = .black
        return label
    }()
    
    private let blankView: UIView = {
        let blank = UIView()
        blank.backgroundColor = .white
        return blank
    }()
    
    private lazy var logoView: UIImageView = {
        let imageview = UIImageView()
        imageview.frame = CGRect(x: 0, y: 0, width: 100, height:100)
        imageview.image = UIImage(named:"Avatar")
        imageview.layer.masksToBounds = true
        
        // view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageview
        
    }()
    
    private lazy var profileContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_account_box_white_2x"), textField: nameTextFiled)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let nameTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Name", isSecureTextEntry: false)
    }()
    
    private lazy var indexContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "indexicon"), textField: indexTextFiled )
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let indexTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Index", isSecureTextEntry: false)
    }()
    
    private lazy var countryContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "country"), textField: countryTextFiled )
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let countryTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Country", isSecureTextEntry: false)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        configUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleGoBack() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func configUI() {
        configNavBar()
        view.backgroundColor = .systemGray6
        
        view.addSubview(titleLbl)
        titleLbl.anchor(top: safeArea.topAnchor, paddingTop: 20)
        titleLbl.centerX(inView: view)
        view.addSubview(backButton)
        backButton.anchor(top: safeArea.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 16, width: 38, height: 38)
        view.addSubview(blankView)
        blankView.anchor(top: titleLbl.bottomAnchor, left: view.leftAnchor, bottom: safeArea.bottomAnchor, right: view.rightAnchor, paddingTop: 20)
        
        view.addSubview(logoView)
        logoView.anchor(top: titleLbl.bottomAnchor, paddingTop: 100, width: 150, height: 160)
        logoView.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [profileContainerView,indexContainerView,countryContainerView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: logoView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 16, paddingRight: 16)
    }
    
    func configNavBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .default
    }
    
}
