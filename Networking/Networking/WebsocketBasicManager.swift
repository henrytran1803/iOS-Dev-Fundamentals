//
//  WebsocketBasicManager.swift
//  Networking
//
//  Created by Việt Anh Trần on 7/6/25.
//

import Foundation
import UIKit
import Foundation
import SocketIO

class WebSocketBasicManager {

        private var manager: SocketManager!
        private var socket: SocketIOClient!

        init() {
            let url = URL(string: "http://192.168.1.217:8000")!
            manager = SocketManager(socketURL: url, config: [.log(true), .compress])
            socket = manager.defaultSocket

            socket.on(clientEvent: .connect) {data, ack in
                print("✅ Socket connected")
            }

            socket.on("response") { data, ack in
                guard let dict = data.first as? [String: Any],
                      let message = dict["message"] as? String else {
                    print("❌ Invalid data received: \(data)")
                    return
                }

                print("📥 Server says: \(message)")
            }


            socket.connect()
        }

        func send(message: String) {
            socket.emit("message", message)
        }

        func disconnect() {
            socket.disconnect()
        }
    }
