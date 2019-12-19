# 1. 16进制:

~~~python
b"\xff".hex() # ff
bytes.fromhex("fe") #b"\xfe"
binascii.unhexlify("ff") # b"\xff"
binascii.hexlify(b"\xff") # b"ff"
~~~

