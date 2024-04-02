import SwiftUI
import BaseFeature
import DesignSystem

public struct CommunityView: View {
    
    private var communityList = Array(0..<10)
    
    public init() {}
    
    public var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(communityList, id: \.self) { _ in
                        Button {
                            
                        } label: {
                            CommunityCell()
                                .padding(.horizontal, 16)
                        }
                        .applyAnimation()
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 128)
            }
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Button {
                    } label: {
                        Circle()
                            .frame(width: 64, height: 64)
                            .foregroundStyle(.blue)
                            .overlay {
                                Image(systemName: "square.and.pencil")
                                    .foregroundStyle(.white)
                            }
                    }
                    .applyAnimation()
                    .padding(.trailing, 24)
                    .padding(.bottom, 92)
                }
            }
        }
    }
}
