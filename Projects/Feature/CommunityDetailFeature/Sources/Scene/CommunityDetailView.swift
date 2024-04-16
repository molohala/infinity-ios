import BaseFeature
import SwiftUI
import CommunityDetailFeatureInterface
import DesignSystem
import CommunityServiceInterface
import CommentServiceInterface

public struct CommunityDetailView: View {
    
    @State private var reader: ScrollViewProxy?
    
    @StateObject private var viewModel: CommunityDetailViewModel
    @State private var showEmptyAlert = false
    @Environment(\.dismiss) private var dismiss
    
    public init(
        viewModel: CommunityDetailViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            ScrollViewReader { reader in
                ScrollView {
                    if viewModel.communityFlow == .success,
                        let community = viewModel.community,
                       viewModel.commentFlow == .success,
                       let comments = viewModel.comments {
                        VStack(alignment: .leading, spacing: 16) {
                            profile(community)
                            Text(community.content)
                                .font(.body)
                                .lineSpacing(.infinityLineSpacing)
                                .fontWeight(.medium)
                            info(community)
                            Divider()
                            self.makeComments(comments)
                                .padding(.bottom, 64)
                        }
                        .padding(.horizontal, 16)
                        .onAppear {
                            self.reader = reader
                        }
                    } else {
                        ShimmerCommunityDetailCell()
                            .shimmer()
                    }
                }
            }
            VStack(spacing: 0) {
                Spacer()
                Divider()
                HStack {
                    TextField("댓글을 남겨보세요", text: $viewModel.comment)
                        .padding(8)
                        .font(.body)
                    Button {
                        guard !viewModel.comment.isEmpty else {
                            showEmptyAlert = true
                            return
                        }
                        Task {
                            await viewModel.createComment()
                            if let reader {
                                if let last = viewModel.comments?.last {
                                    withAnimation {
                                        reader.scrollTo(last.commentId, anchor: .top)
                                    }
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .renderingMode(.template)
                            .font(.title)
                            .foregroundStyle(.blue)
                    }
                }
                .padding(.horizontal, 8)
                .padding(8)
                .background(Color.white)
            }
        }
        .background(Color.white)
        .hideKeyboardWhenTap()
        .infinityTopBar("")
        .task {
            async let fetchCommunity: () = viewModel.fetchCommunity()
            async let fetchComment: () = viewModel.fetchComments()
            _ = await (fetchCommunity, fetchComment)
        }
        .alert(
            "게시글을 불러올 수 없습니다",
            isPresented: .init(
                get: { viewModel.commentFlow == .failure || viewModel.commentFlow == .failure },
                set: { _ in dismiss() }
            )
        ) {
            Button("확인", role: .cancel) {
                dismiss()
            }
        }
    }
    
    @ViewBuilder
    func profile(_ c: Community) -> some View {
        HStack(spacing: 0) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            VStack(spacing: 2) {
                Text(c.writerName)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                Text(c.createdAt.timeAgo)
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
                    .padding(.leading, 4)
            }
            Spacer()
            Button {
                //
            } label: {
                DesignSystemAsset.detailVerticalLine.swiftUIImage
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.gray)
            }
        }
    }
    
    @ViewBuilder
    private func info(_ c: Community) -> some View {
        HStack {
            Button {
                //
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "heart.fill")
                        .font(.headline)
                        .foregroundStyle(Color.red400)
                    
                    Text("\(c.like)")
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private func makeComments(_ comments: [Comment]) -> some View {
        LazyVStack(spacing: 20) {
            ForEach(comments, id: \.commentId) { comment in
                CommentCell(comment: comment)
            }
        }
    }
}
