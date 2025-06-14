from pymongo import MongoClient
from robot.api.deco import keyword

client = MongoClient('mongodb+srv://luisms:qa123@cluster0.zjr8ize.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0')

db = client['markdb']

def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print(email)

def insert_user(name, email, password):
    doc = {
        'name': name
    }
    user.insert_one(doc)