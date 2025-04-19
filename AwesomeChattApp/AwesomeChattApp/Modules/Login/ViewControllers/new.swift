//
//  new.swift
//  AwesomeChattApp
//
//  Created by Việt Anh Trần on 13/4/25.
//

import UIKit

class LogoViewController: UIViewController {
    private var shapeLayers: [CAShapeLayer] = []
    private var isFilled: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogo()
    }

    private func setupLogo() {
        // Step 1: Define the SVG paths
        let paths = [
            // Path 1
            "M91.4204 41.8905C101.54 49.6105 104.19 56.7805 101.15 67.0805C98.4304 76.2805 89.9604 82.3405 77.4904 82.8705C64.7104 83.4205 51.8904 83.1805 39.0904 83.2305C28.1704 83.2705 17.2504 83.1405 6.33041 83.2805C1.74041 83.3405 -0.0195985 81.4405 0.0104015 76.8705C0.130402 53.5505 0.130402 30.2305 0.0104015 6.91046C-0.0195985 2.29046 1.7504 0.550459 6.3404 0.580459C28.9304 0.750459 51.5304 0.700464 74.1204 0.820464C76.7304 0.830464 79.3504 1.34046 81.9304 1.77046C90.9704 3.25046 98.2304 7.42046 100.17 16.9205C102.12 26.4905 101.84 35.8905 91.4304 41.9005L91.4204 41.8905ZM14.8404 70.9105C36.0904 70.9105 56.7304 71.1005 77.3504 70.8005C84.1504 70.7005 86.7404 67.6405 87.1304 61.5705C87.6304 53.7905 85.3504 50.3105 78.4504 48.7905C76.0904 48.2705 73.6204 48.0505 71.2004 48.0405C53.9204 47.9805 36.6304 48.0005 19.3504 48.0205C17.9104 48.0205 16.4804 48.2705 14.8404 48.4205V70.9105ZM15.1104 35.3905C16.6204 35.5905 17.5304 35.8005 18.4404 35.8105C36.7104 35.8105 54.9804 35.8205 73.2404 35.7305C75.4704 35.7205 78.1104 35.7705 79.8204 34.6605C82.4204 32.9805 85.5104 30.6805 86.4104 27.9805C89.2804 19.3405 85.1004 13.2405 75.9304 13.0305C56.1704 12.5905 36.3904 12.7705 16.6204 12.7305C16.1404 12.7305 15.6604 13.2305 15.1004 13.5405V35.3905H15.1104Z",
            // Path 2
            "M328.05 43.2255C338.63 48.0655 340.04 56.4655 338.58 65.8355C337.17 74.8355 331.3 80.1055 322.73 82.0955C317.47 83.3155 311.99 84.1455 306.6 84.2055C285.91 84.4455 265.22 84.3255 244.53 84.2855C237.9 84.2755 237.09 83.4555 237.09 76.7755C237.06 53.8555 237.17 30.9255 237 8.00553C236.97 3.47553 238.57 1.21553 243.06 1.25553C267.31 1.50553 291.59 1.23553 315.82 2.25553C332 2.93553 339.16 12.5755 337.83 28.6255C337.3 35.0455 333.75 39.3055 328.07 43.2155L328.05 43.2255ZM282.83 13.8455C282.83 13.6555 282.83 13.4555 282.83 13.2655C273.98 13.2655 265.13 13.3355 256.29 13.2255C253.3 13.1855 251.71 13.9955 251.82 17.3355C251.99 22.5955 251.67 27.8755 252.02 33.1155C252.1 34.3655 254.02 36.5255 255.09 36.5255C275.22 36.5155 295.35 36.3555 315.48 35.9455C320.78 35.8355 323.4 32.2655 324.02 27.1155C324.97 19.1755 322.02 14.5655 313.87 14.0155C303.57 13.3255 293.19 13.8455 282.85 13.8455H282.83ZM251.83 72.0455C272.72 72.0455 293 72.2455 313.28 71.9455C321.14 71.8255 324.09 68.3755 324.15 61.2655C324.21 53.4355 321.12 49.5055 313.14 49.3455C293.04 48.9555 272.94 49.0955 252.84 49.0455C252.54 49.0455 252.25 49.4455 251.83 49.7355V72.0355V72.0455Z",
            // Path 3
            "M392.61 84.5354C382.51 83.7354 372.28 83.6754 362.34 81.9354C349.86 79.7554 344.89 72.8554 344.81 60.2054C344.74 48.5454 344.76 36.8855 344.8 25.2255C344.85 11.1055 350.68 4.05544 364.88 2.16544C372.67 1.12544 380.63 0.965451 388.51 1.00545C400.35 1.05545 412.26 0.91545 424 2.14545C438.7 3.68545 444.39 10.8054 444.44 25.3454C444.47 36.4454 444.07 47.5554 444.53 58.6254C445.17 74.0354 438.27 81.1554 421.99 82.9354C412.33 83.9954 402.45 83.1254 392.67 83.1254C392.65 83.5954 392.63 84.0554 392.61 84.5254V84.5354ZM395.06 13.1954C395.06 12.9754 395.04 12.7554 395.03 12.5354C386.05 13.0654 376.98 13.0454 368.1 14.3054C361.14 15.2854 359.43 18.2354 359.4 25.2454C359.36 36.3254 359.37 47.4154 359.4 58.4954C359.42 66.9354 361.79 70.4654 370.43 70.8954C385.79 71.6754 401.21 71.3954 416.61 71.4854C418.09 71.4854 419.6 71.1054 421.05 70.7354C427.94 68.9954 430.01 66.3754 430.04 59.1954C430.08 48.6754 430.04 38.1554 430.06 27.6354C430.07 17.3954 427.01 13.8754 416.5 13.2654C409.38 12.8554 402.21 13.1854 395.07 13.1854L395.06 13.1954Z",
            // Path 4
            "M169.33 41.3904C157.45 31.2204 146.31 21.7004 135.19 12.1604C133.62 10.8104 131.94 9.50042 130.72 7.87042C128.38 4.73042 129.74 1.43042 133.61 0.830417C138.01 0.150417 141.95 0.770417 145.61 4.01042C156.86 13.9604 168.4 23.5904 180.25 33.7104C191.46 23.9704 202.61 14.5204 213.46 4.74042C216.97 1.58042 220.63 -0.0895808 225.16 0.770419C226.97 1.11042 229.94 2.42042 230.01 3.46042C230.15 5.52042 229.25 8.35042 227.74 9.72042C219.14 17.5804 210.22 25.1104 201.42 32.7604C197.91 35.8104 194.44 38.8904 190.48 42.3604C196.99 47.9304 203.09 53.1604 209.2 58.3804C215.49 63.7504 221.93 68.9604 227.99 74.5704C229.52 75.9904 230.96 79.0904 230.4 80.7004C229.86 82.2504 226.53 83.9004 224.65 83.6604C221.33 83.2404 217.59 82.1504 215.05 80.0904C203.11 70.3904 191.51 60.2604 179.51 50.0404C167.64 60.3504 156.15 70.5704 144.32 80.3904C141.95 82.3604 138.35 83.3704 135.19 83.7104C133.2 83.9204 129.55 82.4304 129.21 81.0604C128.73 79.1204 129.97 75.9204 131.57 74.4304C138.86 67.6404 146.53 61.2604 154.05 54.7204C158.98 50.4404 163.89 46.1304 169.31 41.3904H169.33Z",
            // Path 5
            "M501.52 14.2455C501.52 21.5455 501.52 28.0755 501.52 34.6055C501.52 47.7555 501.52 60.9055 501.52 74.0555C501.52 80.5955 500.2 81.9155 494.36 81.9855C488.91 82.0555 487.32 79.3155 487.37 74.1955C487.55 56.5455 487.41 38.8855 487.39 21.2255C487.39 19.1655 487.39 17.1155 487.39 14.2555C477.07 14.2555 466.98 14.2755 456.9 14.2555C451.21 14.2355 449.95 12.7255 450.44 7.19548C450.71 4.14548 452.13 3.00549 455.15 3.00549C481.48 3.06549 507.8 3.06549 534.13 3.01549C538.45 3.01549 538.86 5.62549 538.84 8.97549C538.83 12.3355 537.81 14.3155 534.01 14.2855C523.49 14.1955 512.98 14.2555 501.52 14.2555V14.2455Z",
            // Path 6
            "M122.67 41.9204C122.67 53.3904 122.75 64.8604 122.63 76.3304C122.57 82.4404 120.76 83.9104 114.83 83.9204C109.42 83.9204 107.71 81.1704 107.74 76.1104C107.86 53.3604 107.77 30.6004 107.81 7.85043C107.82 1.49043 109.38 -0.0295675 115.33 0.000432548C121.12 0.0304325 122.61 1.57043 122.65 8.07043C122.72 19.3504 122.67 30.6404 122.66 41.9204H122.67Z"
        ]

        // Step 2: Parse each path and create CAShapeLayers for subpaths
        for pathString in paths {
            let subpaths = parseSVGPathWithSubpaths(pathString)
            for subpath in subpaths {
                let shapeLayer = CAShapeLayer()
                shapeLayer.path = subpath.cgPath
                shapeLayer.strokeColor = UIColor(hex: "#F88A36").cgColor // First gradient color
                shapeLayer.lineWidth = 2.0
                shapeLayer.fillColor = nil // Initially no fill
                shapeLayer.frame = CGRect(x: 0, y: 0, width: 539, height: 85)
                
                // Center the layer
                shapeLayer.position = view.center
                view.layer.addSublayer(shapeLayer)
                shapeLayers.append(shapeLayer)

                // Step 3: Stroke animation
                let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
                strokeAnimation.fromValue = 0
                strokeAnimation.toValue = 1
                strokeAnimation.duration = 2.0
                strokeAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
                shapeLayer.add(strokeAnimation, forKey: "strokeAnimation")
            }
        }

        // Step 4: Apply gradient fill after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.applyGradientFill()
        }
    }

    private func applyGradientFill() {
        for shapeLayer in shapeLayers {
            // Create gradient layer
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [
                UIColor(hex: "#F88A36").cgColor,
                UIColor(hex: "#FD2020").cgColor
            ]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.frame = shapeLayer.bounds

            // Mask the gradient with the shape
            let maskLayer = CAShapeLayer()
            maskLayer.path = shapeLayer.path
            gradientLayer.mask = maskLayer
            shapeLayer.addSublayer(gradientLayer)

            // Animate the fill
            let fillAnimation = CABasicAnimation(keyPath: "opacity")
            fillAnimation.fromValue = 0
            fillAnimation.toValue = 1
            fillAnimation.duration = 2.0
            fillAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            gradientLayer.add(fillAnimation, forKey: "fillAnimation")
        }
        isFilled = true
    }

    // Improved SVG path parsing to handle subpaths
    private func parseSVGPathWithSubpaths(_ pathData: String) -> [UIBezierPath] {
        var subpaths: [UIBezierPath] = []
        var currentSubpath: UIBezierPath?
        let scanner = Scanner(string: pathData)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: " ,")
        var currentPoint = CGPoint.zero
        var previousControlPoint: CGPoint?

        while !scanner.isAtEnd {
            guard let command = scanner.scanCharacters(from: CharacterSet.letters) else { break }
            let isRelative = command.lowercased() == command

            switch command.uppercased() {
            case "M": // Move to (start a new subpath)
                if let subpath = currentSubpath, !subpath.isEmpty {
                    subpaths.append(subpath)
                }
                currentSubpath = UIBezierPath()
                guard let x = scanner.scanDouble(), let y = scanner.scanDouble() else { break }
                let point = isRelative ? CGPoint(x: currentPoint.x + x, y: currentPoint.y + y) : CGPoint(x: x, y: y)
                currentSubpath?.move(to: point)
                currentPoint = point

            case "L": // Line to
                guard let x = scanner.scanDouble(), let y = scanner.scanDouble() else { break }
                let point = isRelative ? CGPoint(x: currentPoint.x + x, y: currentPoint.y + y) : CGPoint(x: x, y: y)
                currentSubpath?.addLine(to: point)
                currentPoint = point

            case "C": // Cubic Bezier curve
                guard let x1 = scanner.scanDouble(), let y1 = scanner.scanDouble(),
                      let x2 = scanner.scanDouble(), let y2 = scanner.scanDouble(),
                      let x = scanner.scanDouble(), let y = scanner.scanDouble() else { break }
                let control1 = isRelative ? CGPoint(x: currentPoint.x + x1, y: currentPoint.y + y1) : CGPoint(x: x1, y: y1)
                let control2 = isRelative ? CGPoint(x: currentPoint.x + x2, y: currentPoint.y + y2) : CGPoint(x: x2, y: y2)
                let point = isRelative ? CGPoint(x: currentPoint.x + x, y: currentPoint.y + y) : CGPoint(x: x, y: y)
                currentSubpath?.addCurve(to: point, controlPoint1: control1, controlPoint2: control2)
                currentPoint = point
                previousControlPoint = control2

            case "H": // Horizontal line to
                guard let x = scanner.scanDouble() else { break }
                let point = isRelative ? CGPoint(x: currentPoint.x + x, y: currentPoint.y) : CGPoint(x: x, y: currentPoint.y)
                currentSubpath?.addLine(to: point)
                currentPoint = point

            case "V": // Vertical line to
                guard let y = scanner.scanDouble() else { break }
                let point = isRelative ? CGPoint(x: currentPoint.x, y: currentPoint.y + y) : CGPoint(x: currentPoint.x, y: y)
                currentSubpath?.addLine(to: point)
                currentPoint = point

            case "Z": // Close path
                currentSubpath?.close()
                if let firstPoint = currentSubpath?.cgPath.points.first {
                    currentPoint = firstPoint
                }

            default:
                break
            }
        }

        // Add the last subpath if it exists
        if let subpath = currentSubpath, !subpath.isEmpty {
            subpaths.append(subpath)
        }

        return subpaths
    }
}

// Extension to get points from CGPath (for closing path)
extension CGPath {
    var points: [CGPoint] {
        var points: [CGPoint] = []
        self.applyWithBlock { element in
            switch element.pointee.type {
            case .moveToPoint:
                points.append(element.pointee.points[0])
            case .addLineToPoint:
                points.append(element.pointee.points[0])
            case .addQuadCurveToPoint:
                points.append(element.pointee.points[1])
            case .addCurveToPoint:
                points.append(element.pointee.points[2])
            case .closeSubpath:
                break
            @unknown default:
                break
            }
        }
        return points
    }
}

//extension UIBezierPath {
//    static func caculateBounds(paths: [UIBezierPath]) -> CGRect {
//        let myPath = UIBezierPath()
//        for path in paths {
//            myPath.append(path)
//        }
//        return myPath.bounds
//    }
//
//    static var ctLogo1: UIBezierPath {
//        let shape = UIBezierPath()
//        shape.move(to: CGPoint(x: 91.42, y: 41.89))
//        shape.addCurve(to: CGPoint(x: 101.15, y: 67.08),
//                       controlPoint1: CGPoint(x: 101.54, y: 49.61),
//                       controlPoint2: CGPoint(x: 104.19, y: 56.78))
//        shape.addCurve(to: CGPoint(x: 77.49, y: 82.87),
//                       controlPoint1: CGPoint(x: 98.43, y: 76.28),
//                       controlPoint2: CGPoint(x: 89.96, y: 82.34))
//        shape.addCurve(to: CGPoint(x: 39.09, y: 83.23),
//                       controlPoint1: CGPoint(x: 64.71, y: 83.42),
//                       controlPoint2: CGPoint(x: 51.89, y: 83.18))
//        shape.addCurve(to: CGPoint(x: 6.33, y: 83.28),
//                       controlPoint1: CGPoint(x: 28.17, y: 83.27),
//                       controlPoint2: CGPoint(x: 17.25, y: 83.14))
//        shape.addCurve(to: CGPoint(x: 0.01, y: 76.87),
//                       controlPoint1: CGPoint(x: 1.74, y: 83.34),
//                       controlPoint2: CGPoint(x: -0.02, y: 81.44))
//        shape.addCurve(to: CGPoint(x: 0.01, y: 6.91), controlPoint1:
//                        CGPoint(x: 0.13, y: 53.55),
//                       controlPoint2: CGPoint(x: 0.13, y: 30.23))
//        shape.addCurve(to: CGPoint(x: 6.34, y: 0.58),
//                       controlPoint1: CGPoint(x: -0.02, y: 2.29),
//                       controlPoint2: CGPoint(x: 1.75, y: 0.55))
//        shape.addCurve(to: CGPoint(x: 74.12, y: 0.82), controlPoint1: CGPoint(x: 28.93, y: 0.75), controlPoint2: CGPoint(x: 51.53, y: 0.7)) shape.addCurve(to: CGPoint(x: 81.93, y: 1.77), controlPoint1: CGPoint(x: 76.73, y: 0.83), controlPoint2: CGPoint(x: 79.35, y: 1.34)) shape.addCurve(to: CGPoint(x: 100.17, y: 16.92), controlPoint1: CGPoint(x: 90.97, y: 3.25), controlPoint2: CGPoint(x: 98.23, y: 7.42)) shape.addCurve(to: CGPoint(x: 91.43, y: 41.9), controlPoint1: CGPoint(x: 102.12, y: 26.49), controlPoint2: CGPoint(x: 101.84, y: 35.89)) shape.addLine(to: CGPoint(x: 91.42, y: 41.89)) shape.close() shape.move(to: CGPoint(x: 14.84, y: 70.91)) shape.addCurve(to: CGPoint(x: 77.35, y: 70.8), controlPoint1: CGPoint(x: 36.09, y: 70.91), controlPoint2: CGPoint(x: 56.73, y: 71.1)) shape.addCurve(to: CGPoint(x: 87.13, y: 61.57), controlPoint1: CGPoint(x: 84.15, y: 70.7), controlPoint2: CGPoint(x: 86.74, y: 67.64)) shape.addCurve(to: CGPoint(x: 78.45, y: 48.79), controlPoint1: CGPoint(x: 87.63, y: 53.79), controlPoint2: CGPoint(x: 85.35, y: 50.31)) shape.addCurve(to: CGPoint(x: 71.2, y: 48.04), controlPoint1: CGPoint(x: 76.09, y: 48.27), controlPoint2: CGPoint(x: 73.62, y: 48.05)) shape.addCurve(to: CGPoint(x: 19.35, y: 48.02), controlPoint1: CGPoint(x: 53.92, y: 47.98), controlPoint2: CGPoint(x: 36.63, y: 48)) shape.addCurve(to: CGPoint(x: 14.84, y: 48.42), controlPoint1: CGPoint(x: 17.91, y: 48.02), controlPoint2: CGPoint(x: 16.48, y: 48.27)) shape.addLine(to: CGPoint(x: 0, y: 70.91)) shape.close() shape.move(to: CGPoint(x: 15.11, y: 35.39)) shape.addCurve(to: CGPoint(x: 18.44, y: 35.81), controlPoint1: CGPoint(x: 16.62, y: 35.59), controlPoint2: CGPoint(x: 17.53, y: 35.8)) shape.addCurve(to: CGPoint(x: 73.24, y: 35.73), controlPoint1: CGPoint(x: 36.71, y: 35.81), controlPoint2: CGPoint(x: 54.98, y: 35.82)) shape.addCurve(to: CGPoint(x: 79.82, y: 34.66), controlPoint1: CGPoint(x: 75.47, y: 35.72), controlPoint2: CGPoint(x: 78.11, y: 35.77)) shape.addCurve(to: CGPoint(x: 86.41, y: 27.98), controlPoint1: CGPoint(x: 82.42, y: 32.98), controlPoint2: CGPoint(x: 85.51, y: 30.68)) shape.addCurve(to: CGPoint(x: 75.93, y: 13.03), controlPoint1: CGPoint(x: 89.28, y: 19.34), controlPoint2: CGPoint(x: 85.1, y: 13.24)) shape.addCurve(to: CGPoint(x: 16.62, y: 12.73), controlPoint1: CGPoint(x: 56.17, y: 12.59), controlPoint2: CGPoint(x: 36.39, y: 12.77)) shape.addCurve(to: CGPoint(x: 15.1, y: 13.54), controlPoint1: CGPoint(x: 16.14, y: 12.73), controlPoint2: CGPoint(x: 15.66, y: 13.23)) shape.addLine(to: CGPoint(x: 0, y: 35.39)) shape.addLine(to: CGPoint(x: 15.11, y: 0)) shape.close()
//        return shape
//    }
//}
class testViewController: UIViewController {
    
    func createTextPath(text: String, font: UIFont) -> CGPath {
        let attributedString = NSAttributedString(string: text, attributes: [.font: font])
        let line = CTLineCreateWithAttributedString(attributedString)
        let runs = CTLineGetGlyphRuns(line) as! [CTRun]
        
        let letters = CGMutablePath()
        
        for run in runs {
            let attributes = CTRunGetAttributes(run) as NSDictionary
            let font = attributes[kCTFontAttributeName as String] as! CTFont
            
            for i in 0..<CTRunGetGlyphCount(run) {
                var glyph = CGGlyph()
                var position = CGPoint()
                CTRunGetGlyphs(run, CFRangeMake(i, 1), &glyph)
                CTRunGetPositions(run, CFRangeMake(i, 1), &position)
                if let letter = CTFontCreatePathForGlyph(font, glyph, nil) {
                    let t = CGAffineTransform(translationX: position.x, y: position.y)
                    letters.addPath(letter, transform: t)
                }
            }
        }
        
        // Fix bị ngược chữ
        let boundingBox = letters.boundingBox
        var transform = CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -boundingBox.height)
        return letters.copy(using: &transform) ?? letters
    }
    
    func animateTextStroke(text: String, font: UIFont, in view: UIView) {
        let textPath = createTextPath(text: text, font: font)
        
        let frame = CGRect(x: 20, y: 100, width: 300, height: 100)
        
        // Layer 1: Stroke Layer (vẽ viền)
        let strokeLayer = CAShapeLayer()
        strokeLayer.path = textPath
        strokeLayer.frame = frame
        strokeLayer.strokeColor = UIColor.green.cgColor // xanh nhạt
        strokeLayer.fillColor = UIColor.clear.cgColor
        strokeLayer.lineWidth = 2
        strokeLayer.strokeEnd = 0
        view.layer.addSublayer(strokeLayer)
        
        // Layer 2: Fill Layer (tô màu sau khi vẽ xong)
        let fillLayer = CAShapeLayer()
        fillLayer.path = textPath
        fillLayer.frame = frame
        fillLayer.fillColor = UIColor.green.cgColor // xanh đậm
        fillLayer.opacity = 0 // ban đầu ẩn
        view.layer.addSublayer(fillLayer)
        
        // Animation vẽ stroke
        let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0
        strokeAnimation.toValue = 1
        strokeAnimation.duration = 3.0
        strokeAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        strokeLayer.add(strokeAnimation, forKey: "strokeAnimation")
        strokeLayer.strokeEnd = 1
        
        // Animation hiện fill sau 3 giây
        let fillAnimation = CABasicAnimation(keyPath: "opacity")
        fillAnimation.fromValue = 0
        fillAnimation.toValue = 1
        fillAnimation.duration = 0.3
        fillAnimation.beginTime = CACurrentMediaTime() + 3.0
        fillAnimation.fillMode = .forwards
        fillAnimation.isRemovedOnCompletion = false
        fillLayer.add(fillAnimation, forKey: "fillFadeIn")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        animateTextStroke(text: "Hello, Việt Anh!", font: UIFont.systemFont(ofSize: 40, weight: .bold), in: view)
    }
}
