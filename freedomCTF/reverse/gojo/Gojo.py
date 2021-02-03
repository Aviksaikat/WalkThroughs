import random

got_flag = False


def getFlag():
    with open('flag.txt', 'r') as f:
        print(f.read())
        got_flag = True


def welcome_msg():
    with open('gojou.txt', 'r') as fs:
        print(fs.read())
    print(f'Welcome to my domain... I am Satoru Gojo, and this is infinity.\nTrying to escape this?\nResistance is futile...')
    comand_list()


def comand_list():
    print(f'Here are few powers that you can use:\n1.Immense Cursed Energy\n2.Limitless\n3.Infinity\n4.Cursed Technique Lapse: Blue\n5.Cursed Technique Lapse Maximum Cursed Energy Output: Blue\n5.Cursed Technique Reversal: Red\n6.Hollow Purple\n7.Curtain\n8.Unlimited Void\n9.Six Eyes')




def limitless():
    print(f"You have invoked the power of limitless...")
    userInp = input(
        'You have limitless possibility choose the correct password to get the flag!!')

    if userInp[7:9] == "we":
        if userInp[4:7] == '{po':
            if userInp[2:4] == 'ag':
                if userInp[19:] == 'less}':
                    if userInp[9:13] == 'r_of':
                        if userInp[13:15] == '_l':
                            if userInp[15:19] == 'imit':
                                if userInp[0:2] == 'fl':
                                    getFlag()
    else:
        print(f"B R U H\nNot even close\nNice try... Good luck next time")


def immense_cursed_energy():
    print(f"Should you really use thi??\nhmmmmmmmmmm...\nKids shouldn't use it...")
    input()


def infinity():
    print(f"Infinity is a big number...\nYou can earn a pirze if you can tell me how big infinity is...")
    userInp = input('How big is infinity??')


def main():
    welcome_msg()
    user_input = int(input('Pick a power:'))
    if user_input == 1:
        immense_cursed_energy()
    elif user_input == 2:
        limitless()
    elif user_input == 3:
        infinity()
    elif user_input == 4:
        print("boooo!!!")
    elif user_input == 5:
        print("hahahhahahahahahahahahh")
    elif user_input == 6:
        print("Red is redder than red that is red, if you red read as red then you are red eyed that reads red as read")
    elif user_input == 7:
        print("Curtain..... Everything is hidden from you.....")
    elif user_input == 8:
        print('                             ')
    elif user_input == 9:
        print('000000')


while(not got_flag):
    main()
