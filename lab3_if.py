### Calculate BMI ###
def cal_bmi(weight, height):
    height_in_metre = height / 100
    bmi = weight / (height_in_metre**2)
    
    if bmi < 18.5 and bmi > 0:
        print("Underweight")
    if bmi <= 24.9 and bmi > 18.5:
        print("Healthy Weight")
    if bmi <= 29.9 and bmi > 25:
        print("Overweight")
    if bmi >= 30.0:
        print("Obesity")

#print("Calculate BMI\n")
#weight = int(input("Enter weight : "))
#height = int(input("Enter height : "))
#cal_bmi(weight, height)


### Calculate grade ###
def cal_grade(score):
    if score >= 0 and score < 49:
        print("F")
    if score >= 50 and score < 59:
        print("D")
    if score >= 60 and score < 69:
        print("C")
    if score >= 70 and score < 79:
        print("B")
    if score >= 80 and score < 100:
        print("A")

#score = int(input("Enter score : "))
#cal_grade(score)



def check_football_area(width, length):
    if width > 64 and length > 100:
        return True
    else:
        return False

def check_basketball_area(width, length):
    if width > 15 and length > 28:
        return True
    else:
        return False
    
def check_volleyball_area(width, length):
    if width > 9 and length > 18:
        return True
    else:
        return False


#width = int(input("Enter width : "))
#length = int(input("Enter length : "))
#print("\nFootball   :", check_football_area(width, length))
#print("Basketball :", check_basketball_area(width, length))
#print("Volleyball :", check_volleyball_area(width, length))


def ball_sort(football, basketball, volleyball):
    if football > basketball and football > volleyball:
        return "Football"
    if basketball > football and basketball > volleyball:
        return "Basketball"
    if volleyball > football and volleyball > basketball:
        return "Volleyball"
    else:
        return "Invalid"

#football = int(input("Enter football : "))
#basketball = int(input("Enter basketball : "))
#volleyball = int(input("Enter volleyball : "))

#print(ball_sort(football, basketball, volleyball))

print("""เมืองหลวงของUSAคือสถานที่ใด???
1.London
2.Paris
3.Washington D.C.
4.Rome""")

Answer = int(input("And the answer is: "))
def answercheck(ans):
    if(ans == 3):
        print("ถูกต้องแล้วครับ!!!")
        print("-----(End)-----")
    else:
        if(ans == 1 or ans == 2 or ans == 4):
            print("คำตอบยังไม่ใช่ ลองหาคำตอบอีกครั้งนะ")
            print("-----(please Try Again)-----")
        else:
            print("[Error]")

answercheck(Answer)