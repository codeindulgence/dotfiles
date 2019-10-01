import sys, time

def printUsage():
	print "Timer usage: timer [time] [message (optional)]"

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
		print query
		print comps
		# printUsage() 
		return

	minutes = int(totalSeconds/60)
	seconds = totalSeconds%60

	if minutes != 0 and seconds != 0:
		print "Timer set for", minutes, "minutes and",seconds,"seconds."
	elif minutes != 0 and seconds == 0:
		print "Timer set for",minutes,"minutes."
	else:
		print "Timer set for",seconds,"seconds."

# run this
# main("{query}")