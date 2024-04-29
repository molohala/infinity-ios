import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .CommunityDetail,
    targets: [
        .feature(target: .CommunityDetail, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .CommunityDetail),
            .featureInterface(target: .CommunityEdit),
            .featureInterface(target: .ProfileDetail),
            .serviceInterface(target: .Community),
            .serviceInterface(target: .Like),
            .serviceInterface(target: .Comment),
            .featureInterface(target: .CommunityEdit)
        ]),
        .featureInterface(target: .CommunityDetail, dependencies: []),
        .featureExample(target: .CommunityDetail, dependencies: [
            .feature(target: .CommunityDetail),
            .serviceTesting(target: .Community),
            .serviceTesting(target: .Like),
            .serviceTesting(target: .Comment)
        ])
    ]
)
