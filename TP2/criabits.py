import matplotlib.pyplot as plt
import numpy as np
original_img = plt.imread("imagens/brasao.jpg").mean(axis=2)
binary_img = (original_img > 130).astype(int)

f = open("bits.txt", "w")
for bit in np.nditer(binary_img):
    f.write(str(int(bit)))
f.close()