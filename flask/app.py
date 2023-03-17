from flask import Flask, render_template, request
from get_summary import generate_summary, get_summary

app = Flask(__name__)


@app.route("/", methods=["GET"])
def get():
    return render_template(
        "index.html", \
        tgt1 = "", \
        tgt2 = "", \
        tgt3 = "", \
        tgt4 = "", \
        tgt5 = "", \
    )


@app.route("/", methods=["POST"])
def post():
    mode = request.form.get("mode")

    src = request.form.get("src")
    generate_summary(src, mode)
    
    length = request.form.get("len")
    if length == "oth":
        length = request.form.get("lenoth")
    summary = get_summary(length)
    return render_template(
        "index.html", \
        tgt1 = f"{summary[0]}", \
        tgt2 = f"{summary[1]}", \
        tgt3 = f"{summary[2]}", \
        tgt4 = f"{summary[3]}", \
        tgt5 = f"{summary[4]}", \
    )


if __name__ == "__main__":
    app.run(debug=True)
