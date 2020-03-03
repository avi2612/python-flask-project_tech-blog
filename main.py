from flask import Flask, render_template , request ,session , redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
import math
import os
from werkzeug.utils import secure_filename

local_server=True

with open('config.json','r') as c:
    params=json.load(c)["parameters"]

app=Flask(__name__)
app.secret_key='avinash_Singh'
app.config['UPLOAD_FOLDER']=params['upload-location']


if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI']=params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI']=params['prod_uri']


db=SQLAlchemy(app)

class Contacts(db.Model):
    '''sno , name  , message , email , date'''
    sno=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(80),unique=False, nullable=False)
    msg=db.Column(db.String(120), nullable=False)
    email=db.Column(db.String(20), nullable=False)
    date=db.Column(db.String(12), nullable=True)

class Posts(db.Model):
    '''sno , name , message , email , date'''
    sno=db.Column(db.Integer,primary_key=True)
    title=db.Column(db.String(80),unique=False, nullable=False)
    slug=db.Column(db.String(12), nullable=False)
    content1=db.Column(db.String(120), nullable=False)
    content2=db.Column(db.String(120), nullable=False)
    content3=db.Column(db.String(120), nullable=False)
    date=db.Column(db.String(12), nullable=True)
    img_file=db.Column(db.String(12), nullable=True)
    tagline=db.Column(db.String(40), nullable=True)



@app.route("/")
def home():
    posts=Posts.query.filter_by().all()
    last=math.ceil(len(posts)/int(params['no_of_posts']))
    page=request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    posts=posts[(page-1)*int(params['no_of_posts']) : (page-1)*int(params['no_of_posts']) + int(params['no_of_posts'])]

    if (page==1):
        prev="#"
        next="/?page="+str(page+1)
    elif(page==last):
        prev="/?page="+str(page-1)
        next="#"
    else:
        prev="/?page="+str(page-1)
        next="/?page="+str(page+1)

    return render_template('index.html',params=params,posts=posts,prev=prev,next=next)

@app.route("/about")
def about():
    return render_template('about.html',params=params)


@app.route("/uploader", methods=['GET','POST'])
def uploader():
    if ('user' in session and session['user']==params['admin-user']):
        if (request.method=='POST'):
            f=request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            return "file uploaded successfully"


@app.route("/delete/<string:sno>",methods=['GET','POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['admin-user']):
        post=Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect("/dashboard")

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect ('/dashboard')

@app.route("/contact",methods=['GET','POST'])
def contact():
    if (request.method=='POST'):
        '''Add entry to the database'''
        name=request.form.get('name')
        email=request.form.get('email')
        message=request.form.get('message')
        entry=Contacts(name=name,email=email,msg=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()

    return render_template('contact.html',params=params)

@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post=Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',params=params,post=post)

@app.route("/dashboard",methods=['GET','POST'])
def dashboard():
    if ('user' in session and session['user']==params['admin-user']):
        posts=Posts.query.all()
        return render_template("dashboard.html",params=params,posts=posts)


    if request.method=='POST':
        username=request.form.get('uname')
        userpass=request.form.get('pass')

        if (username==params['admin-user']) and (userpass==params['admin-password']):
            #set the session variable
            session['user']=username
            posts = Posts.query.all()
            return render_template("dashboard.html",params=params ,posts=posts )


    return render_template('login.html',params=params)



@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno): #it will fetch sno from above
    if ('user' in session and session['user']==params['admin-user']):
        if request.method=="POST":
            fetch_title=request.form.get('title')
            fetch_tagline=request.form.get('tagline')
            fetch_slug=request.form.get('slug')
            fetch_content1=request.form.get('content1')
            fetch_content2=request.form.get('content2')
            fetch_content3=request.form.get('content3')

            fetch_image=request.form.get('img_file')

            if sno=='0':
                post=Posts(title=fetch_title,slug=fetch_slug,tagline=fetch_tagline,content1=fetch_content1,content2=fetch_content2,content3=fetch_content3,img_file=fetch_image)
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title=fetch_title
                post.tagline=fetch_tagline
                post.img_file=fetch_image
                post.slug=fetch_slug
                post.content1=fetch_content1
                post.content2=fetch_content2
                post.content3=fetch_content3

                db.session.commit()
                return redirect('/edit/'+sno)
        post=Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',params=params,sno=sno, post=post)







app.run(host='0.0.0.0',  debug=True)
