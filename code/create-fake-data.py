import numpy as np


wave = np.sin(np.arange(0, 100, 0.1))
data = np.array([
    wave + np.random.random(len(wave)),
    wave + np.random.random(len(wave)),
])

np.savez("bunch-o-numbers.npz", data=data)
