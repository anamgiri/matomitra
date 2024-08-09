from flask import Flask,request, url_for, redirect, render_template
import pickle
import numpy as np

app = Flask(__name__)

model=pickle.load(open('stored_model.pkl','rb'))


@app.route('/')
def hello_world():
    return render_template(".html")


@app.route('/predict',methods=['POST','GET'])
def predict():
    int_features=[int(x) for x in request.form.values()]
    final=[np.array(int_features)]
    print(int_features)
    print(final)
    prediction=model.predict(final)
    output= print("The predicted crop is", prediction)

if __name__ == '__main__':
    app.run(debug=True)