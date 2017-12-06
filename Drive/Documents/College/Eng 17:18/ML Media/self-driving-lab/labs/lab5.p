# The model below contains 2 hidden layers with 64 nodes each. 
# The activation functions for these 2 layers is the ReLU
# The network ends with a 10 nodes layer with softmax activation
# The first 2 hidden layers transform the original features into 
# a new feature vector of size 64.
# The last layer essentially does the classification using multonomial regression
# based on these new features. 

inputs = keras.layers.Input(shape=(32, 32, 3))

# Replace these two lines with some convolutional layers;
# see keras docs for Conv2D, MaxPool2D, etc.
# Maybe stick in some Dropout as well?
x = Conv2D(32, 2, activation='relu', padding='same')(inputs)  # Don't flatten until after your 2D layers 
x = Conv2D(32, 2, activation='relu', padding='same')(x)  # Don't flatten until after your 2D layers 
x = MaxPool2D(2)(x)
x = Conv2D(64, 2, activation='relu', padding='same')(x)  # Don't flatten until after your 2D layers 
x = Conv2D(64, 2, activation='relu', padding='same')(x)  # Don't flatten until after your 2D layers 
x = MaxPool2D(2)(x)
# x = Dense(30, activation='relu')(x)

# The last layers of your model should look something like
# this to be well-structured for the final classification:
x = Flatten()(x)
x = Dense(75, activation='relu')(x)  # You could have a few more non-2D layers here
x = Dense(75, activation='relu')(x)  # You could have a few more non-2D layers here

predictions = Dense(10, activation='softmax')(x)  # There are 10 classes in this problem, hence the '10'.

# Create the model.
model = keras.models.Model(inputs=inputs, outputs=predictions)
opt = keras.optimizers.SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True)

# Setup the optimisation strategy.
model.compile(optimizer=opt,
              loss='categorical_crossentropy',
              metrics=['accuracy'])

# Display a summary.
model.summary()

# Keep things sane.
if (model.count_params() > 10000000):    
    raise("Your model is unecessarily complex, scale down!")


# we create a callback function to plot our loss function and accuracy
pltCallBack = PlotLossAccuracy()
num_epochs = 200
batch_size = 4096

# and train
model.fit(X_train, Y_train,
          batch_size=batch_size, epochs=num_epochs, 
          validation_data=(X_validation, Y_validation), 
          callbacks=[pltCallBack])
