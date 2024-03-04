#!/bin/sh

set -x

rm trails.mp4 paths.mp4 combine.mp4
ffmpeg -pattern_type glob -i 'img/path*.png' -c:v libx264 -pix_fmt yuv420p paths.mp4
ffmpeg -pattern_type glob -i 'img/trail*.png' -c:v libx264 -pix_fmt yuv420p trails.mp4
ffmpeg -i paths.mp4 -i trails.mp4 -filter_complex "hstack,format=yuv420p" -c:v libx264 -crf 18 combine.mp4
