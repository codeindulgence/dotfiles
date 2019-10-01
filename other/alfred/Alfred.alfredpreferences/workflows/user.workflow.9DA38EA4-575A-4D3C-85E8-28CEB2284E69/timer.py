import sys, time, subprocess

def playSound():
	subprocess.Popen(['afplay', "Ping.aiff"])
	time.sleep(.5)
	subprocess.Popen(['afplay', "Ping.aiff"])


def timer(minute, second, message):
	totalSeconds = minute*60 + second
	time.sleep(totalSeconds)

	if message:
		playSound()
		print message
	else:
		playSound()
		print "Timer is done!"


def parseInput(time):
	try:
		if ":" in time:
			comps = time.split(":")
			if len(comps) > 2:
				return -1
			else:
				minute, second = comps
				if minute.isdigit() and second.isdigit():
					second = int(second[:2])
					minute = int(minute[-3:])
					return (minute*60) + second
				elif second.isdigit():
					second = int(second[:2])
					return second
				else:
					return -1
		else:
			totalSeconds = int(float(time)*60)
			return totalSeconds
	except:
		return -1

def main(query):
	query = query.replace("\\","")
	comps = query.split(" ")
	message = " ".join(comps[1:])
	time = comps[0]
	totalSeconds = parseInput(time)
	if totalSeconds == -1: 
		return

	minutes = int(totalSeconds/60)
	seconds = totalSeconds%60

	timer(minutes, seconds, message)

# main("{query}")