import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .ProfileEdit,
    targets: [
        .feature(target: .ProfileEdit, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .ProfileEdit)
        ]),
        .featureInterface(target: .ProfileEdit, dependencies: []),
        .featureExample(target: .ProfileEdit, dependencies: [
            .feature(target: .ProfileEdit)
        ])
    ]
)
