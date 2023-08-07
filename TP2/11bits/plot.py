import matplotlib.pyplot as plt
import numpy as np

from sys import argv

y = []
x = [i for i in range(0,150)]

f = open("output.txt", "r")
for i in range(150):
    y.append(int(f.readline()))
f.close()

plt.plot(x, y, color='blue', marker='o', markerfacecolor='blue')

plt.xlabel('x - axis')
# naming the y axis
plt.ylabel('y - axis')
  
# giving a title to my graph
plt.title('LFRS 11bits')
  
# function to show the plot
plt.show()
plt.savefig('imagens/grafico.png')