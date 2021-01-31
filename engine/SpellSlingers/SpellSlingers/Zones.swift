//
//  Zones.swift
//  SpellSlingers
//
//  Created by Skyyler Siejko on 1/31/21.
//  Copyright © 2021 Skyyler Siejko. All rights reserved.
//

import Foundation


import SwiftUI

struct ContentView: View {
    let img1url = Bundle.main.url(forResource: "Images/grapes", withExtension: "png")
    let img2url = Bundle.main.url(forResource: "Images/banana", withExtension: "png")
    let img3url = Bundle.main.url(forResource: "Images/peach", withExtension: "png")
    let img4url = Bundle.main.url(forResource: "Images/kiwi", withExtension: "png")
    
    var body: some View {
        HStack {
            VStack {
                DragableImage(url: img1url!)
                
                DragableImage(url: img3url!)
            }
            
            VStack {
                DragableImage(url: img2url!)
                
                DragableImage(url: img4url!)
            }
            
            DroppableArea()
        }.padding(40)
    }
    
    struct DragableImage: View {
        let url: URL
        
        var body: some View {
            Image(nsImage: NSImage(byReferencing: url))
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .padding(2)
                .overlay(Circle().strokeBorder(Color.black.opacity(0.1)))
                .shadow(radius: 3)
                .padding(4)
                .onDrag { return NSItemProvider(object: self.url as NSURL) }
        }
    }
    
    struct DroppableArea: View {
        @State private var imageUrls: [Int: URL] = [:]
        @State private var active = 0
        
        var body: some View {
            let dropDelegate = MyDropDelegate(imageUrls: $imageUrls, active: $active)
            
            return VStack {
                HStack {
                    GridCell(active: self.active == 1, url: imageUrls[1])
                    
                    GridCell(active: self.active == 3, url: imageUrls[3])
                }
                
                HStack {
                    GridCell(active: self.active == 2, url: imageUrls[2])

                    GridCell(active: self.active == 4, url: imageUrls[4])
                }
                
            }
            .background(Rectangle().fill(Color.gray))
            .frame(width: 300, height: 300)
            .onDrop(of: ["public.file-url"], delegate: dropDelegate)
            
        }
    }
    
    struct GridCell: View {
        let active: Bool
        let url: URL?
        
        var body: some View {
            let img = Image(nsImage: url != nil ? NSImage(byReferencing: url!) : NSImage())
                .resizable()
                .frame(width: 150, height: 150)
            
            return Rectangle()
                .fill(self.active ? Color.green : Color.clear)
                .frame(width: 150, height: 150)
                .overlay(img)
        }
    }
    
    struct MyDropDelegate: DropDelegate {
        @Binding var imageUrls: [Int: URL]
        @Binding var active: Int
        
        func validateDrop(info: DropInfo) -> Bool {
            return info.hasItemsConforming(to: ["public.file-url"])
        }
        
        func dropEntered(info: DropInfo) {
            NSSound(named: "Morse")?.play()
        }
        
        func performDrop(info: DropInfo) -> Bool {
            NSSound(named: "Submarine")?.play()
            
            let gridPosition = getGridPosition(location: info.location)
            self.active = gridPosition
            
            if let item = info.itemProviders(for: ["public.file-url"]).first {
                item.loadItem(forTypeIdentifier: "public.file-url", options: nil) { (urlData, error) in
                    DispatchQueue.main.async {
                        if let urlData = urlData as? Data {
                            self.imageUrls[gridPosition] = NSURL(absoluteURLWithDataRepresentation: urlData, relativeTo: nil) as URL
                        }
                    }
                }
                
                return true
                
            } else {
                return false
            }

        }
        
        func dropUpdated(info: DropInfo) -> DropProposal? {
            self.active = getGridPosition(location: info.location)
                        
            return nil
        }
        
        func dropExited(info: DropInfo) {
            self.active = 0
        }
        
        func getGridPosition(location: CGPoint) -> Int {
            if location.x > 150 && location.y > 150 {
                return 4
            } else if location.x > 150 && location.y < 150 {
                return 3
            } else if location.x < 150 && location.y > 150 {
                return 2
            } else if location.x < 150 && location.y < 150 {
                return 1
            } else {
                return 0
            }
        }
    }
}
Making Sense of the Code
First we mark our views as draggable, by calling onDrag. There, we simply sets the data that will be dragged with the view. In the example we are using a URL, but any type can be used. Some can be used directly with NSItemProvider. For other types, you may need to work a little harder. However, NSItemProvider is way out of the scope of this article. Fortunately, there’s plenty of resources already available… starting by Apple’s documentation

On the other side, you need to define how to handle the drop. We will do it by specifying a DropDelegate. This is a protocol that we need to implement. Although the protocol has many methods, only one is required: performDrop. The rest are optional.

In the example above, MyDropDelegate uses all methods in the protocol, to demonstrate how they work.

Drag and Drop with List Views
Important: As some readers pointed out, drag and drop on List views seems to work only on iPad, not iPhone.

We will now discuss some special considerations about Drag and Drop on List views. In the following example, we use the onDrag method on a List view. As you can see in the video, you can select multiple draggable rows.

You can also observe how views are draggable even outside the app. In this case we are dragging them to the Files app. Note that this behavior is not exclusive to List views.

import SwiftUI

struct Fruit: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

struct ContentView: View {
    @State var selection: Set<UUID> = []
    
    @State private var fruitsTop = [
        Fruit(name: "Apple", image: "apple"),
        Fruit(name: "Banana", image: "banana"),
        Fruit(name: "Grapes", image: "grapes"),
        Fruit(name: "Peach", image: "peach"),
        Fruit(name: "Kiwi", image: "kiwi"),
    ]

    @State private var fruitsBottom = [
        Fruit(name: "Peach", image: "peach"),
        Fruit(name: "Kiwi", image: "kiwi"),
    ]
    
    var body: some View {

        VStack {
            NavigationView {
                List(selection: $selection) {
                    ForEach(fruitsTop) { fruit in
                        HStack {
                            Image(fruit.image)
                                .resizable()
                                .frame(width: 30, height: 30)

                            Text(fruit.name)
                        }
                        .onDrag {
                            let provider = NSItemProvider(object: UIImage(named: fruit.image) ?? UIImage())
                            provider.suggestedName = fruit.name
                            return provider
                        }
                    }.onInsert(of: ["public.image"]) { self.insertFruit(position: $0, itemProviders: $1, top: true) }
                }
                .navigationBarItems(trailing: EditButton())
                .navigationBarTitle("Fruits (Top)")
            }
            
            NavigationView {
                List(selection: $selection) {
                    ForEach(fruitsBottom) { fruit in
                        HStack {
                            Image(fruit.image)
                                .resizable()
                                .frame(width: 30, height: 30)

                            Text(fruit.name)
                        }
                        .onDrag {
                            let provider = NSItemProvider(object: UIImage(named: fruit.image) ?? UIImage())
                            provider.suggestedName = fruit.name
                            return provider
                        }

                    }.onInsert(of: ["public.image"]) { self.insertFruit(position: $0, itemProviders: $1, top: false) }
                }
                .navigationBarItems(trailing: EditButton())
                .navigationBarTitle("Fruits (Bottom)")
            }
        }
    }
    
    func insertFruit(position: Int, itemProviders: [NSItemProvider], top: Bool) {
        for item in itemProviders.reversed() {

            item.loadObject(ofClass: UIImage.self) { image, error in
                if let _ = image as? UIImage {

                    DispatchQueue.main.async {
                        let f = Fruit(name: item.suggestedName ?? "Unknown",
                                      image: item.suggestedName?.lowercased() ?? "unknown")
                        
                        if top {
                            self.fruitsTop.insert(f, at: position)
                        } else {
                            self.fruitsBottom.insert(f, at: position)
                        }
                    }
                }
            }
        }
    }
}
