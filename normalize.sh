#!/bin/sh
# set -e # Exit on first error

if [ -n "$1" ]; then
  cd "$( cd "$(dirname "$0")" ; pwd -P )/$1";

  mkdir normalized

  for i in *.wav; do
    ffmpeg-normalize "$i" -c:a pcm_s16le -ar 44100 -nt peak -t -3 -o "${i%.*}.mp3"
  done

else
  echo "Pass the path to the audio directory"
fi
