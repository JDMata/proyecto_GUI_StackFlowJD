import requests
from bs4 import BeautifulSoup

def get_academic_suggestions(query):
    url = f"https://scholar.google.com/scholar?q={query}"
    headers = {"User-Agent": "Mozilla/5.0"}
    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        soup = BeautifulSoup(response.text, "html.parser")
        results = []
        for entry in soup.select('.gs_ri'):
            title = entry.select_one('.gs_rt a')
            if title:
                results.append(title.text)
        return results
    return []
