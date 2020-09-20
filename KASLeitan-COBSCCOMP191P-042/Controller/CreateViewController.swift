import UIKit
import FirebaseAuth

class CreateViewController: UIViewController {
    
        // MARK: - Properties

      private var user: User? {
               didSet {
                   tempLbl.text = user!.temperature
               }
           }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "CREATE+"
        label.font = UIFont(name: "Helvetica", size: 30)
        label.textColor = .black
        
        return label
    }()
    
    // Notifications tile
    
    private let createNotify: UIButton = {
        let cnBtn = UIButton()
        cnBtn.backgroundColor = UIColor.liteThemeColor
        cnBtn.layer.cornerRadius = 5
        cnBtn.layer.masksToBounds = true
        cnBtn.addTarget(self, action: #selector(showNotifications), for: .touchUpInside)
    
        let createNotifyLabel = UILabel()
        createNotifyLabel.text = "Create Notifications"
        createNotifyLabel.font = UIFont(name: "Helvetica", size: 18)
        createNotifyLabel.textColor = UIColor.black
        cnBtn.addSubview(createNotifyLabel)
        createNotifyLabel.anchor(left: cnBtn.leftAnchor, paddingLeft: 20)
        createNotifyLabel.centerY(inView: cnBtn)
    
        let createNotifyArrow = UIImageView()
        createNotifyArrow.image = UIImage(systemName: "chevron.right")
        createNotifyArrow.tintColor = .black
        createNotifyArrow.layer.masksToBounds = true
        cnBtn.addSubview(createNotifyArrow)
        createNotifyArrow.anchor(right: cnBtn.rightAnchor, paddingRight: 20)
        createNotifyArrow.centerY(inView: cnBtn)

        return cnBtn
    }()
    
    
    private let newSurvey: UIButton = {
        let nsBtn = UIButton()
        nsBtn.backgroundColor = UIColor.liteThemeColor
        nsBtn.layer.cornerRadius = 5
        nsBtn.layer.masksToBounds = true
        nsBtn.addTarget(self, action: #selector(showNewSurvey), for: .touchUpInside)
    
    let newSurveyLabel = UILabel()
        newSurveyLabel.text = "New Survey"
        newSurveyLabel.font = UIFont(name: "Helvetica", size: 18)
        newSurveyLabel.textColor = UIColor.black
        nsBtn.addSubview(newSurveyLabel)
        newSurveyLabel.anchor(left: nsBtn.leftAnchor, paddingLeft: 20)
        newSurveyLabel.centerY(inView: nsBtn)
    
        let newSurveyArrow = UIImageView()
        newSurveyArrow.image = UIImage(systemName: "chevron.right")
        newSurveyArrow.tintColor = .black
        newSurveyArrow.layer.masksToBounds = true
        nsBtn.addSubview(newSurveyArrow)
        newSurveyArrow.anchor(right: nsBtn.rightAnchor, paddingRight: 20, width: 14, height: 24)
        newSurveyArrow.centerY(inView: nsBtn)
        
        return nsBtn
    }()

        private let tempTF: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 5.0
        tf.layer.masksToBounds = true
        tf.keyboardType = .decimalPad
        tf.textAlignment = .center
        return tf
    }()
    
    private let tempLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "37°C"
        lbl.font = UIFont.systemFont(ofSize: 46)
        return lbl
    }()
    
    private lazy var tempTile: UIView = {
        let tile = UIView()
        tile.backgroundColor = .white
        tile.layer.cornerRadius = 5
        tile.layer.masksToBounds = true
        
        tile.addSubview(tempLbl)
        tempLbl.anchor(top: tile.topAnchor, paddingTop: 40)
        tempLbl.centerX(inView: tile)
        
        let timeAgo = UILabel()
        timeAgo.text = "Last Update: 1 Day ago"
        timeAgo.font = UIFont.systemFont(ofSize: 12)
        timeAgo.textColor = .darkGray
        tile.addSubview(timeAgo)
        timeAgo.anchor(top: tempLbl.bottomAnchor, paddingTop: 20)
        timeAgo.centerX(inView: tile)
        
        tile.addSubview(tempTF)
        tempTF.anchor(top: timeAgo.bottomAnchor, paddingTop: 40, width: 100)
        tempTF.centerX(inView: tile)
        
        let tempBtn = UIButton()
        tempBtn.setTitle("UPDATE", for: .normal)
        tempBtn.setTitleColor(.black, for: .normal)
        tempBtn.layer.borderColor = UIColor.black.cgColor
        tempBtn.layer.borderWidth = 0.5
        tempBtn.layer.cornerRadius = 5.0
        tempBtn.layer.masksToBounds = true
        tempBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        tempBtn.addTextSpacing(2)
        tempBtn.addTarget(self, action: #selector(handleTempUpdate), for: .touchUpInside)
        tile.addSubview(tempBtn)
        tempBtn.anchor(top: tempTF.bottomAnchor, paddingTop: 35, width: 120, height: 40)
        tempBtn.centerX(inView: tile)
        
        return tile
    }()

        let scrollView: UIScrollView = {
        let sv = UIScrollView()
        let screensize: CGRect = UIScreen.main.bounds
        sv.contentSize = CGSize(width: screensize.width - 2.0, height: screensize.height)
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        self.fetchUserData()
    }
    
    // MARK: - Selectors
    
    @objc func showNotifications() {
        let nav = UINavigationController(rootViewController: CreateNotificVC())
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
        
    }
    
    @objc func showNewSurvey() {
        let vc = SurveyViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: false)
    }

    @objc func handleTempUpdate() {
        guard let temp = tempTF.text else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let temperature = Float(temp)
        
        // 102°F - 103°F for COVID19
        // 38.8°C - 39.4°C for COVID19
        
        if temperature == nil {
            let alert = UIAlertController(title: "Temprature is Required!", message: "Please enter your body temprature", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else if (temperature! < 34.0) || (temperature! > 47.0)  {
            let alert = UIAlertController(title: "Invalid Temprature!", message: "Body temprature cannot be lessthan 34°C or greaterthan 47°C", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            self.view.endEditing(true)
            let values = [
                "temperature": temp
                ] as [String : Any]
            self.uploadUserTemperature(uid: currentUid, values: values)
            self.tempTF.text = ""
        }
    }
    
        // MARK: - API
    
    func fetchUserData() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        Service.shared.fetchUserData(uid: currentUid) { (user) in
            self.user = user
            self.configUI()
        }
    }

// MARK: - HelperFunctions

    
    func configUI() {
        configNavBar()
                view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 50, paddingLeft: 20)
    //    titleLabel.centerX(inView: view)

            view.addSubview(scrollView)
        scrollView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 1.0, paddingLeft: 1.0, paddingBottom: -1.0, paddingRight: -1.0)
        
        scrollView.addSubview(createNotify)

                if (user?.role ?? "") as String == "1" {
            createNotify.anchor(top: scrollView.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 16, paddingRight: 16, height: 70)
        }

                scrollView.addSubview(newSurvey)
        newSurvey.anchor(top: createNotify.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 16, paddingRight: 16, height: 70)
        
                scrollView.addSubview(tempTile)
        tempTile.anchor(top: newSurvey.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 16, paddingRight: 16, height: 300)
        
        
    }
    
    func configNavBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .default
    }

            func uploadUserTemperature(uid: String, values: [String: Any]) {
        REF_USERS.child(uid).updateChildValues(values) { (error, ref) in
            if error == nil {
                print("No error")
                //self.tempLbl.text = values.first?.value as? String
                self.tempLbl.text = "\(values["temperature"] as? String ?? "37")°C"
            }
        }
    }
    
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        })
    }


    
}
