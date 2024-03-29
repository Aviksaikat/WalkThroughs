#!/usr/bin/env python3.7


# Santa only wants every third line!
song =  """You know Dasher, and Dancer, and """
#song += """#Prancer, and Vixen, """
#song += """#Comet, and Cupid, and"""
song += """Donder and Blitzen """
#song += """#But do you recall """
#song += """#The most famous reindeer of all"""
song += """Rudolph, the red-nosed reindeer """
#song += """#had a very shiny nose """
#song += """#and if you ever saw it"""
song += """you would even say it glows. """
#song += """#All of the other reindeer """
#song += """#used to laugh and call him names"""
song += """They never let poor Rudolph """
#song += """#play in any reindeer games. """
#song += """#Then one foggy Christmas eve"""
song += """Santa came to say: """
#song += """    #Rudolph with your nose so bright, """
#song += """    #won't you guide my sleigh tonight?"""
song += """Then all the reindeer loved him """
#song += """#as they shouted out with glee, """
#song += """#Rudolph the red-nosed reindeer,"""
song += """you'll go down in history!"""

flag = []
correct = [17, 55, 18, 92, 91, 10, 38, 8, 76, 127, 17, 12, 17, 2, 20, 49, 3, 4, 16, 8, 3, 58, 67, 60, 10, 66, 31, 95, 1, 93]

for i,c in enumerate(correct):
    correct[i] ^= ord(song[i*10 % len(song)])
    flag.append(chr(correct[i]))

print(''.join(flag))
