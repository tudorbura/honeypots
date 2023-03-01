echo {\"logs\":\"terminal,url\", \"excluded_actions_from_logging\":[$EXCLUDED_ACTIONS], \"url\":\"$URL\"} > config.json
echo Config JSON written locally:
cat config.json
echo Starting honeypots with command line:
echo honeypots --setup $SERVICES --config config.json
honeypots --setup $SERVICES --config config.json
