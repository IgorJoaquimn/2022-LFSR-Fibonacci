import matplotlib.pyplot as plt
import numpy as np

from sys import argv

original_img = plt.imread("imagens/brasao.jpg").mean(axis=2)
binary_img = (original_img > 130).astype(int)

dim = original_img.shape
encoded_img = np.zeros(dim)

f = open("lfsr_output.txt", "r")
for i in range(dim[0]):
    for j in range(dim[1]):
        line = f.readline()
        encoded_img[i, j] = line
f.close()
f, ax = plt.subplots(nrows=1, ncols=2, figsize=(12, 6))

ax[0].imshow(original_img, cmap="gray")
ax[0].title.set_text('Imagem original')

ax[1].imshow(encoded_img, cmap="gray")
ax[1].title.set_text('Imagem cifrada')

for i in range(2):
    ax[i].tick_params(
        axis='both',
        which='both',
        bottom=False,
        left=False,
        labelbottom=False,
        labelleft=False
    )

name = f"Cifragem de imagem - LFSR (Período: {argv[1]})"
f.suptitle(name, fontsize=16, y = 0.96)
plt.show()
plt.savefig(f'{argv[1]}bits/imagens/imagem_gerada.png')