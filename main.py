import random
from matplotlib import pyplot as plt
import matplotlib
matplotlib.use('Agg')

def main():
    while(True):
        randomlist = []
        for i in range(0,10):
            n = random.randint(1,30)
            randomlist.append(n)
        plt.plot(randomlist)
        plt.show()
        user_input = input('Do you want another list (y/[n])? ')
        if user_input != 'y':
            break
    

if __name__ == '__main__':
    main()
