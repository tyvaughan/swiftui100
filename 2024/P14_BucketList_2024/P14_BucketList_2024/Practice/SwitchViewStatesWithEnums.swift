//
//  SwitchViewStatesWithEnums.swift
//  P14_BucketList_2024
//
//  Created by  Ty Vaughan on 3/22/24.
//

import SwiftUI

struct SwitchViewStatesWithEnums: View {
    
    @State private var loadingState: LoadingState = .loading
    
    var body: some View {
        VStack {
            switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailedView()
            }
        }
    }
    
    // MARK: Loading state enum
    enum LoadingState {
        case loading, success, failed
    }

    // MARK: Loading state views
    struct LoadingView: View {
        var body: some View {
            Text("Loading...")
        }
    }
    
    struct SuccessView: View {
        var body: some View {
            Text("Success!")
        }
    }
    
    struct FailedView: View {
        var body: some View {
            Text("Failed.")
        }
    }
}



#Preview {
    SwitchViewStatesWithEnums()
}
