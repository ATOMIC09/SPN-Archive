import turtle

t = turtle.Turtle()
t.shape("classic")
t.color("blue")
t.speed(20)
t.pensize(2)
for i in range(100):
    t.circle(10*i)

turtle.mainloop()