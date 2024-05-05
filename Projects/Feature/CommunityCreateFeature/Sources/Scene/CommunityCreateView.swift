import BaseFeature
import SwiftUI
import DesignSystem

public struct CommunityCreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: CommunityCreateViewModel
    
    public init(
        viewModel: CommunityCreateViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView {
            LazyVStack {
                GrowTextEditor("내용을 적어주세요", text: $viewModel.content)
                    .frame(minHeight: 300)
            }
            .padding(.horizontal, 16)
        }
        .hideKeyboardWhenTap()
        .growTopBar("글쓰기") {
            if viewModel.flow == .fetching {
                ProgressView()
            } else {
                Button("완료") {
                    Task {
                        await viewModel.createCommunity()
                    }
                }
            }
        }
        .onChange(of: viewModel.flow) {
            if $0 == .success {
                dismiss()
            }
        }
        .alert(
            viewModel.flow.rawValue,
            isPresented: .init(
                get: { viewModel.flow == .failure || viewModel.flow == .empty },
                set: { _ in viewModel.flow = .idle })
        ) {
            Button("확인", role: .cancel) {}
        }
    }
}
