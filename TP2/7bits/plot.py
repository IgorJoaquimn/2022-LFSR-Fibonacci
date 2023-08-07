import matplotlib.pyplot as plt
import numpy as np

from sys import argv

y = []
x = [i for i in range(0,200)]

f = open("output.txt", "r")
for i in range(200):
    y.append(int(f.readline()))
f.close()

plt.plot(x, y, color='blue', marker='o', markerfacecolor='blue')

plt.xlabel('x - axis')
# naming the y axis
plt.ylabel('y - axis')
  
# giving a title to my graph
plt.title('LFRS 7bits')
  
# function to show the plot
plt.show()
plt.savefig('imagens/grafico.png')