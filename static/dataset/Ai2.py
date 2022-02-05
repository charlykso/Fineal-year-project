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
class textAnalyzer:
    def analysis( mytext):
        df = pd.read_csv(
            'C:/Users/Ikenna Remigius/Documents/releases/Demo/static/dataset/DatasetforDetectionofCyber-Trolls.csv')
        # iris = load_iris()
        # print(df.shape)
        # print(df.head())


        # examine the class distribution
        # sms.label.value_counts()


        # print(df[['annotation/label/0']].count())

        # convert label to a numerical variable
        # mapping_dic


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
        analyse = metrics.accuracy_score(y_test, y_pred_class)
        sentiment = np.array([mytext])
        sentiment_vector = vect.transform(sentiment)
        outcome = nb.predict(sentiment_vector)
        # print(nb.predict(sentiment_vector))
        # if outcome == 1:
        #     print("Please watch your statement")
        # else:
        #     print("no sentiment detected")
        return(outcome)

        
mytext = "Good morning Ma"
# analysis(mytext)       
textAnalyzer.analysis(mytext)
