import numpy as np
from matplotlib import pyplot as plt
 
X = np.array([
    [-2, 4, -1],
    [4, 1, -1],
    [1, 6, -1],
    [2, 4, -1],
    [6, 4, -1],
])
 
Y = np.array([-1,-1,1,1,1])
 
 
def svm_sgd_plot(X, Y):
    w = np.zeros(len(X[0]))
    eta = 1
    epochs = 100000
    errors = []
 
    for epoch in range(1,epochs):
        error = 0
        for i, x in enumerate(X):
            if (Y[i]*np.dot(X[i], w)) < 1:
                w = w + eta * ( (X[i] * Y[i]) + (-2  *(1/epoch)* w) )
                error = 1
            else:
                w = w + eta * (-2  *(1/epoch)* w)
        errors.append(error)
         
 
        plt.plot(errors, '|')
        plt.ylim(0.5,1.5)
        plt.axes().set_yticklabels([])
        plt.xlabel('Epoch')
        plt.ylabel('Misclassified')
        plt.show()
 
        return w

svm_sgd_plot(X, Y)