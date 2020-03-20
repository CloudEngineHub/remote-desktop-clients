//
//  ContentView.swift
//  bVNC
//
//  Created by iordan iordanov on 2019-12-25.
//  Copyright © 2019 iordan iordanov. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

struct ContentView : View {
    
    @ObservedObject var stateKeeper: StateKeeper
    
    var body: some View {
        VStack {
            if stateKeeper.currentPage == "page1" {
                ContentViewA(stateKeeper: stateKeeper,
                             sshAddressText: stateKeeper.settings.string(forKey: "sshAddress") ?? "",
                             sshPortText: stateKeeper.settings.string(forKey: "sshPort") ?? "22",
                             sshUserText: stateKeeper.settings.string(forKey: "sshUser") ?? "",
                             sshPassText: stateKeeper.settings.string(forKey: "sshPass") ?? "",

                             addressText: stateKeeper.settings.string(forKey: "address") ?? "",
                             portText: stateKeeper.settings.string(forKey: "port") ?? "5900",
                             usernameText: stateKeeper.settings.string(forKey: "username") ?? "",
                             passwordText: stateKeeper.settings.string(forKey: "password") ?? "",
                             certText: stateKeeper.settings.string(forKey: "cert") ?? "")
            } else if stateKeeper.currentPage == "page2" {
                ContentViewB(stateKeeper: stateKeeper)
            } else if stateKeeper.currentPage == "page3" {
                ContentViewC(stateKeeper: stateKeeper)
            } else if stateKeeper.currentPage == "page4" {
                ContentViewD()
            }
        }
    }
}

struct ContentViewA : View {
    
    @ObservedObject var stateKeeper: StateKeeper
    var settings: UserDefaults = UserDefaults.standard
    
    @State var sshAddressText: String
    @State var sshPortText: String
    @State var sshUserText: String
    @State var sshPassText: String
    @State var addressText: String
    @State var portText: String
    @State var usernameText: String
    @State var passwordText: String
    @State var certText: String

    var body: some View {
        ScrollView {
            VStack {
                Button(action: {
                    self.stateKeeper.currentPage = "page2"
                    self.stateKeeper.connectionSettings = ConnectionSettings(
                        sshAddress: self.sshAddressText, sshPort: self.sshPortText,
                        sshUser: self.sshUserText, sshPass: self.sshPassText,
                        address: self.addressText, port: self.portText,
                        username: self.usernameText, password: self.passwordText, cert: self.certText)
                    
                    self.stateKeeper.settings.set(self.sshAddressText, forKey: "sshAddress")
                    self.stateKeeper.settings.set(self.sshPortText, forKey: "sshPort")
                    self.stateKeeper.settings.set(self.sshUserText, forKey: "sshUser")
                    self.stateKeeper.settings.set(self.sshPassText, forKey: "sshPass")
                    self.stateKeeper.settings.set(self.addressText, forKey: "address")
                    self.stateKeeper.settings.set(self.portText, forKey: "port")
                    self.stateKeeper.settings.set(self.usernameText, forKey: "username")
                    self.stateKeeper.settings.set(self.passwordText, forKey: "password")
                    self.stateKeeper.settings.set(self.certText, forKey: "cert")
                    self.stateKeeper.connect()
                }) {
                    Text("Connect")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(10)
                        /*
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 4)
                        )*/
                }

                Text("VNC Connection Parameters")
                TextField("SSH Server", text: $sshAddressText).autocapitalization(.none)
                TextField("SSH Port", text: $sshPortText).autocapitalization(.none)
                TextField("SSH User", text: $sshUserText).autocapitalization(.none)
                SecureField("SSH Password or Passphrase", text: $sshPassText).autocapitalization(.none)
            }
            VStack {
                TextField("Address", text: $addressText).autocapitalization(.none)
                TextField("Port", text: $portText)
                TextField("User", text: $usernameText).autocapitalization(.none)
                SecureField("Password", text: $passwordText)
                TextField("Certificate Authority", text: $certText).padding(.bottom, 500)
            }
        }
    }
}

struct ContentViewB : View {
    
    @ObservedObject var stateKeeper: StateKeeper
    
    var body: some View {
        VStack {
            Text("Connecting to VNC Server")
            Button(action: {
                self.stateKeeper.disconnect()
            }) {
                Text("Disconnect")
            }
        }
    }
}

struct ContentViewC : View {
    
    @ObservedObject var stateKeeper: StateKeeper
    
    var body: some View {
        VStack {
            Text("Disconnecting from VNC Server")
        }
    }
}

struct ContentViewD : View {
    var body: some View {
        Text("")
    }
}


struct ContentViewA_Previews : PreviewProvider {
    static var previews: some View {
        ContentViewA(stateKeeper: StateKeeper(), sshAddressText: "", sshPortText: "", sshUserText: "", sshPassText: "", addressText: "", portText: "", usernameText: "", passwordText: "", certText: "")
    }
}

struct ContentViewB_Previews : PreviewProvider {
    static var previews: some View {
        ContentViewB(stateKeeper: StateKeeper())
    }
}

struct ContentViewC_Previews : PreviewProvider {
    static var previews: some View {
        ContentViewC(stateKeeper: StateKeeper())
    }
}

struct ContentViewD_Previews : PreviewProvider {
    static var previews: some View {
        ContentViewD()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(stateKeeper: StateKeeper())
    }
}
