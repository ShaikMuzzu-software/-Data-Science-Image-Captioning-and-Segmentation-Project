# Image Captioning + Segmentation (Streamlit App + Training Scaffolding)

An end‑to‑end project that **generates captions** for images and **segments objects** in the same UI.
- Captioning uses a **pretrained BLIP** model (via 🤗 `transformers`) for instant results.
- Segmentation uses **Mask R‑CNN (ResNet‑50 FPN)** from `torchvision` (pretrained on COCO).
- Includes a **Streamlit app**, modular `src/` code, and **training scaffolding** to extend later.

> You can demo everything without training by using the pretrained models included via libraries.

---

## Quickstart (Windows/Mac/Linux)

### 0) Create & activate a Python environment (recommended)
Using Conda:
```bash
conda create -n imgcap python=3.10 -y
conda activate imgcap
```

### 1) Install dependencies
```bash
pip install -r requirements.txt
```

> If you have an NVIDIA GPU and want acceleration, install PyTorch with CUDA from https://pytorch.org/get-started/locally/ first, then run `pip install -r requirements.txt` for the rest.

### 2) Run the Streamlit app
```bash
streamlit run app/streamlit_app.py
```
Then open the local URL shown (usually http://localhost:8501).

### 3) Try it out
- Upload any JPG/PNG image.
- Click **Generate Caption** to get a BLIP caption.
- Click **Run Segmentation** to see instance masks and detected classes.
- Use the **Confidence** slider to filter detections.

> If the first run is slow, it’s downloading the models. Subsequent runs are much faster.

---

## Project Structure

```
image_caption_seg_project/
├── app/
│   ├── streamlit_app.py          # Main UI
│   └── demo_images/              # (Optional) place a few images here for quick tests
├── src/
│   ├── captioning.py             # BLIP captioning module
│   ├── segmentation.py           # Mask R-CNN inference module
│   └── utils.py                  # Helpers (image I/O, plotting)
├── training/
│   ├── caption_train.py          # (Scaffold) Caption training on COCO (advanced)
│   └── segmentation_finetune.py  # (Scaffold) Finetune Mask R-CNN on VOC/COCO
├── notebooks/
│   └── exploration.ipynb         # (Empty) Put your EDA or experiments here
├── data/                         # Put datasets here if training locally
├── requirements.txt
└── README.md
```

---

## Optional: Datasets for Training

You **do not** need datasets to demo the app with pretrained models. If you want to train:

- **COCO 2017 (captions + instances)**  
  - Train images: http://images.cocodataset.org/zips/train2017.zip  
  - Val images: http://images.cocodataset.org/zips/val2017.zip  
  - Annotations: http://images.cocodataset.org/annotations/annotations_trainval2017.zip

- **Pascal VOC 2012 (segmentation)**  
  - Train/Val: http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar

Extract them under `data/` following typical layouts (COCO: `data/coco/...`, VOC: `data/voc/VOCdevkit/VOC2012/...`).

---

## Notes
- First use will download BLIP and Mask R-CNN weights automatically.
- For CPU‑only systems, it works out of the box (slower). For GPU, ensure the right CUDA PyTorch build.
- The training scripts are **scaffolds** intended for customization; they sketch the loops and dataset usage.
