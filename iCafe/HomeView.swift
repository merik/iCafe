//
//  HomeView.swift
//  iCafe
//
//  Created by Erik Mai on 25/6/20.
//  Copyright © 2020 Erik Mai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewRouter = HomeViewRouter()
    @EnvironmentObject var order: Order

    private var isShowingMenu: Bool {
        return viewRouter.currentView == .menu
    }
    
    private var isShowingOrder: Bool {
        return viewRouter.currentView == .order
    }
    
    private var selectingColor = Color.black
    private var unselectingColor = Color.gray
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {
                if self.viewRouter.currentView == .menu {
                    MenuView()
                } else {
                    OrderView()
                }
                
                HStack {
                    VStack(alignment: .center, spacing: 0) {
                        Image(systemName: "list.dash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(10)
                            .frame(width: geometry.size.width / 2, height: 50)
                            .foregroundColor(self.isShowingMenu ? self.selectingColor : self.unselectingColor)
                        Text("Menu")
                            .font(.headline)
                            .foregroundColor(self.isShowingMenu ? self.selectingColor : self.unselectingColor)
                    }.frame(width: geometry.size.width / 2, height: 75, alignment: .center)
                    .onTapGesture {
                        self.viewRouter.currentView = .menu
                    }.foregroundColor(self.isShowingMenu ? self.selectingColor : self.unselectingColor)
                    
                    
                    VStack(alignment: .center, spacing: 0)  {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(10)
                            .frame(width: geometry.size.width / 2, height: 50)
                            .foregroundColor(self.isShowingOrder ? self.selectingColor : self.unselectingColor)
                        Text("Order")
                            .font(.headline)
                            .foregroundColor(self.isShowingOrder ? self.selectingColor : self.unselectingColor)
                        ZStack {
                            Circle()
                                .foregroundColor(.red)
                            Text("\(self.order.items.count)")
                                .foregroundColor(.white)
                                .font(Font.system(size: 12))
                                .fontWeight(.bold)
                            
                        }.frame(width: 15, height: 15, alignment: .center)
                            .offset(x: 10, y: -60)
                            .opacity(self.order.items.count > 0 ? 1.0 : 0.0)
                    }.frame(width: geometry.size.width / 2, height: 50, alignment: .center)
                    .onTapGesture {
                        self.viewRouter.currentView = .order
                    }
                .foregroundColor(self.isShowingOrder ? self.selectingColor : self.unselectingColor)
                    
                }.background(Color.gray.opacity(0.3))
                
                
            }.edgesIgnoringSafeArea(.bottom)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        HomeView().environmentObject(order)
    }
}
