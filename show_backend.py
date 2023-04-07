import vispy
from vispy import app

app_instance = app.use_app()
print("Vispy uses the following backend:", app_instance.backend_name)
