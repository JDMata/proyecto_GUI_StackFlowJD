import os

DATABASE_URL = os.getenv('DATABASE_URL', 'postgresql://postgres:ADMOn-2024@localhost/studentoverflow')

SECRET_KEY = "clave_secreta"
