//
//  DependencyManager.swift
//  GHFollowers
//
//  Created by Ahmed Ali on 09/07/2024.
//

import Swinject

class DependencyManager {
    static let shared = DependencyManager()
    let container: Container

    private init() {
        container = Container()
        initContainer()
    }

    private func initContainer() {
        container.register(NetworkManager.self) { _ in NetworkManagerImpl() }
    }
}

@propertyWrapper
struct Injected<Dependency> {
    var wrappedValue: Dependency
    
    init(wrappedValue: Dependency) {
        self.wrappedValue = DependencyManager.shared.container.resolve(Dependency.self)!
    }
}
