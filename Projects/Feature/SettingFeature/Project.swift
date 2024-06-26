import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeFeature(
    target: .Setting,
    targets: [
        .feature(target: .Setting, dependencies: [
            .feature(target: .Base),
            .featureInterface(target: .Setting),
            .featureInterface(target: .ProfileEdit),
            .featureInterface(target: .BaekjoonSetting),
            .featureInterface(target: .GithubSetting),
            .featureInterface(target: .Block),
            .serviceInterface(target: .Auth)
        ]),
        .featureInterface(target: .Setting, dependencies: [])
    ]
)
