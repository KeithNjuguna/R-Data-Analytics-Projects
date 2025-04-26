from flask import Flask, request, jsonify, render_template
import joblib
import pandas as pd
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Load your model
model = joblib.load("model/loan_default_model.pkl")

# Mappings from text to integers
sex_mapping = {"male": 1, "female": 0}
housing_mapping = {"own": 0, "free": 2, "rent": 1}
saving_mapping = {"unknown": 4, "little": 0, "quite rich": 2, "rich": 3, "moderate": 1}
checking_mapping = {"little": 0, "moderate": 1, "unknown": 3, "rich": 2}

# Expected feature order (without 'Duration')
expected_features = [
    "Sex",
    "Housing",
    "Saving accounts",
    "Checking account",
    "Credit amount"
]

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/predict", methods=["POST"])
def predict():
    data = request.get_json()

    # Apply mappings
    try:
        transformed_data = {
            "Sex": sex_mapping.get(data.get("Sex", "").lower(), 0),
            "Housing": housing_mapping.get(data.get("Housing", "").lower(), 1),
            "Saving accounts": saving_mapping.get(data.get("Saving accounts", "").lower(), 4),
            "Checking account": checking_mapping.get(data.get("Checking account", "").lower(), 3),
            "Credit amount": float(data.get("Credit amount", 0))
        }
    except Exception as e:
        return jsonify({"error": f"Invalid input format. {str(e)}"}), 400

    # Create a DataFrame in the correct column order
    df = pd.DataFrame([transformed_data], columns=expected_features)

    # Make predictions
    prediction = model.predict(df)
    probability = model.predict_proba(df)

    return jsonify({
        "default_prediction": int(prediction[0]),
        "default_probability": float(probability[0][1])
    })

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
