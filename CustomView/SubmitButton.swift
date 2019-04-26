
import UIKit

class SubmitButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        titleLabel?.numberOfLines = 0
        titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        backgroundColor     = UIColor(red: 21/255, green: 205/255, blue: 168/255, alpha: 1)
        titleLabel?.font    = UIFont(name: "avenirNextCondensedDemiBold", size: 22)
        layer.cornerRadius  = frame.size.height/2
        setTitleColor(.white, for: .normal)
    }
}
