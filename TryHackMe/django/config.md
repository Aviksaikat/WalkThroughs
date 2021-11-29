Make a directory for your project files and navigate there with the command prompt.

run django-admin startproject {project_name} 
in order to start your project. (Replace {project_name} with your prefered name).

Run python3 manage.py 
migrateto automatically configure new files.

After creating the project you can see that Django creates a file manage.py and a file directory named after your project.

manage.py is a command-line utility that lets you interact with your Django project in various ways. It is especially handy in creating web-apps, managing databases, and most importantly running the server.

Basic syntax for using this utility is python3 manage.py {command}

> runserver

Runserver is the most important command used with manage.py; It allows you to deploy your website on the server. Django has a wonderful feature that allows you to instantly see changes made on the website without restarting it. (It is only necessary to restart runserver command when adding a new app).



Note: If you are willing to run the server to your local network, just add 0.0.0.0:8000 after runserver command. (In case if you get an error afterward, just go to settings.py located your websites folder and add this address to ALLOWED_HOSTS)


> createsuperuser

This command allows you to create an admin account for your Django web admin panel. 

Run this command and access the panel at IP:8000/admin

> startapp

Startapp allows you to initialize an app for your project. Django projects can have infinite number of apps. Basic syntax:

python3 manage.py startapp {app_name}