# Useful tips for preparing DJ set

## Normalization

- mp3: `ffmpeg-normalize o1.mp3 --normalization-type ebu --target-level -10 --loudness-range-target 10 -c:a libmp3lame -b:a 320k -o n1.mp3`
- wav: `ffmpeg-normalize 2020-01-11.wav -c:a pcm_s24le -ar 44100 -o 2020-01-11_n.wav`

- https://github.com/slhck/ffmpeg-normalize
- https://auphonic.com/blog/2012/08/02/loudness-measurement-and-normalization-ebu-r128-calm-act/
- https://amvidia.com/guides/audio-conversion/peak-and-loudness-ebu-r128-normalization

## Convertation

- `flac` to `mp3`: `ffmpeg -i "input.flac" -ar 44100 -ab 320k -map_metadata 0 -id3v2_version 3 "output.mp3"`
- `wav` to `mp3`: `ffmpeg -i "input.wav" -ar 44100 -b:a 320k "input.mp3"`
