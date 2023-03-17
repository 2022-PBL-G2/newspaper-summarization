export CUDA_VISIBLE_DEVICES="0,1"

DATASET_DIR="./data_s/interim/"
FINETUNED_MODEL="./models_s/checkpoint_best.pt"
RESULT="./data_s/result"

fairseq-generate $DATASET_DIR --path $FINETUNED_MODEL --task translation_from_pretrained_bart --beam 5 --skip-invalid-size-inputs-valid-test \
--dataset-impl raw --gen-subset test -s src --max-sentences 64 --prepend-bos > $RESULT
cat $RESULT | grep -P "^H" | cut -f 3- | sed 's/<<unk>>/<unk>/g' | sed 's/▁//g' > ${RESULT}.pred
cat $RESULT | grep -P "^S" | cut -f 2- | sed 's/<<unk>>/<unk>/g' | sed 's/▁//g' > ${RESULT}.src
cat $RESULT | grep -P "^T" | cut -f 2- | sed 's/<<unk>>/<unk>/g' | sed 's/▁//g' > ${RESULT}.tgt
