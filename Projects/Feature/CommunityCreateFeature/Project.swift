import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityCreate,
    targets: [
        .feature(target: .CommunityCreate, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .CommunityCreate)
        ]),
        .featureInterface(target: .CommunityCreate, dependencies: []),
        .featureExample(target: .CommunityCreate, dependencies: [
            .feature(target: .CommunityCreate)
        ])
    ]
)
