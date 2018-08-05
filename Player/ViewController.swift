
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultView: UITextField!
    
    var numberButtons: [UIButton] = []
    
    @IBAction func numberButtonTouched(_ sender: Any) {
        if let button = sender as? UIButton {
            handleNumber(button.tag % 10)
        }
    }
    
    func handleNumber(_ number: Int) {
        resultView.text = number.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadButtons()
    }
    
    func loadButtons() {
        for index in 0 ..< 10 {
            let button = loadButton(index: index)
            numberButtons.append(button)
            button.addTarget(self, action: #selector(numberButtonTouched), for: UIControlEvents.touchDown)
        }
    }
    
    func loadButton(index: Int) -> UIButton {
        let tag = index == 0 ? 10 : index
        return view.viewWithTag(tag) as! UIButton
    }
}
