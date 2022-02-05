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

# from sklearn.datasets import load_iris
df = pd.read_csv(
    'C:/Users/Ikenna Remigius/Documents/releases/Demo/static/dataset/DatasetforDetectionofCyber-Trolls.csv')
# iris = load_iris()
# print(df.shape)
# print(df.head())


# examine the class distribution
# sms.label.value_counts()


# print(df[['annotation/label/0']].count())

# convert label to a numerical variable
# df['annotation/label/0'] = df['annotation/label/0'].map({'ham': 0, 'spam': 1})


# how to define X and y (from the df data) for use with COUNTVECTORIZER
X = df.content
y = df[['annotation/label/0']]
# print(X.shape)
# print(y.shape)

# print('X dimensionality', X.shape)
# print('y dimensionality', y.shape)

# data.head()
# print(y)

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=88)


vect = CountVectorizer()
vect.fit(X_train)
X_train_dtm = vect.transform(X_train)
X_train_dtm = vect.fit_transform(X_train)
# X_train_dtm
X_test_dtm = vect.transform(X_test)
# X_test_dtm

nb = MultinomialNB()
nb.fit(X_train_dtm, y_train.values.ravel())
y_pred_class = nb.predict(X_test_dtm)
print(metrics.accuracy_score(y_test, y_pred_class))
