import vispy

app = vispy.app.use_app()
print("Vispy is using the", app.backend_name, "backend.")