#ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля
#РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы

function full_area_marker(r::Robot,side::HorizonSide) 
    go_ugol!(r,(Sud,West))    
    NotBord = 1
    while NotBord == 1
        move_to_GorMarker!(r,side)
        if isborder(r,Nord) == true
            NotBord = 0
        else 
            NotBord = 1
            move!(r,Nord)
            side = inverse(side)
        end 
    end      
end
function go_ugol!(r::Robot, side::NTuple{2,HorizonSide})
    movements!(r,side[1])
    movements!(r,side[2])
end
function move_to_GorMarker!(r::Robot,side::HorizonSide)
    while !isborder(r,side)
        putmarker!(r)
        move!(r,side)
        
    end
    putmarker!(r)
end
function movements!(r,side)
    while !isborder(r,side)
        move!(r,side)
    end
end
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))