#!/bin/bash

# Script untuk mengunduh data spreadsheet, mengubahnya menjadi csv, lalu mengambil sampel

## Requirements
### Mohon pastikan program berikut telah terpasang di komputer anda sebelum menjalankan script ini:
### 1. [curl](https://curl.se)
### 2. [csvkit](https://csvkit.rtfd.org)
### 3. [sample-stream](https://github.com/jeroenjanssens/sample)

## Penjelasan script
### Unduh data dari tautan http dan menyimpannya ke berkas bernama weather_data.xlsx
curl -o weather_data.xlsx -L https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

### Ubah masing-masing sheet menjadi:
#### 1. weather_2014 -> weather_2014.csv
in2csv weather_data.xlsx --sheet weather_2014 > weather_2014.csv
#### 2. weather_2015 -> weather_2015.csv
in2csv weather_data.xlsx --sheet weather_2015 > weather_2015.csv

### Gabungkan data weather_2014 dan weather_2015 menjadi weather.csv
csvstack weather_2014.csv weather_2015.csv > weather.csv

### Hapus berkas weather_data.xlsx
rm weather_data.xlsx

### Lakukan sampling weather.csv dengan rate 0.3 dan simpan hasilnya ke sample_weather.csv
cat weather.csv | sample -r 0.3 > sample_weather.csv
