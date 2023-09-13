import UIKit

class LandmarkDetailsViewController: UIViewController {
    @IBOutlet weak var landmarkImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var landmarkName: String?
    var landmarkImageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let landmarkName = landmarkName {
            title = landmarkName
            
            // Debugging: Print the landmark name to see if it's correctly passed
            print("Landmark name:", landmarkName)
            
            // Load appropriate description based on the landmark
            switch landmarkName {
            case "CN Tower":
                descriptionTextView.text = "The CN Tower, located in downtown Toronto, is an iconic communication and observation tower. Standing at 553 meters, it offers breathtaking panoramic views from its observation decks, including the Glass Floor and SkyPod. The tower features a revolving restaurant, 360 Restaurant, and is illuminated with changing colored lights at night. A symbol of Toronto's skyline, the CN Tower's unique design, engineering marvel, and cultural significance make it a must-visit attraction, drawing tourists and locals alike to experience its stunning vistas and architectural grandeur."
            case "Royal Ontario Museum":
                descriptionTextView.text = "The Royal Ontario Museum showcases a diverse collection of artifacts and exhibits."
            case "Distillery District":
                descriptionTextView.text = "The Distillery District is a historic area known for its unique shops and galleries."
            default:
                descriptionTextView.text = "Description not available."
            }
            
            // Fetch and display image from URL
            if let imageURLString = landmarkImageURL, let imageURL = URL(string: imageURLString) {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageURL),
                       let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self.landmarkImageView.image = image
                        }
                    }
                }
            }
        }
    }
}
