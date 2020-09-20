import UIKit

protocol SurveyCVCellDelegate: class {
    func didChooseAnswer(btnIndex: Int)
}

class SurveyCVCell: UICollectionViewCell {
    
    var Yesbtn: UIButton!
    var Nobtn: UIButton!
    var btnsArray = [UIButton]()
    
    weak var delegate: SurveyCVCellDelegate?
    
    var question: Question? {
        didSet {
            guard let unwrappedQue = question else { return }
            imgView.image = UIImage(named: unwrappedQue.imgName)
            lblQue.text = unwrappedQue.question
            Yesbtn.setTitle("YES", for: .normal)
            Nobtn.setTitle("NOPE", for: .normal)
            
            if unwrappedQue.isAnswered {
                if unwrappedQue.positiveAns == true {
                    Yesbtn.backgroundColor = .liteThemeColor
                } else {
                    Nobtn.backgroundColor = .liteThemeColor
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        btnsArray = [Yesbtn, Nobtn]
    }
    
    @objc func btnOptionAction(sender: UIButton) {
        guard let unwrappedQue = question else { return }
        if !unwrappedQue.isAnswered {
            delegate?.didChooseAnswer(btnIndex: sender.tag)
        }
    }
    
    override func prepareForReuse() {
        Yesbtn.backgroundColor=UIColor.white
        Nobtn.backgroundColor=UIColor.white
    }
    
    func setupViews() {
        addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100).isActive=true
        imgView.widthAnchor.constraint(equalToConstant: 350).isActive=true
        imgView.heightAnchor.constraint(equalToConstant: 300).isActive=true
        imgView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
        
        addSubview(lblQue)
        lblQue.topAnchor.constraint(equalTo: imgView.bottomAnchor).isActive=true
        lblQue.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive=true
        lblQue.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive=true
        lblQue.heightAnchor.constraint(equalToConstant: 150).isActive=true
        
        let btnWidth: CGFloat = 150
        let btnHeight: CGFloat = 50
        Yesbtn = getButton(tag: 0)
        addSubview(Yesbtn)
        NSLayoutConstraint.activate([Yesbtn.topAnchor.constraint(equalTo: lblQue.bottomAnchor, constant: 20), Yesbtn.rightAnchor.constraint(equalTo: self.centerXAnchor, constant: -10), Yesbtn.widthAnchor.constraint(equalToConstant: btnWidth), Yesbtn.heightAnchor.constraint(equalToConstant: btnHeight)])
        Yesbtn.addTarget(self, action: #selector(btnOptionAction), for: .touchUpInside)
        
        Nobtn = getButton(tag: 1)
        addSubview(Nobtn)
        NSLayoutConstraint.activate([Nobtn.topAnchor.constraint(equalTo: Yesbtn.topAnchor), Nobtn.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: 10), Nobtn.widthAnchor.constraint(equalToConstant: btnWidth), Nobtn.heightAnchor.constraint(equalToConstant: btnHeight)])
        Nobtn.addTarget(self, action: #selector(btnOptionAction), for: .touchUpInside)
    }
    
        let btnGoBack: UIButton = {
        let btn = UIButton()
        btn.setTitle("Go Back", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()  //im not sure abt this 

    func getButton(tag: Int) -> UIButton {
        let btn=UIButton()
        btn.tag=tag
        btn.setTitle("Option", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.darkGray.cgColor
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }
    
    let imgView: UIImageView = {
        let imgV=UIImageView()
        imgV.image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
        imgV.contentMode = .scaleAspectFit
        imgV.translatesAutoresizingMaskIntoConstraints=false
        return imgV
    }()
    
    let lblQue: UILabel = {
        let lbl=UILabel()
        lbl.text="This is a question and you have to answer it?"
        lbl.textColor=UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines=4
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
