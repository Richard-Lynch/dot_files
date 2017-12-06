#!/Users/richie/miniconda3/bin/python3

# Define your model in this cell.
# See the paper 'End to End Learning for Self-Driving Cars' (Bojarski et al) for some ideas.

inputs = Input(shape=(66, 200, 3))

x = inputs

# Add your layers here.  Go nuts!
# (DO NOT ADD A LAMBDA LAYER to scale the input -- which you might see used in other online examples
# -- we do our scaling of input data in the data_generator, above).
x = Conv2D(
    24, 5, activation='relu', padding='valid',
    strides=2)(inputs)  # Don't flatten until after your 2D layers
x = Conv2D(
    36, 5, activation='relu', padding='valid',
    strides=2)(x)  # Don't flatten until after your 2D layers
x = Conv2D(
    48, 5, activation='relu', padding='valid',
    strides=2)(x)  # Don't flatten until after your 2D layers
x = Conv2D(
    64, 3, activation='relu',
    padding='valid')(x)  # Don't flatten until after your 2D layers
x = Conv2D(
    64, 3, activation='relu',
    padding='valid')(x)  # Don't flatten until after your 2D layers
# # x = MaxPool2D(2)(x)
# x = Conv2D(64, 5, activation='relu', padding='valid', strides=3)(x)  # Don't flatten until after your 2D layers
# x = Conv2D(64, 5, activation='relu', padding='valid', strides=2)(x)  # Don't flatten until after your 2D layers
# # x = MaxPool2D(2)(x)
# x = Conv2D(128, 5, activation='relu', padding='valid', strides=2)(x)  # Don't flatten until after your 2D layers
# x = Conv2D(128, 5, activation='relu', padding='valid', strides=2)(x)  # Don't flatten until after your 2D layers

# x = Conv2D(256, 3, activation='relu', padding='valid', strides=2)(x)  # Don't flatten until after your 2D layers
# x = Conv2D(256, 3, activation='relu', padding='valid', strides=2)(x)  # Don't flatten until after your 2D layers

x = Flatten()(x)
# x = Dense(1180, activation='relu')(x)  # You could have a few more non-2D layers here
# You could have a few more non-2D layers here
x = Dense(100, activation='relu')(x)
# You could have a few more non-2D layers here
x = Dense(50, activation='relu')(x)
# You could have a few more non-2D layers here
x = Dense(10, activation='relu')(x)

# Your output is a single float: the desired steering angle.
output = Dense(1)(x)

model = keras.models.Model(inputs=inputs, outputs=output)
model.summary()
model.compile(optimizer='adam', loss='mse')
