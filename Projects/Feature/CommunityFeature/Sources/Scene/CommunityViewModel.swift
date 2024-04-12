import Foundation
import LikeServiceInterface
import CommunityServiceInterface
import BaseFeature

public let pagingInterval = 10

public final class CommunityViewModel: ObservableObject {
    
    // MARK: - Properties
    private let getCommunitesUseCase: any GetCommunitiesUseCase
    private let patchLikeUseCase: any PatchLikeUseCase
    
    // MARK: - State
    @Published var communities: [Community]
    @Published var isfetchingCommunities = false
    @Published var page = 1
    
    public init(
        getCommunitesUseCase: any GetCommunitiesUseCase,
        patchLikeUseCase: any PatchLikeUseCase,
        communities: [Community] = []
    ) {
        self.getCommunitesUseCase = getCommunitesUseCase
        self.patchLikeUseCase = patchLikeUseCase
        self.communities = communities
    }
    
    @MainActor
    func fetchCommunities() async {
        isfetchingCommunities = true
        defer { isfetchingCommunities = false }
        do {
            let nextPage = 1
            print("\(#function) - fetching ... nextPage: \(nextPage)")
            let request = PageRequest(page: nextPage, size: pagingInterval)
            
            let pagedCommunities = try await getCommunitesUseCase(request)
            dump(pagedCommunities)
            communities = pagedCommunities
            if !communities.isEmpty {
                page = nextPage
            }
        } catch {
            communities = []
            page = 1
            debugPrint(error)
        }
    }
    
    @MainActor
    func fetchNextCommunities() async {
        isfetchingCommunities = true
        defer { isfetchingCommunities = false }
        do {
            let nextPage = page + 1
            print("\(#function) - fetching ... nextPage: \(nextPage)")
            let request = PageRequest(page: nextPage, size: pagingInterval)
            
            let pagedCommunities = try await getCommunitesUseCase(request)
            dump(pagedCommunities)
            communities.append(contentsOf: pagedCommunities)
            if !communities.isEmpty {
                page = nextPage
            }
        } catch {
            communities = []
            page = 1
            debugPrint(error)
        }
    }
    
    @MainActor
    func patchLike(communityId: Int) async {
        do {
            _ = try await patchLikeUseCase(communityId: communityId)
        } catch {
            debugPrint(error)
        }
    }
}
