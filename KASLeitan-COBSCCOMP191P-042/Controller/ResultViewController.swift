import UIKit

class SurveyResultViewController: UIViewController {

    var result: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        self.view.backgroundColor = .white
        setupViews()
    }
    
    func showRating() {
        var rating = ""
        var color = UIColor.black
        guard let percent = result else { return }
        if percent < 5 {
            rating = "VERY LOW"
            color = UIColor.riskLevelGreen
        } else if percent <= 25 {
            rating = "LOW"
            color = UIColor.riskLevelBlue
        }  else if percent <= 50 {
            rating = "MEDIUM"
            color = UIColor.riskLevelLightYellow
        } else if percent <= 75 {
            rating = "HIGH"
            color = UIColor.riskLevelDarkYellow
        } else if percent <= 100 {
            rating = "VERY HIGH"
            color = UIColor.appNameColor
        }
        lblRating.text = "\(rating)"
        lblRating.textColor=color
    }
    
    @objc func btnGoBackAction() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setupViews() {
        
        self.view.addSubview(lblTitle)
        lblTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80).isActive=true
        lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblTitle.widthAnchor.constraint(equalToConstant: 400).isActive=true
        lblTitle.heightAnchor.constraint(equalToConstant: 80).isActive=true
//        lblTitle.anchor(top: lblTitle.bottomAnchor, paddingTop: 50)
        
        self.view.addSubview(lblScore)
        lblScore.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 115).isActive=true
        lblScore.anchor(top: lblTitle.bottomAnchor, paddingTop: 200)
                lblScore.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
                lblScore.widthAnchor.constraint(equalToConstant: 350).isActive=true
                lblScore.heightAnchor.constraint(equalToConstant: 150).isActive=true
        lblScore.text = "\(result!)%"
        
        self.view.addSubview(lblRating)
        lblRating.topAnchor.constraint(equalTo: lblScore.bottomAnchor, constant: 75).isActive=true
        lblRating.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblRating.widthAnchor.constraint(equalToConstant: 250).isActive=true
        lblRating.heightAnchor.constraint(equalToConstant: 60).isActive=true
        showRating()
        
        self.view.addSubview(btnGoBack)
        btnGoBack.topAnchor.constraint(equalTo: lblRating.bottomAnchor, constant: 100).isActive=true
        btnGoBack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnGoBack.widthAnchor.constraint(equalToConstant: 200).isActive=true
        btnGoBack.heightAnchor.constraint(equalToConstant: 60).isActive=true
        btnGoBack.addTarget(self, action: #selector(btnGoBackAction), for: .touchUpInside)
    }
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
        lbl.text="Your Risk Level"
        lbl.textColor=UIColor.appNameColor
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 42)
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblScore: UILabel = {
        let lbl=UILabel()
        lbl.text="0 / 0"
        lbl.textColor=UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 100)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblRating: UILabel = {
        let lbl=UILabel()
        lbl.text="LOW"
        lbl.textColor=UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 40)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let btnGoBack: UIButton = {
        let btn = UIButton()
        btn.setTitle("Go Back", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .appNameColor
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

}
