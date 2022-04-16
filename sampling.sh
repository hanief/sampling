#!/bin/bash

# Download data
curl https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

# Konversi setiap sheet menjadi
# 1. weather_2014 -> weather_2014.csv
# 2. weather_2015 -> weather_2015.csv

# Gabungkan data weather 2014 dan 2015 menjadi weather.csv

# Hapus weather_data.xlsx

# Lakukan sampling weather.csv dengan rate 0.3 dan simpan ke sample_weather.csv

