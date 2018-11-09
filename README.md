
https://canyoupwn.me/tr-cloudflare-bypass-yontemleri/


# cloudflare bypass etmek için kullanılan iki ayrı script bulunmaktadır.


git clone https://github.com/cihanmehmet/cloudflarebypass.git

cd cloudflarebypass

İlk başta scriptlerimizi çalıştırabilmemiz için  yazma izni vermeliyiz

sudo chmod +x dnsresolver.sh

python cloulflarebypass.py 

ya da

./cloulflarebypass.py

sudo chmod +x  cloulflarebypass.py

bash dnsresolver.sh 

ya da

./dnsresolver.sh

## Kullanımı
## python cloulflarebypass.py 
![alt tag](http://i.hizliresim.com/Er98MZ.png)

## bash dnsresolver.sh 
Enter website name : Example =  google.com :esintitaki.com
![alt tag](http://i.hizliresim.com/GPMRgr.png)



## Ruby ile yazılmış olan gerçek ip adresini bulmak için yazılmış başla bir araç.

git clone https://github.com/HatBashBR/HatCloud.git 

cd HatCloud

sudo chmod +x hatcloud.rb

Kullanımı

ruby hatcloud.rb -b targetsite.com

ruby hatcloud.rb --byp targetsite.com




