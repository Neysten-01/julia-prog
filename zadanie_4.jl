#ДАНО: Робот - Робот - в произвольной клетке ограниченного прямоугольного поля

#РЕЗУЛЬТАТ: Робот - в исходном положении, и клетки поля промакированы так: нижний ряд - полностью, следующий - весь, за исключением одной последней клетки на Востоке, следующий - за исключением двух последних клеток на Востоке, и т.д.

function triangle(r::Robot,side::HorizonSide) 
    go_ugol!(r,(Sud,West))
    n = move_counter!(r,Ost)
    movements!(r,inverse(Ost))
    while !isborder(r,Nord)
        n-=1
        move!(r,Nord)
        move_control_side!(r,Ost,n)
    end  
end
function move_control_side!(r::Robot,side::HorizonSide,steps::Int)
    i = 0
    putmarker!(r)
    while i  < steps
        i+=1
        move!(r,side)
        putmarker!(r)
    end
    movements!(r,inverse(side))
end
function go_ugol!(r::Robot, side::NTuple{2,HorizonSide}) 
    movements!(r,side[1])
    movements!(r,side[2])
end
function move_counter!(r::Robot,side::HorizonSide)
    n = 0
    putmarker!(r)
    while !isborder(r,side)
        move!(r,side)
        putmarker!(r)
        n+=1
    end
    return n
end
function movements!(r,side)
    while !isborder(r,side)
        move!(r,side)
    end
end
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))