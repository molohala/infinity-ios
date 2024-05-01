import BaseService

public protocol CommunityDataSource {
    func getCommunities(_ req: PageRequest) async throws -> [Community]
    func createCommunity(_ req: CreateCommunityRequest) async throws
    func patchCommuntiy(_ req: PatchCommunityRequest) async throws
    func getCommunity(id: Int) async throws -> CommunityContent
    func removeCommunity(id: Int) async throws
    func getBestCommunities(count: Int) async throws -> [Community]
}
