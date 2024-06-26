public protocol CommunityDomainBuildable {
    var getCommunitiesUseCase: any GetCommunitiesUseCase { get }
    var createCommunityUseCase: any CreateCommunityUseCase { get }
    var patchCommunityUseCase: any PatchCommunityUseCase { get }
    var getCommunityUseCase: any GetCommunityUseCase { get }
    var removeCommunityUseCase: any RemoveCommunityUseCase { get }
    var getBestCommunitiesUseCase: any GetBestCommuntiesUseCase { get }
    var reportCommunityUseCase: any ReportCommunityUseCase { get }
}
