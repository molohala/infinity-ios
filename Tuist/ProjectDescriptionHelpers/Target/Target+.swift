//
//  Target+Example.swift
//  Test2Manifests
//
//  Created by dgsw8th71 on 3/26/24.
//

import ProjectDescription
import EnvironmentPlugin

public extension Target {
    
    static func app(
        target: ModulePaths.App,
        dependenceis: [TargetDependency] = [],
        infoPlist: InfoPlist
    ) -> Self {
        .makeTarget(name: target.rawValue,
                    product: .app,
                    bundleId: "us.growapp",
                    infoPlist: infoPlist,
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    scripts: [.swiftLint, .needle],
                    dependencies: dependenceis)
    }
    
    static func feature(
        target: ModulePaths.Feature,
        product: Product = .staticLibrary,
        dependencies: [TargetDependency]
    ) -> Self {
        .makeTarget(name: "\(target.rawValue)Feature",
                    product: product,
                    bundleId: "\(env.organizationName).\(env.name).\(target.rawValue)feature",
                    infoPlist: .default,
                    sources: ["Sources/**"],
                    scripts: [.swiftLint],
                    dependencies: dependencies)
    }
    
    static func featureInterface(
        target: ModulePaths.Feature,
        dependencies: [TargetDependency]
    ) -> Self {
        .makeTarget(name: "\(target.rawValue)FeatureInterface",
                    product: .framework,
                    bundleId: "\(env.organizationName).\(env.name).\(target.rawValue)featureinterface",
                    infoPlist: .default,
                    sources: ["Interface/**"],
                    scripts: [.swiftLint],
                    dependencies: dependencies)
    }
    
    static func featureExample(
        target: ModulePaths.Feature,
        dependencies: [TargetDependency] = []
    ) -> Self {
        .makeTarget(name: "\(target.rawValue)Example",
                    product: .app,
                    bundleId: "\(env.organizationName).\(env.name).\(target.rawValue)featureexample",
                    infoPlist: .extendingDefault(with: [
                        "UIUserInterfaceStyle":"Light",
                        "LSRequiresIPhoneOS":.boolean(true),
                        "UIApplicationSceneManifest": [
                            "UIApplicationSupportsMultipleScenes": .boolean(false)
                        ],
                        "UILaunchStoryboardName": .string("")
                    ]),
                    sources: ["Example/**"],
                    dependencies: dependencies)
    }
    
    static func service(
        target: ModulePaths.Service,
        product: Product = .staticLibrary,
        dependencies: [TargetDependency]
    ) -> Self {
        .makeTarget(name: "\(target.rawValue)Service",
                    product: product,
                    bundleId: "\(env.organizationName).\(env.name).\(target.rawValue)service",
                    infoPlist: .default,
                    sources: ["Sources/**"],
                    scripts: [.swiftLint],
                    dependencies: dependencies)
    }
    
    static func serviceInterface(
        target: ModulePaths.Service,
        dependencies: [TargetDependency]
    ) -> Self {
        .makeTarget(name: "\(target.rawValue)ServiceInterface",
                    product: .framework,
                    bundleId: "\(env.organizationName).\(env.name).\(target.rawValue)serviceinterface",
                    infoPlist: .default,
                    sources: ["Interface/**"],
                    scripts: [.swiftLint],
                    dependencies: dependencies)
    }
    
    static func serviceTesting(
        target: ModulePaths.Service,
        dependencies: [TargetDependency]
    ) -> Self {
        .makeTarget(name: "\(target.rawValue)ServiceTesting",
                    product: .framework,
                    bundleId: "\(env.organizationName).\(env.name).\(target.rawValue)servicetesting",
                    infoPlist: .default,
                    sources: ["Testing/**"],
                    scripts: [.swiftLint],
                    dependencies: dependencies)
    }
    
    static func serviceTests(
        target: ModulePaths.Service,
        dependencies: [TargetDependency]
    ) -> Self {
        .makeTarget(name: "\(target.rawValue)ServiceTests",
                    product: .uiTests,
                    bundleId: "\(env.organizationName).\(env.name).\(target.rawValue)servicetests",
                    infoPlist: .default,
                    sources: ["Tests/**"],
                    scripts: [.swiftLint],
                    dependencies: dependencies)
    }
    
    static func shared(
        target: ModulePaths.Shared,
        dependencies: [TargetDependency]
    ) -> Self {
        .makeTarget(name: target.rawValue,
                    product: .framework,
                    bundleId: "\(env.organizationName).\(env.name).\(target.rawValue)shared",
                    infoPlist: .default,
                    sources: ["Sources/**"],
                    scripts: [.swiftLint],
                    dependencies: dependencies)
    }
    
    static func userInterface(
        target: ModulePaths.UserInterface,
        dependencies: [TargetDependency] = []
    ) -> Self {
        .makeTarget(name: target.rawValue,
                    product: .framework,
                    bundleId: "\(env.organizationName).\(env.name).\(target.rawValue)userinterface",
                    infoPlist: .default,
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    scripts: [.swiftLint],
                    dependencies: dependencies)
    }
    
    static func userInterfaceExample(
        target: ModulePaths.UserInterface,
        dependencies: [TargetDependency]
    ) -> Self {
        .makeTarget(name: "\(target.rawValue)Example",
                    product: .app,
                    bundleId: "\(env.organizationName).\(env.name).\(target.rawValue)userinterfaceexample",
                    infoPlist: .extendingDefault(with: [
                        "UIUserInterfaceStyle":"Light",
                        "LSRequiresIPhoneOS":.boolean(true),
                        "UIApplicationSceneManifest": [
                            "UIApplicationSupportsMultipleScenes": .boolean(false)
                        ],
                        "UILaunchStoryboardName": .string("")
                    ]),
                    sources: ["Example/**"],
                    resources: ["Resources/**"],
                    scripts: [.swiftLint],
                    dependencies: dependencies)
    }
}
