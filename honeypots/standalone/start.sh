apt-get install python3-pip python3-venv
echo {\"logs\":\"terminal,url\", \"excluded_actions_from_logging\":[\"post\", \"get\", \"process\"], \"url\":\"$1\"} > config.json
python3 -m venv .venv
activate(){
    . ./.venv/bin/activate
    pip3 install -r requirements.txt
    cp ../helper.py .venv/lib/python3.9/site-packages/honeypots
    honeypots --setup http:1234 --config config.json
}
activate

#bash .venv/bin/activate && pip3 install -r requirements.txt && cp *.py .venv/lib/python3.9/site-packages/honeypots && echo {\"logs\":\"terminal,url\", \"url\":\"$1\"} > config.json && honeypots --setup http:1234 --config config.json
