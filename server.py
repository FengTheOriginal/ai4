import time
import requests
import random
import hashlib
randommessages = ["Gavin","Jiang", "Feng", "Blaing", "Nyang", "Ling", "Hung", "Bang", "Yang", "Chang", "Ping", "Wang", "Chong", "Tang", "Zhang", "Hong", "Ming", "Shang", "Kang", "Liang", "Xiang"]
randint = random.randrange(0,25)

while True:
    if random.random() < 0.1:
        message = "Adam"
        uncoded = message
    else:
        message = random.choice(randommessages)
        uncoded = message
    
    cmessage = hashlib.md5(message.encode()).hexdigest()
    message = requests.get("http://0.0.0.0:8000/")

    print(f"Message sent: Password: {cmessage} : Username: {uncoded} ")


    time.sleep(2)

