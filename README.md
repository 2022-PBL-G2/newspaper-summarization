# 大学院PBL - 新聞記事の要約アプリ

# DEMO



https://user-images.githubusercontent.com/83323040/225931950-4dc57d73-666e-4135-bd30-273b6b2889b8.mp4



# Features

新聞記事をTwitterなどのSNSに掲載する際に文字数の制限に引っかかる場合がある。そこで、新聞記事を指定文字数で要約するアプリにより課題の解決を行う。

# Requirement

* Anaconda 4.10.1
* Python 3.6.13
* Pytorch 1.10.2

# Installation

* [以下のページ](https://nlp.ist.i.kyoto-u.ac.jp/?BART%E6%97%A5%E6%9C%AC%E8%AA%9EPretrained%E3%83%A2%E3%83%87%E3%83%AB)に従い、京大BARTをインストール。得られたモデルをbart-base-japanese/japanese_bart_base_2.0/に配置
* notebooks/make_dataset.ipynbと前処理を行ったファイル（honbun.csv, youyaku.csv, midasi.csv）をcolab上に配置し、見出しと要約の両方で学習検証データに分割。
* train.src, train.tgt, valid.src, valid.tgtをdata/raw/に配置する。

# Usage

* script/preprocess.sh⇒script/train.shにより学習を行う。
* 見出しならベストモデルをcheckpoint_best_h.ptとして、modelsの中に配置。要約も同様にcheckpoint_best_s.ptを配置。
* flask/app.pyを実行

※学習時のGPUにはTESLA V100を用いている。
