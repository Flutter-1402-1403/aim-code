# build_files.sh
pip install -r requirements.txt

# make migrations
python3.12 manage.py migrate 
python3.12 manage.py collectstatic