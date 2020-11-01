import cv2
import time
import math
import matplotlib.pyplot as plt
import argparse

parser = argparse.ArgumentParser(description='video path')
parser.add_argument('video_path', type=str, help='specify the video_path as <xyz>.mp4')
args = parser.parse_args()

carCascade = cv2.CascadeClassifier('myhaar.xml')
video = cv2.VideoCapture(args.video_path)

WIDTH = 1280//2
HEIGHT = 720//2
pixels_per_meter = 8.8
frames_per_second = 5

RESULT = None

distances = [ 0, 5, 10, 13]

def run_test():
	all_y = []
	
	frame_number= 0

	line_ys = [281, 281-100, 281-180, 281-235]

	time_stamps = []
	count = 0

	while True:
		rc, image = video.read()
		if type(image) == type(None):
			break
		
		image = cv2.resize(image, (WIDTH, HEIGHT))	
		gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
		cars = carCascade.detectMultiScale(gray, 1.1, 13, 18, (64,64))

		for (_x, _y, _w, _h) in cars:
			all_y.append(_y)

			image = cv2.rectangle(image, (_x,_y), (_x + _w, _y + _h), color = (255,255,0), thickness = 1)

			try:
				if _y <= line_ys[count]:
					time_stamps.append(frame_number/frames_per_second)
					count += 1

			except IndexError:
				pass

		if all_y[-1] >= line_ys[-1]:
			m = "Status: car did not cross line"
			cv2.putText(image, m, (50,250), cv2.FONT_HERSHEY_SIMPLEX , 1.0, (0,255,0), 2)
			
		else:
			m = "Status: car crossed line, test failed"
			cv2.putText(image, m, (50,250), cv2.FONT_HERSHEY_SIMPLEX , 1.0, (0,0,255), 2)

		frame_number+= 1


		image = cv2.line(image, (22,281), (1280//2-55,281), color = (255,255,0), thickness = 3)
		image = cv2.line(image, (22+50,281-100), (1280//2-65 - 50,281-100), color = (0,255,0), thickness = 3)
		image = cv2.line(image, (22 + 100,281-180), (1280//2-55 - 110,281-180), color = (0,255,255), thickness = 3)
		image = cv2.line(image, (22 + 120,281-220), (1280//2-55 - 130 ,281-220), color = (0,0,255), thickness = 3)
		# image = cv2.line(image, (22 + 130 ,281-245), (1280//2-55 - 140,281-245), color = (0,255,0), thickness = 3)
		# image = cv2.line(image, (22 + 140 ,281-240 - 25), (1280//2-55 - 150,281-240 - 25), color = (0,0,255), thickness = 3)


		cv2.imshow('result', image)
		
		if cv2.waitKey(33) == 27:
			break

	if all_y[-1] >= line_ys[-1]:
		RESULT = "\nPASSED"
	else:
		RESULT	= "\nFAILED"

	print(RESULT)
	time.sleep(1)
	cv2.destroyAllWindows()
	

if __name__ == '__main__':
	run_test()
