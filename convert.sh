#!/bin/sh
# set -e # Exit on first error

if [ -n "$1" ]; then
  cd "$( cd "$(dirname "$0")" ; pwd -P )/$1";

  echo "Conveting WAV to MP3"
  for i in *.wav; do
    ffmpeg -i "$i" -ar 44100 -b:a 320k "${i%.*}.mp3"
  done

  echo "Conveting FLAC to MP3"
  for i in *.flac; do
    ffmpeg -i "$i" -ar 44100 -ab 320k -map_metadata 0 -id3v2_version 3 "${i%.*}.mp3"
  done

  echo "Normalizing"
  mkdir normalized
  for i in *.mp3; do
    ffmpeg-normalize "$i" --normalization-type ebu --target-level -10 --loudness-range-target 10 -c:a libmp3lame -b:a 320k -o "normalized/${i%.*}.mp3"
  done

  echo "Removing old .WAV videos"
  rm *.wav

  echo "Removing old .FLAC videos"
  rm *.flac

  echo "Done"
else
  echo "Pass the path to the audio directory"
fi
