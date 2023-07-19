cd C:\Users\li3930\Desktop\A.MuleSoft\devgideMD
start cmd /k python -m http.server
timeout /T 1 /NOBREAK > NUL
start chrome http://localhost:8000/DevGuide3.html

