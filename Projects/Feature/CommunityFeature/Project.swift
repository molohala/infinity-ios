import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Community,
    targets: [
        .feature(target: .Community, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .Community),
            .featureInterface(target: .CommunityDetail),
            .featureInterface(target: .CommunityCreate)
        ]),
        .featureInterface(target: .Community, dependencies: []),
        .featureExample(target: .Community, dependencies: [
            .feature(target: .Community)
        ])
    ]
)
