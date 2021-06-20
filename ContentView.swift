//
//  ContentView.swift
//  UI-243
//
//  Created by にゃんにゃん丸 on 2021/06/20.
//

import SwiftUI
extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

struct ContentView: View {
    @State var on = false
    var body: some View {
        
        Home()
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @State var selected : Int = 1
    var body: some View{
        
        VStack{
            
            TabView(selection:$selected){
                
                ForEach(1...3,id:\.self){index in
                    
                    GeometryReader{proxy -> AnyView in
                        
                        let minX = proxy.frame(in: .global).minX
                        
                        let progress = -minX / (UIScreen.main.bounds.width * 3)
                        
                        var scale  = progress > 0 ? 1 - progress : 1 + progress
                        
                        
                        scale = scale < 0.7 ? 0.7 : scale
                        
                        return AnyView(
                        
                            VStack {
                                Image("pic\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal,20)
                                    .frame(maxHeight: .infinity)
                                
                                
                                Text("Pet Adaptation")
                                    .font(.custom("Limelight-Regular", size: 30))
                                    .foregroundColor(.white)
                                
                                Text("Pet  Life is partner")
                                    .font(.custom("Limelight-Regular", size: 30))
                                    .foregroundColor(.primary)
                                    .padding([.top,.bottom])
                            }
                            .frame(maxHeight: .infinity)
                            .scaleEffect(scale)
                            .padding(.top,getRect().height < 750 ? 10 : 0)
                        
                        )
                        
                        
                        
                    }
                    .tag(index)
                    
                    
                    
                    
                }
                
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
            CutomIndeicatore(count: 3, selected: $selected)
                .padding(.bottom,getRect().height < 750 ? 10 : 15)
            
            
            VStack{
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack{
                        
                        Image(systemName: "applelogo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.primary)
                        
                        
                        Text("Sign in With Apple")
                            .font(.custom("Limelight-Regular", size: 20))
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                        
                            
                        
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                    .background(
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .overlay(
                        
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.primary,lineWidth: 1)
                        )
                        
                    
                    
                    )
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack{
                        
                        Image("google-symbol")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.primary)
                        
                        
                        Text("Sign in With Google")
                            .font(.custom("Limelight-Regular", size: 20))
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                        
                            
                        
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                    .background(
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .overlay(
                        
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.primary,lineWidth: 1)
                        )
                        
                    
                    
                    )
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack{
                        
                        Image("email")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.primary)
                        
                        
                        Text("Sign in With Email")
                            .font(.custom("Limelight-Regular", size: 20))
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                        
                            
                        
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                    .background(
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .overlay(
                        
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.primary,lineWidth: 1)
                        )
                        
                    
                    
                    )
                })
                
            }
            .padding()
            
            
            HStack{
                
                Text("Already have an Account?")
                    .font(.custom("Limelight-Regular", size: 15))
                    .foregroundColor(.white)
                
                Text("Login")
                    .font(.custom("Limelight-Regular", size: 15))
                    .underline(true, color: /*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                
            }
            .padding([.horizontal,.bottom])
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("c1").ignoresSafeArea())
        
        
        
        
    }
}


struct CutomIndeicatore : View {
    var count : Int
    @Binding var selected : Int
    
    var body: some View{
        
        HStack{
            
            ForEach(0..<count,id:\.self){index in
                
                
                ZStack{
                    
                    if (selected - 1) == index{
                        
                        
                        Circle()
                            .fill(Color.black)
                       
                        
                        
                        
                        
                    }
                    
                    else{
                        
                        Circle()
                            .fill(Color.white)
                            .overlay(
                            
                            Circle()
                                .stroke(Color.black,lineWidth: 1)
                            
                            )
                        
                        
                    }
                }
                .frame(width: 20, height: 20)
                
                
            }
            
            
        }
        
        
        
    }
}
