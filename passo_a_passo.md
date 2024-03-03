Powershell admin 
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
s (sim)

python -m venv venv
.\venv\Scripts\activate
python -m pip install --upgrade pip
python -m pip install dbt-bigquery

Bash:
ls -al ~/.ssh
clip < ~/.ssh/id_ed25519.pub