FROM python:alpine3.20
# Set working directory
WORKDIR /app

# Copy requirements
COPY ./FlaskApp/requirements.txt .

# For Alpine-based systems
RUN pip install --upgrade pip
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add --no-cache mariadb-dev

# Install dependencies
RUN pip install -r requirements.txt
# Copy the app code
COPY ["./FlaskApp/app.py", "./FlaskApp/static", "./FlaskApp/templates", "./"]   

# Expose the app port
EXPOSE 5002

# Run the Flask app
ENTRYPOINT ["python3", "app.py"]

#docker run  -d  --env-file .env -p 82:5002 -it flask-sprints