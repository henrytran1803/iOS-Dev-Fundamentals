//
//  ViewController.swift
//  gRPC
//
//  Created by Việt Anh Trần on 14/5/25.
//

import UIKit
import GRPC
import NIO
import SwiftProtobuf

class ViewController: UIViewController {

    private var client: Hello_HelloServiceClient!
    private var group: MultiThreadedEventLoopGroup!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupGRPC()

        let button = UIButton(type: .system)
        button.setTitle("Say Hello", for: .normal)
        button.addTarget(self, action: #selector(sendHello), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        view.addSubview(button)
    }

    func setupGRPC() {
        // Create an event loop group
        group = MultiThreadedEventLoopGroup(numberOfThreads: 1)

        // Configure the gRPC connection
        let configuration = ClientConnection.Configuration.default(
            target: .hostAndPort("localhost", 50051),
            eventLoopGroup: group
        )

        // Create a secure or insecure connection
        let connection = ClientConnection.insecure(configuration: configuration)

        // Initialize the client
        client = Hello_HelloServiceClient(connection: connection)
    }

    @objc func sendHello() {
        Task {
            do {
                // Create the request
                var request = Hello_HelloRequest()
                request.name = "iOS UIKit"

                // Call the SayHello RPC
                let response = try await client.sayHello(request)
                print("Response from server: \(response.message)")
            } catch {
                print("Error: \(error)")
            }
        }
    }

    deinit {
        try? group.syncShutdownGracefully()
    }
}
