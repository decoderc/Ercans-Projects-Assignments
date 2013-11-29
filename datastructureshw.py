#!/usr/bin/python
# -*- coding: utf-8 -*-

class Queue:   #Kuyruk sinifi olusturuldu.
    def __init__(self):
        self.items = []

    def isEmpty(self):
        return self.items==[]

    def enqueue(self,item):
        self.items.insert(0,item)

    def dequeue(self):
        return self.items.pop()

    def size(self):
        return len(self.items)
    
    def arama(self, item):      #kuyruk uzerinde s nin elemanlarini denetlemek(aramak) icin arama fonksiyonu tasarlandi.
        return (item in self.items)
       

import Image
import os

def bolge_buyut(img,eps,ilk):
    
    Q=Queue()  #kuyrugumuz cagrildi.
    s=[]  #Bos bir liste olusturuldu.
    a=ilk[0]
    b=ilk[1]
    img =img.convert("L")
    
    Q.enqueue((a,b))  #kuyruga a ve b ikilisini ekle.
    while not Q.isEmpty():
        p = Q.dequeue()  #Kuyruktan p piksellerini cikar.
        a = p[0]  #ikili piksel degerinde ilk piksel degeri a
        b = p[1]  #ikili piksel degerinde ikinci piksel degeri b
        #p nin epsülon komsulugundakilerin her birisi icin; s nin elemanı olmayan p ye benzeyen epsülon p leri kuyruga ekle;
        #kuyruk bosalincaya kadar devam et.
        
        if a < img.size[0]-1 and (img.getpixel((a+1,b)) - img.getpixel((a,b))) <= eps :
            if not Q.arama((a+1, b)) and not (a+1, b) in s:
                Q.enqueue((a+1,b))
                
        if a > 0 and (img.getpixel((a-1,b)) - img.getpixel((a,b))) <= eps:
            if not Q.arama((a-1, b)) and not (a-1, b) in s:
                Q.enqueue((a-1,b))
                     
        if b < img.size[1]-1 and (img.getpixel((a,b+1)) - img.getpixel((a,b))) <= eps:
            if not Q.arama((a, b+1)) and not (a, b+1) in s:
                Q.enqueue((a,b+1))
                    
        if b > 0 and (img.getpixel((a,b-1)) - img.getpixel((a,b))) <= eps:
            if not Q.arama((a, b-1)) and not (a, b-1) in s:
                Q.enqueue((a,b-1))

        if p not in s:
            s.append(p)
            
    img.load()
    putpixel = img.img.putpixel
    
    for x in range (img.size[0]):
        for y in range (img.size[1]):
            putpixel((x, y), 0)

    for x in s:
        putpixel(i, 150)
        
    output=raw_input("kaydediceginiz dosya adini giriniz: ") 
    img.thumbnail((img.size[0],img.size[1]), Image.ANTIALIAS)
    img.save(output + ".JPEG", "JPEG")

#img=Image.open("pass")
#eps=pass
#spoint=pass
#bolge_buyut(img,eps,ilk)




