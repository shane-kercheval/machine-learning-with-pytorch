FROM python:3.11

WORKDIR /code
ENV PYTHONPATH "${PYTHONPATH}:/code"

ENV PYDEVD_WARN_EVALUATION_TIMEOUT 1000

RUN apt-get update -y && apt-get install zsh -y
RUN PATH="$PATH:/usr/bin/zsh"

RUN apt-get install lsof

RUN python -m pip install --upgrade pip
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN rm requirements.txt

# This installs pytorch for linux/cuda11.8
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
# This installs pytorch for mac
# pip3 install torch torchvision torchaudio
