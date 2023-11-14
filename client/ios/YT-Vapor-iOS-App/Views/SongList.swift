//
//  SongList.swift
//  YT-Vapor-iOS-App
//
//  Created by Aziz's MacBook Air on 26.04.2023.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var viewModel = SongListViewModel()
    
    @State var modal: ModalType? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.songs) { song in
                    Button{
                        modal = .update(song)
                    } label: {
                        Text(song.title)
                            .font(.title3)
                            .foregroundColor(Color(.label))
                        
                    }
                }.onDelete(perform: viewModel.delete)
            }
            .refreshable {
                Task {
                    do {
                        try await viewModel.fetchSongs()
                    } catch {
                        print("error \(error)")
                    }
                }
            }
            .navigationTitle(Text("Songs"))
            .toolbar {
                Button {
                    modal = .add
                } label: {
                    Label("Add Song", systemImage: "plus.circle")
                }
            }
        }
        .sheet(item: $modal, onDismiss: {
            Task {
                do {
                    try await viewModel.fetchSongs()
                } catch {
                    print("error \(error)")
                }
            }
        }) { modal in
            switch modal{
            case .add:
                AddUpdateSong(viewModel: AddUpdateSongViewModel())
            case .update(let song):
                AddUpdateSong(viewModel: AddUpdateSongViewModel(currentSong: song))
            }
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchSongs()
                } catch {
                    print("error \(error)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
