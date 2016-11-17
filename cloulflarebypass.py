#!/usr/bin/python
import socket


subdomainlist = ["ftp", "cpanel", "webmail", "localhost", "local", "mysql", "forum", "driect-connect", "blog", "vb", "forums", "home", "direct", "forums", "mail", "access", "admin", "administrator", "email", "downloads", "ssh", "owa","bbs", "webmin", "paralel", "parallels", "www0", "www", "www1", "www2", "www3", "www4", "www5","shop", "api", "blogs", "test","mx1","cdn", "mysql", "mail1", "secure", "server", "ns1", "ns2", "smtp", "vpn", "m", "mail2", "postal", "support", "web", "dev"]

host = raw_input("Enter Web Site Adress: Example:google.com = ")
for sublist in subdomainlist:
    try:
       hosts = str(sublist) + "." + str(host)
       showip = socket.gethostbyname(str(hosts))
       print "[!] CloudFlare Bypass "+str(showip)+' :| '+str(hosts)
    except:
            pass

