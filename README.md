# COVID-19 FACE MASK DETECTOR

## Introduction


The covid-19-face-mask-detector is computer vision based system that allows only people who wear a face mask. The primary scope of this project is to restrict people from wearing face masks.  


This prototype has two main sections: the "Management System," which is considered as the backend Panel, and the "Monitoring System," which is regarded as the frontend.

The backend panel (Management Panel) is written in the Laravel framework; the management panel is used to customize the settings, such as languages, and is also useful for monitoring and data storage.

The frontend (Monitoring System) is written in Python; We use computer vision and deep neural networks to achieve it.

The function of the management panel (backend) is to customize system behaviors and store captured data in it; however, the function of the monitoring system (frontend) is to perform the actual face mask detection, turn on the alarm, give voice output warning message in Tamil, Sinhala, and English.   


The backend (Management Panel) is a web-based system that keeps records of people who violate the rule by not wearing a mask. It takes snapshots and stores them in the database. Then,  the admin can view those stuff from the backend (Management Panel).

This project has used many programming languages and frameworks such as Laravel, Python, PHP, HTML, JavaScript, Tensorflow, Keras, OpenCV etc as a database, we are using MySQL.

The FTP server is used to transfer taken photos to the backend (Management Panel). So, It is better to have an FTP Server running on the deployed device.


**Project Introduction Video:** https://web.facebook.com/gunarakulangunaretnam/videos/3699395566811987

### Architecture Diagram
![](github-readme-contents/main-diagram.png)



## Technology Stack

- **Python** - for monitoring system
- **Laravel** - for backend Panel
- **Tensorflow** - for model training
- **Keras** - for model fine tune and easy model training.
- **OpenCV** - for computer vision
- **Sklearn** - for image preprocessing.


## Setup


### Setup Management System (Backend)


**Step 01**:

- Create an empty database called "facemask"

![IMAGE](github-readme-contents/create-db.jpg)

**Step 02**:

- Import the database from the following directory.

```
covid-19-face-mask-detector\1-backend\0-database\facemask.sql
```

![IMAGE](github-readme-contents/import-db.jpg)


**Step 03**:

- Deploy the backend panel (Management System).

```
covid-19-face-mask-detector\1-backend
```

#### Setup FTP

**Note** We are using FTP to transfer captured photos from frontend to backend (Management Panel).

**Credentials**

- **Host:** localhost
- **Username:** fmd_user
- **Password** fmd123

**To change FTP Credentials**

- Open the "ftp-credentials.txt file" this is found on the following directory (inside the 0-frontend directory) and edit it.

```
covid-19-face-mask-detector\0-frontend\ftp-credentials.txt file
```

**Note** Don't remove the '=' in the middle.


![IMAGE](github-readme-contents/ftp.jpg)


#### Steps to implement a FTP server.

- Point to the image_data folder that is found in the public directory of backend (Management Panel).

**Note:** Point the FTP to the following directory

```
1-facemask-backend-laravel\public\image_data
```

### Setup Monitoring System (Frontend)

* Copy the "0-frontend" folder to the deployed directory.

#### Install Dependencies


```
pip install tensorflow
```

```
pip install opencv-python
```

```
pip install playsound
```

```
pip install imutils
```

```
pip install mysql-connector-python
```

```
pip install keras
```

## Execute the Project

**Run with webcam**

```

python run-with-webcam.py

```


**Run with pre-recorded video**

* Give the video path programmatically by editing the "run-with-video.py".


```

python run-with-video.py

```


**Testing the model**

```

python run-testing.py

```

## Monitoring System Demonstration 

![IMAGE](github-readme-contents/demo-1.gif)

![IMAGE](github-readme-contents/demo-2.gif)

## Management System Demonstration 

### Login Page

![IMAGE](github-readme-contents/login-page.jpg)

- Username: admin
- Password: admin

### Dashboard Home Page

![IMAGE](github-readme-contents/dashboard.jpg)

**Note:** The home page stores all of the people' snapshots who did not wear a face mask, the system can delete snapshots via clicking the "Delete" red color button.

### Settings Page

**Note:** The "Settings" page has two main features, one is the change password, the another one is to change the language of the frontend system. Example: When the frontend detects, it speaks out warning message in voice output, we can change that voice language in this setting module.   


![IMAGE](github-readme-contents/setting-1.jpg)


**Note:** The language of the voice can be changed in the setting module, Tamil, Sinhala and English languages are available.

![IMAGE](github-readme-contents/setting-2.jpg)


## How to Retrain the Model?

* Collect more images of faces with mask and without mask.
* Paste all the with mask images inside the "dataset/with-mask" directory that is found in the frontend.
* Paste all the without mask images inside the "dataset/without-mask" directory that is found in the frontend.
* If it is needed, the neural network (model) can be fine-tuned in the "train-model.py".

```
python train-model.py
```


## Errors & Solutions

### Error:

This page isn’t working localhost is currently unable to handle this request. **HTTP error 500 laravel**.

### Solution:

 - composer install 
 
   ```
    composer update
   ```
- composer update 
   ```
    composer install
   ```


Social Media Links
---

# CONTACT

### Website: 

[![Visit](https://img.shields.io/badge/Visit%3A%20www.gunarakulan.info-%23E01E5A?style=flat&logo=realm&logoColor=white)](https://www.gunarakulan.info)

### Social Media:

[![LinkedIn](https://img.shields.io/badge/-LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/gunarakulangunaretnam)
[![Facebook](https://img.shields.io/badge/-Facebook-196dcc?style=for-the-badge&logo=facebook&logoColor=white)](https://www.facebook.com/gunarakulangunaretnam)
[![WhatsApp](https://img.shields.io/badge/-WhatsApp-07a647?style=for-the-badge&logo=whatsapp&logoColor=white)](https://wa.me/94740001141?text=WhatsApp%3A%20%2B9740001141)
[![Instagram](https://img.shields.io/badge/-Instagram-bd3651?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/gunarakulangunaretnam)
[![X.COM](https://img.shields.io/badge/-X.COM-0066ff?style=for-the-badge&logo=x&logoColor=white)](https://x.com/gunarakulangr)
[![Kaggle](https://img.shields.io/badge/-Kaggle-3295bd?style=for-the-badge&logo=kaggle&logoColor=white)](https://www.kaggle.com/gunarakulangr)
[![TikTok](https://img.shields.io/badge/-TikTok-579ea3?style=for-the-badge&logo=tiktok&logoColor=white)](https://www.tiktok.com/@gunarakulangunaretnam)
[![YouTube](https://img.shields.io/badge/-YouTube-a82121?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/channel/UCjMOdgHFAjAdBKiqV8y2Tww)
