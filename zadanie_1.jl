"""
ДАНО: Робот находится в произвольной клетке ограниченного прямоугольного поля без внутренних перегородок и маркеров.
РЕЗУЛЬТАТ: Робот — в исходном положении в центре прямого креста из маркеров, расставленных вплоть до внешней рамки.
"""

function mark_kross!(r::Robot)
    for side in (HorizonSide(i) for i=0:3) 
        putmarkers!(r,side)
        move_by_markers(r,inverse(side))
    end
    putmarker!(r)
end
putmarkers!(r::Robot,side::HorizonSide) = 
while isborder(r,side)==false 
    move!(r,side)
    putmarker!(r)
end
move_by_markers(r::Robot,side::HorizonSide) = 
while ismarker(r)==true 
    move!(r,side) 
end
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))