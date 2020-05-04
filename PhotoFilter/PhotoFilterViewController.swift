import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins
import Photos

class PhotoFilterViewController: UIViewController {

    // MARK: Outlets

	@IBOutlet weak var brightnessSlider: UISlider!
	@IBOutlet weak var contrastSlider: UISlider!
	@IBOutlet weak var saturationSlider: UISlider!
	@IBOutlet weak var imageView: UIImageView!

    // MARK: Properties

    private var originalImage: UIImage? {
        didSet {
            updateViews()
        }
    }

    private var context = CIContext(options: nil)

    // MARK: - View Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()

        let filter = CIFilter.colorControls()
        print(filter)
        print(filter.attributes)

        // Test the Filter Quickly
        originalImage = imageView.image
	}

    // MARK: Actions

    func updateViews() {
        if let originalImage = originalImage {
            imageView.image = filterImage(originalImage)
        } else {
            imageView.image = nil
        }
    }

    func filterImage(_ image: UIImage) -> UIImage? {

        // UIIMAGE -> CGIMAGE (Core Graphics) -> CIImage (Core Image)
        guard let cgImage = image.cgImage else { return nil }
        let ciImage = CIImage(cgImage: cgImage)

        // Filter = recipe
        let filter = CIFilter.colorControls()
        filter.inputImage = ciImage
        filter.brightness = brightnessSlider.value
        filter.contrast = contrastSlider.value
        filter.saturation = saturationSlider.value

        // Render the Image
        guard let outputCIImage = filter.outputImage else { return nil }
        guard let outputCGImage = context.createCGImage(outputCIImage,
                                                        from: CGRect(origin: .zero, size: image.size)) else { return nil }

        // CIImage -> CGImage -> UIImage
        return UIImage(cgImage: outputCGImage)
    }
	
	// MARK: IBActions
	
	@IBAction func choosePhotoButtonPressed(_ sender: Any) {
		// TODO: show the photo picker so we can choose on-device photos
		// UIImagePickerController + Delegate
	}
	
	@IBAction func savePhotoButtonPressed(_ sender: UIButton) {
		// TODO: Save to photo library
	}
	

	// MARK: Slider events
	
	@IBAction func brightnessChanged(_ sender: UISlider) {
        updateViews()
	}
	
	@IBAction func contrastChanged(_ sender: Any) {
        updateViews()
	}
	
	@IBAction func saturationChanged(_ sender: Any) {
        updateViews()
	}
}

