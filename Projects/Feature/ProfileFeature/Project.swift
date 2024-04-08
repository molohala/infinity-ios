import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ProfileFeature,
    targets: [
        .makeFeature(target: .ProfileFeature, dependencies: [
            .feature(target: .BaseFeature),
            .interface(target: .ProfileFeature),
            .interface(target: .SettingFeature)
        ]),
        .makeInterface(target: .ProfileFeature, dependencies: []),
        .makeFeatureExample(target: .ProfileFeature, dependencies: [
            .feature(target: .ProfileFeature)
        ])
    ]
)
