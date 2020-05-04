import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins
import Photos

class PhotoFilterViewController: UIViewController {

    // MARK: - Outlets

	@IBOutlet weak var brightnessSlider: UISlider!
	@IBOutlet weak var contrastSlider: UISlider!
	@IBOutlet weak var saturationSlider: UISlider!
	@IBOutlet weak var imageView: UIImageView!

    // MARK: - Properties

    private var originalImage: UIImage?
    private var context = CIContext(options: nil)
	
	override func viewDidLoad() {
		super.viewDidLoad()

        let filter = CIFilter.colorControls()
        print(filter)
        print(filter.attributes)
	}

    func filterImage(_ image: UIImage) -> UIImage? {

        // UIIMAGE -> CGIMAGE (Core Graphics) -> CIImage (Core Image)

        // Filter

        // Render the Image

        // CIImage -> CGImage -> UIImage

        return nil
    }
	
	// MARK: Actions
	
	@IBAction func choosePhotoButtonPressed(_ sender: Any) {
		// TODO: show the photo picker so we can choose on-device photos
		// UIImagePickerController + Delegate
	}
	
	@IBAction func savePhotoButtonPressed(_ sender: UIButton) {
		// TODO: Save to photo library
	}
	

	// MARK: Slider events
	
	@IBAction func brightnessChanged(_ sender: UISlider) {

	}
	
	@IBAction func contrastChanged(_ sender: Any) {

	}
	
	@IBAction func saturationChanged(_ sender: Any) {

	}
}

