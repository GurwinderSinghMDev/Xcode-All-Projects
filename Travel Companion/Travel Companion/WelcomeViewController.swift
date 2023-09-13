import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var startExploringButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    private func setupUI() {
        // Add logo image view covering 40% of the screen with space from top
        let logoImageView = UIImageView(image: UIImage(named: "TimetoTravel"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50), // Add space from top
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4) // Cover 40% of the screen height
        ])
        
        // Set up label and button outlets
        welcomeLabel.text = "Welcome to the Toronto Travel Companion!"
        startExploringButton.setTitle("Start Exploring", for: .normal)
    }
    
    @IBAction func goToLandmarkList(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToLandmarkList", sender: nil)
    }
}
