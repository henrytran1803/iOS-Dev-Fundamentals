//
//  CircularWaveDemo.swift
//  AwesomeChattApp
//
//  Created by Việt Anh Trần on 11/4/25.
//
//
//import UIKit
//
//import UIKit
//import AVFoundation
//
//class ViewController: UIViewController {
//    let waveView = CircularWaveView()
//    let audioEngine = AVAudioEngine()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .black
//
//        waveView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//        waveView.center = view.center
//        view.addSubview(waveView)
//
//        requestMicrophonePermissionAndStart()
//    }
//
//    private func requestMicrophonePermissionAndStart() {
//        AVAudioSession.sharedInstance().requestRecordPermission { granted in
//            if granted {
//                DispatchQueue.main.async {
//                    self.startAudioEngine()
//                }
//            } else {
//                print("Mic permission denied")
//            }
//        }
//    }
//
//    private func startAudioEngine() {
//        let inputNode = audioEngine.inputNode
//        let bus = 0
//
//        // 👇 Format chuẩn từ input node
//        let inputFormat = inputNode.inputFormat(forBus: bus)
//
//        inputNode.removeTap(onBus: bus) // xóa tap cũ nếu có
//        inputNode.installTap(onBus: bus, bufferSize: 1024, format: inputFormat) { (buffer, _) in
//            let level = self.averageAmplitude(from: buffer)
//            DispatchQueue.main.async {
//                self.waveView.setVolume(level)
//            }
//        }
//
//        do {
//            try audioEngine.start()
//        } catch {
//            print("Error starting audio engine: \(error)")
//        }
//    }
//
//
//    private func averageAmplitude(from buffer: AVAudioPCMBuffer) -> Float {
//        guard let channelData = buffer.floatChannelData?[0] else { return 0 }
//        let frameLength = Int(buffer.frameLength)
//        var sum: Float = 0
//
//        for i in 0..<frameLength {
//            sum += abs(channelData[i])
//        }
//
//        return sum / Float(frameLength) // âm lượng trung bình
//    }
//
//    deinit {
//        audioEngine.inputNode.removeTap(onBus: 0)
//        audioEngine.stop()
//    }
//}
//// MARK: - CircularWaveView
//class CircularWaveView: UIView {
//    // Configurable properties
//    var numberOfWaves: Int = 5
//    var baseRadius: CGFloat = 60
//    var spacingBetweenWaves: CGFloat = 10
//    var waveColor: UIColor = .green
//    func setVolume(_ volume: Float) {
//        let clamped = max(0, min(volume, 1))
//        self.isSpeaking = clamped > 0.01
//        self.currentAmplitude = CGFloat(clamped * 50) // scale âm lượng thành biên độ
//    }
//
//    // Internal animation state
//    private var targetRadius: CGFloat = 60
//    private var currentAmplitude: CGFloat = 10.0
//    private var phase: CGFloat = 0.0
//    private var isSpeaking: Bool = false
//    
//    // Rendering
//    private var shapeLayers: [CAShapeLayer] = []
//    private var displayLink: CADisplayLink?
//
//    // MARK: - Init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .clear
//        setupWaves()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupWaves()
//    }
//
//    // MARK: - Setup
//    private func setupWaves() {
//        for i in 0..<numberOfWaves {
//            let layer = CAShapeLayer()
//            let alpha = 0.2 + CGFloat(i) * (0.8 / CGFloat(numberOfWaves))
//            layer.strokeColor = waveColor.withAlphaComponent(alpha).cgColor
//            layer.fillColor = UIColor.clear.cgColor
//            layer.lineWidth = 1.2
//            shapeLayers.append(layer)
//            self.layer.addSublayer(layer)
//        }
//        startAnimating()
//    }
//
//    // MARK: - Animate Loop
//    private func startAnimating() {
//        displayLink = CADisplayLink(target: self, selector: #selector(updateWaves))
//        displayLink?.add(to: .main, forMode: .common)
//    }
//
//    @objc private func updateWaves() {
//        phase += 0.06
//        
//        // Mềm mại hoá biên độ sóng khi nói
//        let targetAmplitude = isSpeaking ? CGFloat.random(in: 10...20) : CGFloat.random(in: 2...6)
//        currentAmplitude += (targetAmplitude - currentAmplitude) * 0.1
//        
//        // Mềm mại hoá kích thước sóng
//        baseRadius += (targetRadius - baseRadius) * 0.1
//        
//        let center = CGPoint(x: bounds.midX, y: bounds.midY)
//        let points = 100
//        
//        for (i, layer) in shapeLayers.enumerated() {
//            let path = UIBezierPath()
//            for j in 0...points {
//                let angle = CGFloat(j) / CGFloat(points) * 2 * .pi
//                let waveOffset = CGFloat(i) * 0.5
//                let radius = baseRadius + CGFloat(i) * spacingBetweenWaves + sin(angle * 4 + phase + waveOffset) * currentAmplitude
//                let x = center.x + cos(angle) * radius
//                let y = center.y + sin(angle) * radius
//                if j == 0 {
//                    path.move(to: CGPoint(x: x, y: y))
//                } else {
//                    path.addLine(to: CGPoint(x: x, y: y))
//                }
//            }
//            path.close()
//            layer.path = path.cgPath
//        }
//    }
//
//    // MARK: - Public API
//    func pulse() {
//        targetRadius = 100 // To lên
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            self.targetRadius = 60 // Thu nhỏ lại
//        }
//    }
//
//    func setSpeaking(_ speaking: Bool) {
//        isSpeaking = speaking
//    }
//
//    // MARK: - Deinit
//    deinit {
//        displayLink?.invalidate()
//    }
//}
//import UIKit
//import SceneKit
//import UIKit
//import SceneKit
//
//class ViewController: UIViewController {
//
//    var sceneView: SCNView!
//    var vertices: [SCNVector3] = []
//    var geometrySource: SCNGeometrySource!
//    var geometryElement: SCNGeometryElement!
//    var vertexCount = 0
//    var time: Float = 0
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .black
//
//        // SceneKit view
//        sceneView = SCNView(frame: view.bounds)
//        view.addSubview(sceneView)
//
//        let scene = SCNScene()
//        sceneView.scene = scene
//        sceneView.allowsCameraControl = true
//        sceneView.autoenablesDefaultLighting = true
//
//        // Plane: phân mảnh thành lưới nhỏ
//        let width = 5
//        let height = 5
//        let segmentsW = 60
//        let segmentsH = 60
//        let dx = Float(width) / Float(segmentsW)
//        let dz = Float(height) / Float(segmentsH)
//
//        for j in 0...segmentsH {
//            for i in 0...segmentsW {
//                let x = Float(i) * dx - Float(width)/2
//                let z = Float(j) * dz - Float(height)/2
//                vertices.append(SCNVector3(x, 0, z))
//            }
//        }
//
//        vertexCount = vertices.count
//
//        let vertexData = Data(bytes: vertices, count: MemoryLayout<SCNVector3>.size * vertexCount)
//        geometrySource = SCNGeometrySource(data: vertexData,
//                                           semantic: .vertex,
//                                           vectorCount: vertexCount,
//                                           usesFloatComponents: true,
//                                           componentsPerVector: 3,
//                                           bytesPerComponent: MemoryLayout<Float>.size,
//                                           dataOffset: 0,
//                                           dataStride: MemoryLayout<SCNVector3>.size)
//
//        var indices: [CInt] = []
//        for j in 0..<segmentsH {
//            for i in 0..<segmentsW {
//                let index = CInt(i + j * (segmentsW + 1))
//                indices.append(contentsOf: [
//                    index, index + 1, index + CInt(segmentsW + 1),
//                    index + 1, index + CInt(segmentsW + 2), index + CInt(segmentsW + 1)
//                ])
//            }
//        }
//
//        let indexData = Data(bytes: indices, count: MemoryLayout<CInt>.size * indices.count)
//        geometryElement = SCNGeometryElement(data: indexData,
//                                             primitiveType: .triangles,
//                                             primitiveCount: indices.count / 3,
//                                             bytesPerIndex: MemoryLayout<CInt>.size)
//
//        let geometry = SCNGeometry(sources: [geometrySource], elements: [geometryElement])
//        geometry.firstMaterial?.diffuse.contents = createGradientImage(size: CGSize(width: 512, height: 64))
//        geometry.firstMaterial?.isDoubleSided = true
//
//        let node = SCNNode(geometry: geometry)
//        scene.rootNode.addChildNode(node)
//
//        // Camera
//        let cameraNode = SCNNode()
//        cameraNode.camera = SCNCamera()
//        cameraNode.position = SCNVector3(x: 0, y: 5, z: 10)
//        cameraNode.look(at: SCNVector3Zero)
//        scene.rootNode.addChildNode(cameraNode)
//
//        // Start animation loop
//        CADisplayLink(target: self, selector: #selector(updateWave)).add(to: .main, forMode: .default)
//    }
//
//    @objc func updateWave() {
//        time += 0.1
//
//        var newVertices = vertices
//        for i in 0..<vertexCount {
//            let x = vertices[i].x
//            let z = vertices[i].z
//            let y = sin(x * 2 + time) * 0.3 + cos(z * 2 + time) * 0.3
//            newVertices[i].y = y
//        }
//
//        let newVertexData = Data(bytes: newVertices, count: MemoryLayout<SCNVector3>.size * vertexCount)
//        let newGeometrySource = SCNGeometrySource(data: newVertexData,
//                                                  semantic: .vertex,
//                                                  vectorCount: vertexCount,
//                                                  usesFloatComponents: true,
//                                                  componentsPerVector: 3,
//                                                  bytesPerComponent: MemoryLayout<Float>.size,
//                                                  dataOffset: 0,
//                                                  dataStride: MemoryLayout<SCNVector3>.size)
//
//        let geometry = SCNGeometry(sources: [newGeometrySource], elements: [geometryElement])
//        geometry.firstMaterial?.diffuse.contents = createGradientImage(size: CGSize(width: 512, height: 64))
//        geometry.firstMaterial?.isDoubleSided = true
//
//        sceneView.scene?.rootNode.childNodes.first?.geometry = geometry
//    }
//
//    // Reuse gradient generator
//    func createGradientImage(size: CGSize) -> UIImage {
//        let renderer = UIGraphicsImageRenderer(size: size)
//        return renderer.image { context in
//            let colors = [UIColor.purple.cgColor, UIColor.systemBlue.cgColor] as CFArray
//            let colorSpace = CGColorSpaceCreateDeviceRGB()
//            let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: nil)!
//            context.cgContext.drawLinearGradient(gradient,
//                                                 start: CGPoint(x: 0, y: 0),
//                                                 end: CGPoint(x: size.width, y: 0),
//                                                 options: [])
//        }
//    }
//}
//MARK: Part
import UIKit
import Foundation
struct Particle {
    var position: CGPoint
    var velocity: CGVector
    var angle: Double
    var length: CGFloat
}
class ParticleView: UIView {

    private var particles: [Particle] = []
    private var displayLink: CADisplayLink?
    private let particleCount = 150
    private let connectionDistance: CGFloat = 100
    private var lastTimestamp: CFTimeInterval?
    private var touchPoint: CGPoint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        initParticles()
        startAnimation()

        // Bật tương tác touch
        isUserInteractionEnabled = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initParticles() {
        let width = bounds.width
        let height = bounds.height

        particles = (0..<particleCount).map { _ in
            Particle(
                position: CGPoint(x: CGFloat.random(in: 0...width),
                                  y: CGFloat.random(in: 0...height)),
                velocity: CGVector(dx: CGFloat.random(in: -1.5...1.5),
                                   dy: CGFloat.random(in: -1.5...1.5)),
                angle: Double.random(in: 0...(2 * Double.pi)),
                length: CGFloat.random(in: 10...30)
            )
        }
    }

    private func startAnimation() {
        displayLink = CADisplayLink(target: self, selector: #selector(updateFrame))
        displayLink?.add(to: .main, forMode: .common)
    }

    @objc private func updateFrame(link: CADisplayLink) {
        let currentTimestamp = link.timestamp
        let deltaTime: CGFloat

        if let last = lastTimestamp {
            deltaTime = CGFloat(currentTimestamp - last)
        } else {
            deltaTime = 1.0 / 60.0 // Giả định khung hình đầu tiên
        }

        lastTimestamp = currentTimestamp

        for i in 0..<particles.count {
            // Update vị trí theo vận tốc và thời gian
            particles[i].position.x += particles[i].velocity.dx * deltaTime * 60
            particles[i].position.y += particles[i].velocity.dy * deltaTime * 60

            let width = bounds.width
            let height = bounds.height

            // Wrap-around logic
            if particles[i].position.x < 0 { particles[i].position.x += width }
            if particles[i].position.x > width { particles[i].position.x -= width }
            if particles[i].position.y < 0 { particles[i].position.y += height }
            if particles[i].position.y > height { particles[i].position.y -= height }

            // Xoay nhẹ
            particles[i].angle += 0.02

            // Nếu có touchPoint -> đẩy particle ra xa
            if let point = touchPoint {
                let dx = particles[i].position.x - point.x
                let dy = particles[i].position.y - point.y
                let distSq = dx*dx + dy*dy
                let radius: CGFloat = 80

                if distSq < radius * radius {
                    let dist = sqrt(distSq)
                    let force = max(10, (radius - dist)) / radius
                    particles[i].velocity.dx += (dx / dist) * force
                    particles[i].velocity.dy += (dy / dist) * force
                }
            }
        }

        // Reset touchPoint sau mỗi khung hình
        touchPoint = nil

        setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.clear(rect)

        for i in 0..<particles.count {
            for j in (i + 1)..<particles.count {
                let dx = particles[i].position.x - particles[j].position.x
                let dy = particles[i].position.y - particles[j].position.y
                let distance = sqrt(dx * dx + dy * dy)

                if distance < connectionDistance {
                    let opacity = 1.0 - (distance / connectionDistance)
                    context.setStrokeColor(UIColor.green.withAlphaComponent(opacity).cgColor)
                    context.setLineWidth(0.5)
                    context.move(to: particles[i].position)
                    context.addLine(to: particles[j].position)
                    context.strokePath()
                }
            }
        }

        for particle in particles {
            let halfLength = particle.length / 2
            let dx = cos(particle.angle) * halfLength
            let dy = sin(particle.angle) * halfLength

            let start = CGPoint(x: particle.position.x - dx, y: particle.position.y - dy)
            let end = CGPoint(x: particle.position.x + dx, y: particle.position.y + dy)

            context.setStrokeColor(UIColor.green.cgColor)
            context.setLineWidth(1.0)
            context.move(to: start)
            context.addLine(to: end)
            context.strokePath()
        }
    }

    // MARK: - Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            touchPoint = touch.location(in: self)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            touchPoint = touch.location(in: self)
        }
    }

    deinit {
        displayLink?.invalidate()
    }
}


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let particleView = ParticleView(frame: view.bounds)
        particleView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(particleView)
    }
}
// MARK: 3D
import UIKit
import simd

class MorphingDotSphereViewController: UIViewController {

    let numberOfDots = 300
    var dots: [Dot] = []
    var dotLayers: [CALayer] = []
    let containerView = UIView()
    let slider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupDots()
        setupSlider()

        setupDotLayers()
        updateDots(progress: 100)
    }

    func setupSlider() {
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)

        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)

        NSLayoutConstraint.activate([
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            slider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }

    func setupDots() {
        dots = (0..<numberOfDots).map { _ in
            let start = generateSpherePoint()
            let chaos = SIMD3<Double>(
                Double.random(in: -2...2),
                Double.random(in: -2...2),
                Double.random(in: -2...2)
            )
            let end = generateSpherePoint()
            return Dot(start: start, chaos: chaos, end: end)
        }
    }

    func setupDotLayers() {
        containerView.frame = view.bounds
        view.addSubview(containerView)

        for _ in 0..<numberOfDots {
            let dot = CALayer()
            dot.backgroundColor = UIColor.green.cgColor
            dot.cornerRadius = 3
            dot.frame = CGRect(x: 0, y: 0, width: 6, height: 6)
            containerView.layer.addSublayer(dot)
            dotLayers.append(dot)
        }
    }

    @objc func sliderChanged() {
        let progress = Double(slider.value) / 100.0
        updateDots(progress: progress)
    }

    func updateDots(progress: Double) {
        let size = view.bounds.size
        let center = SIMD2<Double>(Double(size.width / 2), Double(size.height / 2))
        let scale: Double = 150

        for (i, dot) in dots.enumerated() {
            let pos3D: SIMD3<Double>
            if progress <= 0.5 {
                let t = progress / 0.5
                pos3D = interpolate(dot.start, dot.chaos, t: t)
            } else {
                let t = (progress - 0.5) / 0.5
                pos3D = interpolate(dot.chaos, dot.end, t: t)
            }

            // Simple 3D projection (z affects scale)
            let depth = 1.0 / (1.0 + pos3D.z)
            let x2D = pos3D.x * scale * depth + center.x
            let y2D = pos3D.y * scale * depth + center.y

            let layer = dotLayers[i]
            layer.position = CGPoint(x: x2D, y: y2D)

            // Color morphing
            let color = interpolateColor(
                from: UIColor.green,
                to: UIColor.red,
                t: CGFloat(progress)
            )
            layer.backgroundColor = color.cgColor
        }
    }

    // MARK: - Helpers

    func generateSpherePoint() -> SIMD3<Double> {
        let u = Double.random(in: 0...1)
        let v = Double.random(in: 0...1)
        let theta = u * 2 * .pi
        let phi = acos(2 * v - 1)
        let r = pow(Double.random(in: 0...1), 1.0 / 3.0)

        let x = r * sin(phi) * cos(theta)
        let y = r * sin(phi) * sin(theta)
        let z = r * cos(phi)
        return SIMD3(x, y, z)
    }

    func interpolate(_ from: SIMD3<Double>, _ to: SIMD3<Double>, t: Double) -> SIMD3<Double> {
        return from * (1 - t) + to * t
    }

    func interpolateColor(from: UIColor, to: UIColor, t: CGFloat) -> UIColor {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        from.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        to.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        return UIColor(
            red: r1 + (r2 - r1) * t,
            green: g1 + (g2 - g1) * t,
            blue: b1 + (b2 - b1) * t,
            alpha: a1 + (a2 - a1) * t
        )
    }
}

// MARK: - Dot Model
struct Dot: Identifiable {
    let id = UUID()
    let start: SIMD3<Double>
    let chaos: SIMD3<Double>
    let end: SIMD3<Double>
}
