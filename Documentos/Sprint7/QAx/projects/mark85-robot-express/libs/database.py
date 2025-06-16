from pymongo import MongoClient
from robot.api.deco import keyword
import bcrypt

client = MongoClient('mongodb+srv://luisms:qa123@cluster0.zjr8ize.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0')

db = client['markdb']

def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print(email)

def insert_user(user):
    hash_pass = bcrypt.hashpw(user['password'].encode('utf-8'), bcrypt.gensalt(8))
    doc = {
        'name': user['name'],
        'email': user['email'],
        'password': hash_pass
        }
    users = db['users']
    users.insert_one(doc)