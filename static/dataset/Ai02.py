import pandas as pd
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from nltk.corpus import stopwords
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import MultinomialNB
from sklearn.metrics import recall_score, precision_score, f1_score
from sklearn import metrics
# def analysis(request):
# reading the dataset with pandas
df = pd.read_csv(
    'C:/Users/Ikenna Remigius/Documents/releases/Demo/static/dataset/DatasetforDetectionofCyber-Trolls.csv')

#
stopset = set(stopwords.words('english'))
# vectorizer = CountVectorizer( max_features=15000, min_df=2, max_df=0.7, stop_words=stopset)
vectorizer = CountVectorizer(max_features=15000, min_df=2, max_df=0.7, stop_words=stopset)

x = df.content
y = df[['annotation/label/0']]
# print(x)

# splitting into train and test
X_train, X_test, Y_train, Y_test = train_test_split( x, y, test_size=0.2, random_state=0)

vect = vectorizer.fit(X_train)

X_train_dtm = vect.transform(X_train)
X_train_dtm = vect.fit_transform(X_train)
X_train_dtm
X_test_dtm = vect.transform(X_test)
X_test_dtm
# initialising the naive bayes classifier
classifier = MultinomialNB()
# training the classifier
classifier.fit(X_train, Y_train.values.ravel())
y_pred_class = classifier.predict(X_test_dtm)
print(metrics.accuracy_score(Y_test, y_pred_class))

# making predictions
# turning the sentence into an array
# message = MessageModel(request.POST or None)
# message = MessageModelSerializer(request.POST or None)
# text_message = message.msg
print("how are you doing")
sentiment = np.array(["am very dissapointed with the outcome"])
sentiment_vector = vectorizer.transform(sentiment)
# context = {'Hello': "Hello"}
print(classifier.predict(sentiment_vector))