FROM python:3.10-slim-buster

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get -qq update && apt-get -qq install -y git wget pv jq python3-dev mediainfo gcc aria2 libsm6 libxext6 libfontconfig1 libxrender1 libgl1-mesa-glx

COPY --from=mwader/static-ffmpeg:6.0 /ffmpeg /bin/ffmpeg
COPY --from=mwader/static-ffmpeg:6.0 /ffprobe /bin/ffprobe

COPY . .

CMD gunicorn app:app & python3 bot.py
CMD RUN pip3 install --no-cache-dir -r requirements.txt
