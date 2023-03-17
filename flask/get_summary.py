import subprocess
import pandas as pd


def generate_summary(src, mode=None):
    src = src.replace("\n", "")
    src = pd.DataFrame([src[:1200]])
    src.to_csv("./data/raw/test.src", index=False, header=None, encoding="utf-8-sig")
    src.to_csv("./data/raw/test.tgt", index=False, header=None, encoding="utf-8-sig")
    subprocess.run(["bash", "./flask/test_preprocess.sh"])
    if mode == "mode_s":
        subprocess.run(["bash", "./flask/test_generate_s.sh"])
    else:
        subprocess.run(["bash", "./flask/test_generate_h.sh"])  


def get_summary(length):
    summary = pd.read_csv("./data/result.pred", names=["sentence"])
    summary = summary["sentence"].str.replace(" ", "")
    summary = summary.str.replace("<unk>", "")
    summary = summary[summary.str.len() < int(length)]
    summary = summary.values.tolist()
    while len(summary) < 5:
        summary.append("")
    return summary