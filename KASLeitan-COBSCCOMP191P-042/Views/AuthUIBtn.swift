import UIKit

class AuthUIBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        backgroundColor = UIColor.appNameColor
        layer.cornerRadius = 10
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    }
        
    required init?(coder: NSCoder) {
        fatalError("AuthButtonUIButton coder error")
    }

}
