from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello, Docker + GitHub Actions CI/CD!"

@app.route("/health")
def health():
    return {"status": "ok"}

if __name__ == "__main__":
    # Run on port 5000, matching Dockerfile eg EXPOSE
    app.run(host="0.0.0.0", port=5000)
