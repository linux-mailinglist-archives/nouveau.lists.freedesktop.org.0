Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D235716B07
	for <lists+nouveau@lfdr.de>; Tue,  7 May 2019 21:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522C56E82C;
	Tue,  7 May 2019 19:17:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17726E82C
 for <nouveau@lists.freedesktop.org>; Tue,  7 May 2019 19:17:40 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id w20so250293qka.7
 for <nouveau@lists.freedesktop.org>; Tue, 07 May 2019 12:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=DzUDAMRq9LGKSmITdKfASxm9hM9qVDOFSkX6T+3ZGKM=;
 b=MkTSCNzpAC2cROeyChps6wLaHVnByewCaYEK4xK88dpmCfn7JZ3BXqqwuq038SuUSx
 e83/74SoQg0Co61pCaaqwqJHWEIW72gt1ZoWFlNV+12Gued1B48BIIhoF5GaUUviW5W/
 SydI9isetjg+JywEOLilwbKuuoDk9bGED5iFqzo84r+63/U/r+UhyHzvT9ZQCMjJ981O
 JqdOlBotqlD37yaVEPJyq/cy5kZb2LBA2uxtgo84I/rbrVLBBcUvHtjuFDBwlVRAVEg7
 cfy8uw3qzr9TmcQAHt9L6H++z0wE45R29W0SFY2I4E5DfEo6q11S0dgnxRbYXoQEtzOM
 IjPw==
X-Gm-Message-State: APjAAAX67XWm/ZEW+Qt4zbi9j6xjwDt+Hf31ztfbGrbmNdykJ6z+dcdT
 lDA2zJjhWPCIAYnyq8++kRo0lARrAdoUJA==
X-Google-Smtp-Source: APXvYqx81I72Cx/HzO/Jaw63aesoV6M6YlMcVgBcYKGc27pGX0r1IJOqvbTHgQ/Slekcp3SiioY9QA==
X-Received: by 2002:a37:4fca:: with SMTP id d193mr3117601qkb.298.1557256659826; 
 Tue, 07 May 2019 12:17:39 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id b2sm1751216qtj.0.2019.05.07.12.17.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 07 May 2019 12:17:39 -0700 (PDT)
Message-ID: <57262b30d61161862d43a1a2bd5cbebb086ca6fd.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org
Date: Tue, 07 May 2019 15:17:38 -0400
In-Reply-To: <20190504163219.8349-3-kherbst@redhat.com>
References: <20190504163219.8349-1-kherbst@redhat.com>
 <20190504163219.8349-3-kherbst@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH 2/5] pci: enable pcie link changes for pascal
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBTYXQsIDIwMTkt
MDUtMDQgYXQgMTg6MzIgKzAyMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5
OiBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvcGNpL2drMTA0LmMgfCAgOCArKysrLS0tLQo+ICBkcm0vbm91dmVhdS9udmtt
L3N1YmRldi9wY2kvZ3AxMDAuYyB8IDEwICsrKysrKysrKysKPiAgZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL3ByaXYuaCAgfCAgNSArKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L3BjaS9nazEwNC5jCj4gYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sx
MDQuYwo+IGluZGV4IGU2ODAzMDUwLi42NjQ4OTAxOCAxMDA2NDQKPiAtLS0gYS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYwo+ICsrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2
L3BjaS9nazEwNC5jCj4gQEAgLTIzLDcgKzIzLDcgQEAKPiAgICovCj4gICNpbmNsdWRlICJwcml2
LmgiCj4gIAo+IC1zdGF0aWMgaW50Cj4gK2ludAo+ICBnazEwNF9wY2llX3ZlcnNpb25fc3VwcG9y
dGVkKHN0cnVjdCBudmttX3BjaSAqcGNpKQo+ICB7Cj4gIAlyZXR1cm4gKG52a21fcmQzMihwY2kt
PnN1YmRldi5kZXZpY2UsIDB4OGMxYzApICYgMHg0KSA9PSAweDQgPyAyIDogMTsKPiBAQCAtMTA4
LDcgKzEwOCw3IEBAIGdrMTA0X3BjaWVfbG5rY3RsX3NwZWVkKHN0cnVjdCBudmttX3BjaSAqcGNp
KQo+ICAJcmV0dXJuIC0xOwo+ICB9Cj4gIAo+IC1zdGF0aWMgZW51bSBudmttX3BjaWVfc3BlZWQK
PiArZW51bSBudmttX3BjaWVfc3BlZWQKPiAgZ2sxMDRfcGNpZV9tYXhfc3BlZWQoc3RydWN0IG52
a21fcGNpICpwY2kpCj4gIHsKPiAgCXUzMiBtYXhfc3BlZWQgPSBudmttX3JkMzIocGNpLT5zdWJk
ZXYuZGV2aWNlLCAweDhjMWMwKSAmIDB4MzAwMDAwOwo+IEBAIC0xNDYsNyArMTQ2LDcgQEAgZ2sx
MDRfcGNpZV9zZXRfbGlua19zcGVlZChzdHJ1Y3QgbnZrbV9wY2kgKnBjaSwgZW51bQo+IG52a21f
cGNpZV9zcGVlZCBzcGVlZCkKPiAgCW52a21fbWFzayhkZXZpY2UsIDB4OGMwNDAsIDB4MSwgMHgx
KTsKPiAgfQo+ICAKPiAtc3RhdGljIGludAo+ICtpbnQKPiAgZ2sxMDRfcGNpZV9pbml0KHN0cnVj
dCBudmttX3BjaSAqIHBjaSkKPiAgewo+ICAJZW51bSBudmttX3BjaWVfc3BlZWQgbG5rY3RsX3Nw
ZWVkLCBtYXhfc3BlZWQsIGNhcF9zcGVlZDsKPiBAQCAtMTc4LDcgKzE3OCw3IEBAIGdrMTA0X3Bj
aWVfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKiBwY2kpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAt
c3RhdGljIGludAo+ICtpbnQKPiAgZ2sxMDRfcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kg
KnBjaSwgZW51bSBudmttX3BjaWVfc3BlZWQgc3BlZWQsIHU4Cj4gd2lkdGgpCj4gIHsKPiAgCXN0
cnVjdCBudmttX3N1YmRldiAqc3ViZGV2ID0gJnBjaS0+c3ViZGV2Owo+IGRpZmYgLS1naXQgYS9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ3AxMDAuYwo+IGIvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL2dwMTAwLmMKPiBpbmRleCA4MmM1MjM0YS4uZWIxOWM3YTQgMTAwNjQ0Cj4gLS0t
IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dwMTAwLmMKPiArKysgYi9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvZ3AxMDAuYwo+IEBAIC0zNSw2ICszNSwxNiBAQCBncDEwMF9wY2lf
ZnVuYyA9IHsKPiAgCS53cjA4ID0gbnY0MF9wY2lfd3IwOCwKPiAgCS53cjMyID0gbnY0MF9wY2lf
d3IzMiwKPiAgCS5tc2lfcmVhcm0gPSBncDEwMF9wY2lfbXNpX3JlYXJtLAo+ICsKPiArCS5wY2ll
LmluaXQgPSBnazEwNF9wY2llX2luaXQsCj4gKwkucGNpZS5zZXRfbGluayA9IGdrMTA0X3BjaWVf
c2V0X2xpbmssCj4gKwo+ICsJLnBjaWUubWF4X3NwZWVkID0gZ2sxMDRfcGNpZV9tYXhfc3BlZWQs
Cj4gKwkucGNpZS5jdXJfc3BlZWQgPSBnODRfcGNpZV9jdXJfc3BlZWQsCj4gKwo+ICsJLnBjaWUu
c2V0X3ZlcnNpb24gPSBnZjEwMF9wY2llX3NldF92ZXJzaW9uLAo+ICsJLnBjaWUudmVyc2lvbiA9
IGdmMTAwX3BjaWVfdmVyc2lvbiwKPiArCS5wY2llLnZlcnNpb25fc3VwcG9ydGVkID0gZ2sxMDRf
cGNpZV92ZXJzaW9uX3N1cHBvcnRlZCwKPiAgfTsKPiAgCj4gIGludAo+IGRpZmYgLS1naXQgYS9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcHJpdi5oCj4gYi9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9wY2kvcHJpdi5oCj4gaW5kZXggYzE3ZjYwNjMuLmEwZDRjMDA3IDEwMDY0NAo+IC0tLSBh
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wcml2LmgKPiArKysgYi9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9wY2kvcHJpdi5oCj4gQEAgLTU0LDYgKzU0LDExIEBAIGludCBnZjEwMF9wY2ll
X2NhcF9zcGVlZChzdHJ1Y3QgbnZrbV9wY2kgKik7Cj4gIGludCBnZjEwMF9wY2llX2luaXQoc3Ry
dWN0IG52a21fcGNpICopOwo+ICBpbnQgZ2YxMDBfcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9w
Y2kgKiwgZW51bSBudmttX3BjaWVfc3BlZWQsIHU4KTsKPiAgCj4gK2ludCBnazEwNF9wY2llX2lu
aXQoc3RydWN0IG52a21fcGNpICopOwo+ICtpbnQgZ2sxMDRfcGNpZV9zZXRfbGluayhzdHJ1Y3Qg
bnZrbV9wY2kgKiwgZW51bSBudmttX3BjaWVfc3BlZWQsIHU4IHdpZHRoKTsKPiArZW51bSBudmtt
X3BjaWVfc3BlZWQgZ2sxMDRfcGNpZV9tYXhfc3BlZWQoc3RydWN0IG52a21fcGNpICopOwo+ICtp
bnQgZ2sxMDRfcGNpZV92ZXJzaW9uX3N1cHBvcnRlZChzdHJ1Y3QgbnZrbV9wY2kgKik7Cj4gKwo+
ICBpbnQgbnZrbV9wY2llX29uZWluaXQoc3RydWN0IG52a21fcGNpICopOwo+ICBpbnQgbnZrbV9w
Y2llX2luaXQoc3RydWN0IG52a21fcGNpICopOwo+ICAjZW5kaWYKLS0gCkNoZWVycywKCUx5dWRl
IFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5v
dXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
