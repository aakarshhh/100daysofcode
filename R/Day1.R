library(keras)
library(readxl)
install_keras()
mnist <-dataset_mnist()

x_train <- mnist$train$x
y_train <- mnist$train$y
x_test <- mnist$test$x
y_test <- mnist$test$y

# reshape
dim(x_train) <- c(nrow(x_train), 784)
dim(x_test) <- c(nrow(x_test), 784)
# rescale
x_train <- x_train / 255
x_test <- x_test / 255

y_train <- to_categorical(y_train, 10)
y_test <- to_categorical(y_test, 10)

# model generation
nn<- keras_model_sequential()%>%
  layer_dense(units = 256,activation = "relu",input_shape = 28*28)%>%
  layer_dropout(rate = 0.6) %>% 
  layer_dense(units = 128, activation = "relu") %>%
  layer_dropout(rate = 0.4) %>%
  layer_dense(units = 10,activation = "softmax")

summary(nn)

model %>% compile(
  loss = "categorical_crossentropy",
  optimizer = optimizer_rmsprop(),
  metrics = c("accuracy")
)
train01<-model %>% fit(
  x_train, y_train, 
  epochs = 7, batch_size = 64, 
  validation_split = 0.25
)

plot(train01)

model %>% evaluate(x_test, y_test)

