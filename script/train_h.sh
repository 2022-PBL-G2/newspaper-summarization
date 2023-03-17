export CUDA_VISIBLE_DEVICES="0"

# 訓練
DATASET_DIR="./data_h/interim/"
BART="bart_base"
PRETRAINED_MODEL="./bart-base-japanese/japanese_bart_base_2.0/bart_model.pt"
SAVE_MODEL_DIR="./models_h/"

fairseq-train $DATASET_DIR \
--arch $BART \
--restore-file $PRETRAINED_MODEL \
--save-dir $SAVE_MODEL_DIR \
--task translation_from_pretrained_bart \
--source-lang src \
--target-lang tgt \
--criterion label_smoothed_cross_entropy \
--label-smoothing 0.2 \
--dataset-impl raw \
--optimizer adam \
--adam-eps 1e-06 \
--adam-betas '{0.9, 0.98}' \
--lr-scheduler polynomial_decay \
--lr 3e-05 --min-lr -1 \
--warmup-updates 2500 \
--total-num-update 1000 \
--dropout 0.3 \
--attention-dropout 0.1 \
--weight-decay 0.0 \
--max-tokens 1024 \
--update-freq 10 \
--save-interval -1 \
--no-epoch-checkpoints \
--seed 222 \
--log-format simple \
--log-interval 2 \
--reset-optimizer \
--reset-meters \
--reset-dataloader \
--reset-lr-scheduler \
--save-interval-updates 10000 \
--ddp-backend no_c10d \
--max-epoch 10 \
--encoder-normalize-before \
--decoder-normalize-before \
--prepend-bos \
--skip-invalid-size-inputs-valid-test \
# --total-num-update 40000 \
# --save-interval-updates 5000 \
# --max-update 80000 \
