package opencvtest;


import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.MatOfRect;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.highgui.Highgui;
import org.opencv.objdetect.CascadeClassifier;

//
// 人脸扫描demo
// Detects faces in an image, draws boxes around them, and writes the results
// to "faceDetection.png".
//
class DetectFaceDemo {
  public void run() {
    System.out.println("\nRunning DetectFaceDemo");

    // Create a face detector from the cascade file in the resources
    // directory.
//    CascadeClassifier faceDetector = new CascadeClassifier(getClass().getResource("/lbpcascade_frontalface.xml").getPath());
//    Mat image = Highgui.imread(getClass().getResource("lena.png").getPath());
//上面注释掉的2行为源代码，但是源代码获取路径的时候多1个“/” 因此修改一下substring第一个字符开始截取
		CascadeClassifier faceDetector = new CascadeClassifier(getClass().getResource("/lbpcascade_frontalface.xml")
				.getPath().substring(1));
		Mat image = Highgui.imread(getClass().getResource("/lena.png").getPath().substring(1));

    // Detect faces in the image.
    // MatOfRect is a special container class for Rect.
    MatOfRect faceDetections = new MatOfRect();
    faceDetector.detectMultiScale(image, faceDetections);

    System.out.println(String.format("Detected %s faces", faceDetections.toArray().length));

    // Draw a bounding box around each face.
    for (Rect rect : faceDetections.toArray()) {
        //Core.rectangle(image, new Point(rect.x, rect.y), new Point(rect.x + rect.width, rect.y + rect.height), new Scalar(0, 255, 0));
    }

    // Save the visualized detection.
    String filename = "faceDetection.png";
    System.out.println(String.format("Writing %s", filename));
   // Highgui.imwrite(filename, image);
  }
}

public class HelloOpenCV {
  public static void main(String[] args) {
    System.out.println("Hello, OpenCV");

    // Load the native library.
	 System.loadLibrary("opencv_java2413");
	 System.out.println("Hello, OpenCV222");
    new DetectFaceDemo().run();
  }
}