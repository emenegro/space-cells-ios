
import UIKit

class PosterInfoViewController: UIAlertController {

    override var preferredStyle: UIAlertControllerStyle {
        return .alert
    }
    
    init(title: String, message: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.title = title
        self.message = message
        
        let acceptString = NSLocalizedString("txt_accept", comment: "")
        let acceptAction = UIAlertAction(title: acceptString, style: .cancel, handler: { [weak self] (action) -> Void in
            self?.dismiss(animated: true, completion: nil)
        })
        
        addAction(acceptAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
