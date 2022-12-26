from flask import Flask,request,render_template,session,redirect,jsonify
from form import ReportForm,LoginForm,RegisterForm
import os,pymysql
import requests,secrets,random,string
from flask_wtf.csrf import CSRFProtect

app= Flask(__name__)
app.config["SECRET_KEY"]=os.urandom(15).hex()
app.config['RECAPTCHA_USE_SSL']= False
app.config['RECAPTCHA_PUBLIC_KEY']= os.getenv("PUBLIC_KEY")
app.config['RECAPTCHA_PRIVATE_KEY']=os.getenv("PRIVATE_KEY")
app.config['RECAPTCHA_OPTIONS'] = {'theme':'white'}
app.config["SESSION_COOKIE_HTTPONLY"] = False
csrf = CSRFProtect()
csrf.init_app(app)

def random_string(S):
    ran = ''.join(random.choices(string.ascii_uppercase + string.digits, k = S))    
    return ran

def get_db():
    mydb = pymysql.connect(
    host="db",
    user="yogosha",
    password=os.getenv("mysql_pass"),
    database="yogosha"
    )
    return mydb.cursor(),mydb


def create_paste(paste, username):
    paste_id = random_string(64)
    cursor,mydb=get_db()
    cursor.execute(
    'INSERT INTO pastes (id, paste, username) VALUES (%s, %s, %s);',
    (paste_id, paste, username)
    )
    mydb.commit()
    return paste


def get_pastes(username):
    cursor,mydb=get_db()
    cursor.execute(
    'SELECT paste FROM pastes WHERE username = %s',
    username
    )
    result=cursor.fetchall()
    mydb.commit()
    return [paste[0] for paste in result]


def get_paste(paste_id):
    cursor,mydb=get_db()
    cursor.execute(
    'SELECT paste FROM pastes WHERE id = %s',
    paste_id
    )
    results=cursor.fetchone()
    mydb.commit()
    if len(results) < 1:
        return 'Paste not found!'
    return results[0]


@app.route("/",methods=["GET"])
def index():
	return render_template("index.html")


@app.route("/register",methods=["GET","POST"])
def register():
    if request.method == "POST":
        if "username" in session :
            return redirect("/home")
        if request.values.get("username") and len(request.values.get("username"))<50 and request.values.get("password"):
            cursor,mydb = get_db()
            query = "SELECT * FROM users WHERE username=%s"
            cursor.execute(query, request.values.get("username"))
            result = cursor.fetchone()
            if result is not None:
                return render_template("register.html",error="Username already exists")
            try:
                mydb.commit()
                cursor.close()
                cursor,mydb=get_db()
                query="INSERT INTO users(id,username,password) VALUES(null,%s,%s)"
                values=(request.values.get("username"),request.values.get("password"))
                cursor.execute(query,values)
                mydb.commit()
                session["username"]=request.values.get("username")
                cursor.close()
                return redirect("/home")
            except Exception:
                return render_template("register.html",error="Error happened while registering")
        else:
            return redirect("/login",302)
    else:
        if "username" in session:
            return redirect("/home")
        else:
            return render_template("register.html",error="")

@app.route("/view",methods=["GET"])
def view():
    if request.args["id"]:
        id=request.args["id"]
        return render_template("view.html",paste=id)
    else:
        return redirect("/home")
@app.route("/home",methods=["GET"])
def home():
    if "username" in session :
       print(get_pastes(session['username']))
       return render_template("home.html",username=session["username"],pastes=len(get_pastes(session['username'])))
    else:
        return redirect("/login")


@app.route("/login",methods=["GET","POST"])
def login():
    if request.method=="GET":
        if "username" in session:
            return redirect("/home")
        else:
            return render_template("login.html",error="")
    else:
        username=request.values.get("username")
        password=request.values.get("password")
        if username is None or password is None:
            return render_template("login.html",error="")
        else:
            cursor,mydb = get_db()
            query = "SELECT * FROM users WHERE username=%s AND password=%s"
            cursor.execute(query, (username, password))
            result = cursor.fetchone()
            if result is not None:
                session["username"]=result[1]
                mydb.commit()
                cursor.close()
                return redirect("/home")
            else:
                return render_template("login.html",error="Username or password is incorrect")

@app.route("/logout",methods=["GET"])
def logout():
	session.clear()
	return redirect("/")

@app.route('/create_paste', methods=['POST'])
def create():
    if 'username' not in session:
        return redirect('/login')
    if len(request.form['paste'])<400:
        paste = create_paste(
            request.form['paste'],
            session['username']
        )
        return render_template("view.html",paste=paste)
    return redirect('/home')

@app.route('/search',methods=["POST"])
@csrf.exempt
def search():
    if 'username' not in session:
        return redirect('/login')
    if 'query' not in request.form:
        return jsonify({"Total":len(get_pastes(session['username']))})
    query = str(request.form.get('query'))
    results = (
        paste for paste in get_pastes(session['username'])
        if query in paste
    )
    try:
        res=next(results)
        agent=request.headers["User-Agent"]
        if len(agent)>10:
            res=agent[0:15]+" is allowed to execute the jutsu: "+res
        else:
            res=agent[0:15]+" is not allowed to execute the jutsu: "+res
        return render_template("view.html",paste="Not Found")
    except StopIteration:
        return render_template("view.html",paste="Not Found")


# No vulns here just the bot implementation
@app.route("/report",methods=["POST","GET"])
def report():
	form= ReportForm()
	if request.method=="POST":
		if not request.form.get("url").startswith("http://"):
			return render_template("report.html",form=form,msg="No only URLs starting with http:// are accepted")
		r=requests.get("http://bot?url="+request.form.get("url"))
		if "successfully" in r.text:
			return render_template("report.html",form=form,msg="Admin visited your website successfully")
		else:
			return render_template("report.html",form=form,msg="An unknown error has occured")
	else:
		return render_template("report.html",msg="",form=form)


if __name__=="__main__":
	app.run(host="127.0.0.1",debug=False)

