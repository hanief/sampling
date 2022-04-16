#!/bin/bash

# Script untuk mengunduh data spreadsheet, mengubahnya menjadi csv, dan mengambil sampel

## Prasyarat
### Mohon pastikan program-program berikut telah terpasang di komputer anda sebelum menjalankan script ini:
### 1. [curl](https://curl.se)
### 2. [csvkit](https://csvkit.rtfd.org)
### 3. [sample-stream](https://github.com/jeroenjanssens/sample)

## Penjelasan
### Mengunduh data dari alamat url dan menyimpannya ke berkas bernama weather_data.xlsx
curl -o weather_data.xlsx -L https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

### Mengubah masing-masing sheet menjadi berkas csv:
#### 1. weather_2014 -> weather_2014.csv
in2csv weather_data.xlsx --sheet weather_2014 > weather_2014.csv
#### 2. weather_2015 -> weather_2015.csv
in2csv weather_data.xlsx --sheet weather_2015 > weather_2015.csv

### Menggabungkan berkas weather_2014.csv dan weather_2015.csv menjadi weather.csv
csvstack weather_2014.csv weather_2015.csv > weather.csv

### Menghapus berkas weather_data.xlsx
rm weather_data.xlsx

### Melakukan sampling weather.csv dengan rate 0.3 kemudian menyimpan hasilnya ke sample_weather.csv
cat weather.csv | sample -r 0.3 > sample_weather.csv
