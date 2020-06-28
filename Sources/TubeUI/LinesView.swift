
import TubeKit
import SwiftUI

struct LinesView: View {
    let lines: [Line]
    var body: some View {
        ScrollView {
            ForEach(lines) { line in

                Text(line.name)
                    .padding()
                    .background(line.color)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
