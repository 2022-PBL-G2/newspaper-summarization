# 前処理
TRAIN_SRC="./data_s/raw/train.src"
TRAIN_TGT="./data_s/raw/train.tgt"
VALID_SRC="./data_s/raw/valid.src"
VALID_TGT="./data_s/raw/valid.tgt"
TEST_SRC="./data_s/raw/test.src"
TEST_TGT="./data_s/raw/test.tgt"
DICT="./bart-base-japanese/japanese_bart_base_2.0/dict.txt"
DATASET_DIR="./data_s/interim/"
SENTENCEPIECE_MODEL="./bart-base-japanese/japanese_bart_base_2.0/sp.model"

cat $TRAIN_SRC | python3 ./fairseq/jaBART_preprocess.py --bpe_model $SENTENCEPIECE_MODEL --bpe_dict $DICT > $DATASET_DIR/train.src-tgt.src
cat $TRAIN_TGT | python3 ./fairseq/jaBART_preprocess.py --bpe_model $SENTENCEPIECE_MODEL --bpe_dict $DICT > $DATASET_DIR/train.src-tgt.tgt
cat $VALID_SRC | python3 ./fairseq/jaBART_preprocess.py --bpe_model $SENTENCEPIECE_MODEL --bpe_dict $DICT > $DATASET_DIR/valid.src-tgt.src
cat $VALID_TGT | python3 ./fairseq/jaBART_preprocess.py --bpe_model $SENTENCEPIECE_MODEL --bpe_dict $DICT > $DATASET_DIR/valid.src-tgt.tgt
cat $TEST_SRC | python3 ./fairseq/jaBART_preprocess.py --bpe_model $SENTENCEPIECE_MODEL --bpe_dict $DICT > $DATASET_DIR/test.src-tgt.src
cat $TEST_TGT | python3 ./fairseq/jaBART_preprocess.py --bpe_model $SENTENCEPIECE_MODEL --bpe_dict $DICT > $DATASET_DIR/test.src-tgt.tgt
cp $DICT $DATASET_DIR/dict.src.txt
cp $DICT $DATASET_DIR/dict.tgt.txt
