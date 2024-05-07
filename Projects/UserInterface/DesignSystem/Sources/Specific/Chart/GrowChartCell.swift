import SwiftUI
import InfoServiceInterface
import DateUtil

public enum ChartType: Equatable {
    case github
    case baekjoon
    
    var icon: GrowIconography {
        switch self {
        case .github: .github
        case .baekjoon: .baekjoon
        }
    }
    
    var iconColor: GrowColorScheme {
        switch self {
        case .github: .github
        case .baekjoon: .baekjoon
        }
    }
}

public struct ChartInfo: Equatable {
    let label: String
    let description: String
    let type: ChartType
    let chartData: GrowChartData
    
    public init(
        label: String,
        description: String,
        type: ChartType,
        chartData: GrowChartData
    ) {
        self.label = label
        self.description = description
        self.type = type
        self.chartData = chartData
    }
}

public struct GrowChartCell: View {
    
    private let chartInfo: ChartInfo
    
    public init(
        chartInfo: ChartInfo
    ) {
        self.chartInfo = chartInfo
    }
    
    public var body: some View {
            VStack(spacing: 8) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(chartInfo.label)
                            .growFont(.title1B)
                            .growColor(.textNormal)
                        Text(chartInfo.description)
                            .growFont(.labelM)
                            .growColor(.textDarken)
                    }
                    Spacer()
                    Image(icon: chartInfo.type.icon)
                        .resizable()
                        .growIconColor(chartInfo.type.iconColor)
                        .frame(size: 28)
                }
                if chartInfo.chartData.sum > 0 {
                    GrowChart(chartData: chartInfo.chartData, type: chartInfo.type)
                        .frame(height: 200)
                        .growBackground(.background)
                } else {
                    GrowMotivationCell()
                }
            }
            .padding(16)
            .applyCardView()
    }
}

public extension [Commit] {
    var githubWeekChartInfo: ChartInfo {
        .init(
            label: "\(self.map { $0.contributionCount }.reduce(0, +))",
            description: "이번주에 한 커밋",
            type: .github,
            chartData: .init(
                data: self.map { ($0.date.monthPerDay ?? "", $0.contributionCount) },
                color: .blue
            )
        )
    }
}

public extension [Solve] {
    var baekjoonWeekChartInfo: ChartInfo {
        .init(
            label: "\(self.map { $0.solvedCount }.reduce(0, +))",
            description: "이번주에 푼 문제",
            type: .baekjoon,
            chartData: .init(
                data: self.map { ($0.date.monthPerDay ?? "", $0.solvedCount) },
                color: .green
            )
        )
    }
}
