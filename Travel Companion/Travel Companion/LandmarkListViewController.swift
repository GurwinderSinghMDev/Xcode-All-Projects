import UIKit

class LandmarkListViewController: UIViewController {
    @IBOutlet weak var landmarkButton1: UIButton!
    @IBOutlet weak var landmarkButton2: UIButton!
    @IBOutlet weak var landmarkButton3: UIButton!
    override func viewDidLoad() {
          super.viewDidLoad()
          // Configure your buttons and actions
          
          // Set images for buttons
          landmarkButton1.setImage(UIImage(named: "cn"), for: .normal)
          landmarkButton2.setImage(UIImage(named: "rom"), for: .normal)
          landmarkButton3.setImage(UIImage(named: "dd"), for: .normal)
          
          // Set content mode to fit images within buttons
          landmarkButton1.imageView?.contentMode = .scaleAspectFill
          landmarkButton2.imageView?.contentMode = .scaleAspectFill
          landmarkButton3.imageView?.contentMode = .scaleAspectFill
      }
    @IBAction func landmarkButtonTapped(_ sender: UIButton) {
        if sender == landmarkButton1 {
            performSegue(withIdentifier: "segueToCN", sender: nil)
        } else if sender == landmarkButton2 {
            performSegue(withIdentifier: "segueToROM", sender: nil)
        } else if sender == landmarkButton3 {
            performSegue(withIdentifier: "segueToDistillery", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let destinationVC = segue.destination as? LandmarkDetailsViewController {
                if identifier == "segueToCN" {
                    destinationVC.landmarkName = "CN Tower"
                    destinationVC.landmarkImageURL = "https://media.cntraveler.com/photos/5b2c0684a98055277ea83e26/16:9/w_2560,c_limit/CN-Tower_GettyImages-615764386.jpg"
                } else if identifier == "segueToROM" {
                    destinationVC.landmarkName = "Royal Ontario Museum"
                    destinationVC.landmarkImageURL = "https://www.rom.on.ca/sites/default/files/imce/ROM_strategic_plan_highlight.png"
                } else if identifier == "segueToDistillery" {
                    destinationVC.landmarkName = "Distillery District"
                    destinationVC.landmarkImageURL = "https://www.thedistillerydistrict.com/wp-content/uploads/2020/05/1024.jpg"
                }
            }
        }
    }
}
