FROM python:3

ADD get_flag.py /

RUN pip install pyjwt==0.4.3
RUN pip install requests

CMD [ "python", "./get_flag.py" ]