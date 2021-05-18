import requests

def GET(url, expected_status=200):
    response = requests.get(url)
    assert response.status_code == expected_status
    return response
