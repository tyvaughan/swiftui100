//
//  UnderstandingResultType.swift
//  P16_HotProspects_2024
//
//  Created by  Ty Vaughan on 4/1/24.
//

import SwiftUI

struct UnderstandingResultType: View {
    @State private var output = ""

    var body: some View {
        Text(output)
            .task {
                await fetchReadings2()
            }
    }
    
    /*
     So far, we're able to get data from a URL by parsing and using the response directly.
     */
    func fetchReadings1() async -> Void {
        do {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            output = "Found \(readings.count) readings"
        } catch {
            print("Download error")
        }
    }
    
    /*
     We can enhance this by using the Result data type for additional abilities:
     - stash work and do something else while its running
     - read the result at some point in the future
     - handle errors somewhere else entirely
     - cancel the work because its no longer needed
     */
    func fetchReadings2() async -> Void {
        /*
         By storing the task in a variable, we can use that variable to reference the data, reference any errors that might have occurred, and cancel the task.
         */
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        /*
         The Result type could hold a string, or it could hold an error that was thrown
         */
        let result = await fetchTask.result
        
        /*
         When referencing the result or error, we should make sure to handle it. There are two ways to do so.
         Option 1: with a do-catch
         */
        do {
            output = try result.get()
        } catch {
            output = "Error: \(error.localizedDescription)"
        }
        
        /*
         Option 2: with a switch
         */
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    UnderstandingResultType()
}
