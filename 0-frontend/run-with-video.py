# import the necessary packages
from tensorflow.keras.applications.mobilenet_v2 import preprocess_input
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.models import load_model
from imutils.video import VideoStream
import numpy as np
import imutils
import cv2
import os
from playsound import playsound
import threading
from datetime import datetime
import mysql.connector
from time import gmtime, strftime
from ftplib import FTP



#DB Config
host = "localhost"
username = "root"
password =  ""
database_name = "facemask"


mydb = mysql.connector.connect(

  host="{}".format(host),
  user="{}".format(username),
  passwd="{}".format(password),
  database="{}".format(database_name)

)


#FTP Config

ftp_host = ""
ftp_username = ""
ftp_password = ""


with open("ftp-credentials.txt") as file:
	for line in file:
		if line.strip().split("=")[0] == "host":
			ftp_host = line.strip().split("=")[1]

		elif line.strip().split("=")[0] == "username":
			ftp_username = line.strip().split("=")[1]

		elif line.strip().split("=")[0] == "password":
			ftp_password = line.strip().split("=")[1]

ftp = FTP(ftp_host)
ftp.login(user=ftp_username,passwd=ftp_password)


def greeting_function():
    currentHour = int(datetime.today().strftime('%H'))
    basicGreeting = ""

    if currentHour >= 0 and currentHour < 12:
        basicGreeting = "morning"

    if currentHour >= 12 and currentHour < 18:
        basicGreeting = "afternoon"

    if currentHour >= 18 and currentHour != 0:
        basicGreeting = "evening"

    return basicGreeting

    
def get_Center(x, y, w, h): 
    x1 = int(w / 2)
    y1 = int(h / 2)
    cx = x + x1
    cy = y + y1
    return cx, cy


ROI = 300
offset = 8


global_current_date = datetime.today().strftime('%Y-%m-%d')


lang = ""

SelectDataCursor = mydb.cursor()
SelectDataCursor.execute("SELECT lang FROM language")
collecttedData = SelectDataCursor.fetchall()

for data in collecttedData:
	lang = data[0]


without_mask_sound = ""

if lang == "tamil":
	without_mask_sound = "sound-effect\\without_mask\\tamil.mp3"

elif lang == "sinhala":
	without_mask_sound = "sound-effect\\without_mask\\sinhala.mp3"

elif lang == "english":
	without_mask_sound = "sound-effect\\without_mask\\english.mp3"


is_sound_playing = False

def soundPlay(sound_path):
	
	global is_sound_playing

	is_sound_playing = True
	playsound(sound_path)
	is_sound_playing = False
	

def without_mask_detected(frame):

	global is_sound_playing, without_mask_sound

	cv2.imwrite("cache-img.jpg",frame)
	
	current_time = datetime.today().strftime('%I:%M:%S %p')

	file_name = "{}_{}.jpg".format(global_current_date,current_time.replace(":","-"))

	ftp.storbinary('STOR '+"{}".format(file_name), open("cache-img.jpg", 'rb'))

	sqlCode = "INSERT INTO data (auto_id, _date, _time, image_path) VALUES (%s, %s, %s, %s)"
	values = ("", global_current_date,current_time,file_name)
	insertCursor = mydb.cursor()
	insertCursor.execute(sqlCode,values)
	mydb.commit()
	

	if is_sound_playing == False:
		soundPlay(without_mask_sound)




def with_mask_detected():

	global is_sound_playing

	if is_sound_playing == False:
		
		greeting = greeting_function()

		if greeting == "morning":

			if lang == "tamil":
				soundPlay("sound-effect\\with_mask\\tamil_morning.mp3")

			elif lang == "sinhala":
				soundPlay("sound-effect\\with_mask\\sinhala_morning.mp3")

			elif lang == "english":
				soundPlay("sound-effect\\with_mask\\english_morning.mp3")

		elif greeting == "afternoon":

			if lang == "tamil":
				soundPlay("sound-effect\\with_mask\\tamil_afternoon.mp3")

			elif lang == "sinhala":
				soundPlay("sound-effect\\with_mask\\sinhala_afternoon.mp3")

			elif lang == "english":
				soundPlay("sound-effect\\with_mask\\english_afternoon.mp3")

		elif greeting == "evening":

			if lang == "tamil":
				soundPlay("sound-effect\\with_mask\\tamil_evening.mp3")

			elif lang == "sinhala":
				soundPlay("sound-effect\\with_mask\\sinhala_evening.mp3")

			elif lang == "english":
				soundPlay("sound-effect\\with_mask\\english_evening.mp3")


def detect_and_predict_mask(frame, faceNet, maskNet):
	# grab the dimensions of the frame and then construct a blob
	# from it
	(h, w) = frame.shape[:2]
	blob = cv2.dnn.blobFromImage(frame, 1.0, (224, 224),
		(104.0, 177.0, 123.0))

	# pass the blob through the network and obtain the face detections
	faceNet.setInput(blob)
	detections = faceNet.forward()
	#print(detections.shape)

	# initialize our list of faces, their corresponding locations,
	# and the list of predictions from our face mask network
	faces = []
	locs = []
	preds = []

	# loop over the detections
	for i in range(0, detections.shape[2]):
		# extract the confidence (i.e., probability) associated with
		# the detection
		confidence = detections[0, 0, i, 2]

		# filter out weak detections by ensuring the confidence is
		# greater than the minimum confidence for face detections
		if confidence > 0.3:
			# compute the (x, y)-coordinates of the bounding box for
			# the object
			box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
			(startX, startY, endX, endY) = box.astype("int")

			# ensure the bounding boxes fall within the dimensions of
			# the frame
			(startX, startY) = (max(0, startX), max(0, startY))
			(endX, endY) = (min(w - 1, endX), min(h - 1, endY))

			# extract the face ROI, convert it from BGR to RGB channel
			# ordering, resize it to 224x224, and preprocess it
			face = frame[startY:endY, startX:endX]
			face = cv2.cvtColor(face, cv2.COLOR_BGR2RGB)
			face = cv2.resize(face, (224, 224))
			face = img_to_array(face)
			face = preprocess_input(face)

			# add the face and bounding boxes to their respective
			# lists
			faces.append(face)
			locs.append((startX, startY, endX, endY))

	# only make a predictions if at least one face was detected
	if len(faces) > 0:
		# for faster inference we'll make batch predictions on *all*
		# faces at the same time rather than one-by-one predictions
		# in the above `for` loop
		faces = np.array(faces, dtype="float32")
		preds = maskNet.predict(faces, batch_size=32)

	# return a 2-tuple of the face locations and their corresponding
	# locations
	return (locs, preds)

# load our serialized face detector model from disk
prototxtPath = r"face-detector\deploy.prototxt"
weightsPath = r"face-detector\res10_300x300_ssd_iter_140000.caffemodel"
faceNet = cv2.dnn.readNet(prototxtPath, weightsPath)

# load the face mask detector model from disk
maskNet = load_model("mask-detector.model")

# initialize the video stream
print("[INFO] starting video stream...")
#vs = VideoStream(src=0).start()
vs = cv2.VideoCapture("video-1.mp4")
width_and_hieght = 850

# loop over the frames from the video stream
while True:
	# grab the frame from the threaded video stream and resize it
	# to have a maximum width of 400 pixels
	ret,frame = vs.read()
	frame = imutils.resize(frame, width = width_and_hieght)

	copyFrame = frame.copy()

	cv2.line(frame, (0 , ROI), (1200 , ROI), (0,255,255), 4)  # Line

	# detect faces in the frame and determine if they are wearing a
	# face mask or not
	(locs, preds) = detect_and_predict_mask(frame, faceNet, maskNet)

	# loop over the detected face locations and their corresponding
	# locations
	for (box, pred) in zip(locs, preds):
		# unpack the bounding box and predictions
		
		(xmin, ymin, xmax, ymax) = box
		(mask, withoutMask) = pred


		# determine the class label and color we'll use to draw
		# the bounding box and text

		if mask > withoutMask:
			label = "Mask"
			color = (0, 255, 0)
		else:
			label = "No Mask"
			color = (0, 0, 255)



		#label = "Mask" if mask > withoutMask else "No Mask"		
		#color = (0, 255, 0) if label == "Mask" else (0, 0, 255)

		# include the probability in the label
		#label = "{}: {:.2f}%".format(label, max(mask, withoutMask) * 100)

		# display the label and bounding box rectangle on the output
		# frame
		
		cv2.putText(frame, label, (xmin, ymin - 10),
			cv2.FONT_HERSHEY_SIMPLEX, 2, color, 2)

		cv2.rectangle(frame, (xmin, ymin), (xmax, ymax), color, 2)

		x = xmin
		y = ymin
		w = xmax - xmin
		h = ymax - ymin

		mid_point = get_Center(int(x), int(y), int(w),int(h))
		cv2.circle(frame, (mid_point[0], mid_point[1]), 6, color, -1)

		if mid_point[1] < (ROI + offset) and mid_point[1] > (ROI - offset):

			if label == "Mask":
				cv2.line(frame, (0 , ROI), (1200 , ROI), (0, 255, 0), 4)
				withMask_threading = threading.Thread(target = with_mask_detected)
				withMask_threading.start()
			
			elif label == "No Mask":
				cv2.line(frame, (0 , ROI), (1200 , ROI), (0, 0, 255), 4)
				withoutMask_threading = threading.Thread(target = without_mask_detected, args=(copyFrame,))
				withoutMask_threading.start()

	# show the output frame
	cv2.imshow("Frame", frame)
	key = cv2.waitKey(1) & 0xFF

	# if the `q` key was pressed, break from the loop
	if key == ord("q"):
		break

# do a bit of cleanup
cv2.destroyAllWindows()
vs.stop()
ftp.quit()