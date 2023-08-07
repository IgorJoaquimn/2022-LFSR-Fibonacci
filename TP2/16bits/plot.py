import matplotlib.pyplot as plt
import numpy as np

from sys import argv


dim = [900,1600]
encoded_img = np.zeros(dim)

f = open("output.txt", "r")
for i in range(dim[0]):
    for j in range(dim[1]):
        line = f.readline()
        encoded_img[i, j] = line
f.close()


plt.xlabel('x - axis')
# naming the y axis
plt.ylabel('y - axis')
  
# giving a title to my graph
plt.title('LFRS 16bits')
  
# function to show the plot
plt.imshow(encoded_img, cmap="gray")
plt.savefig('imagens/bitmap.png')