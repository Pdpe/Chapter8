from flask import Flask, render_template
import urllib2
import json

app = Flask(__name__)


@app.route('/')
def index():

    response  = urllib2.urlopen('http://api.fixer.io/latest?base=USD')
    data  = json.load(response)


    timestamp          = data["date"]
    fx_markets_records = []

    for key, value in data["rates"].items():
            record_tuple = (timestamp, key, value)
            fx_markets_records.append(record_tuple)

    return render_template('index.html', records=fx_markets_records)

if __name__ == '__main__':
    # Starts the Flask application server
    app.run(debug=False)
