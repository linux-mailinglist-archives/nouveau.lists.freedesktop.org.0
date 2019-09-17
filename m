Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FC9B5596
	for <lists+nouveau@lfdr.de>; Tue, 17 Sep 2019 20:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076516E0E8;
	Tue, 17 Sep 2019 18:47:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934C76E0E8
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 18:47:50 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E7CEA155E0
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 18:47:49 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id b143so5326233qkg.9
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 11:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=5zJgVdx2VhUWRP2yjEOvfIPJB7Yiohm4pcKuuBEbXHw=;
 b=og24gEohmN/vD3GIroj4vGM83gO5PzqKPgqIoaiDFqVenJ/xbj2jGKuGUR5jyIdB8Z
 nBkRgY1G4ykUgfzoO1f5wZgCSj8LkLzJ+/H1KijioOPMV867z66hOtZMmwHed1XJQhJ0
 g+xHxWV8McAu8MKVkQ2Kv6C0HyxICdRHm+6YuM7jBUTNQ5RsEfOvMD3vsUU6B4UBnGLJ
 bwbR1x8g75MBF4LzX/5v1ZGwUCnLHlJ/THzADsBfvcGhC8yhBmCfBXfS0YgWfmiXO31E
 1uqIC5HjmCKybMhKUdeujGlCPutsGQl6O1y9+KRTfy6kJfs3idO2SblxXr0JHBx05O9Z
 54kA==
X-Gm-Message-State: APjAAAUwsV5wkR1IHzBCnSZttfguQ+oQZdWxMEoP0GnzOLR74IldEONP
 WBaIbVBfah0V2zTeMmVDFFV1LxBhxkY3jFez1lfjnUOSQvDzDqWDuRNaH43oeqvT+JZwF7si3Rp
 tMMg6Y3a3kmTmW6SwaOAApP6CqQ==
X-Received: by 2002:a05:6214:70c:: with SMTP id
 b12mr4488659qvz.87.1568746068819; 
 Tue, 17 Sep 2019 11:47:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyr+s5iUu4ErTbsWx4JpO+Ckfu0o/HV2RfKKY0XnlruGS+8ZRIWy5GlQs5ER+Cxlgt7TSsFGA==
X-Received: by 2002:a05:6214:70c:: with SMTP id
 b12mr4488640qvz.87.1568746068498; 
 Tue, 17 Sep 2019 11:47:48 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id u39sm2108268qtj.34.2019.09.17.11.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 11:47:47 -0700 (PDT)
Message-ID: <538d97ce42f59cdeebea02382d2ee82cd0f95734.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org
Date: Tue, 17 Sep 2019 14:47:47 -0400
In-Reply-To: <20190913113306.20972-2-kherbst@redhat.com>
References: <20190913113306.20972-1-kherbst@redhat.com>
 <20190913113306.20972-2-kherbst@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH v4 1/4] pci: enable pcie link changes for
 pascal
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+IGZvciB2MgoKT24gRnJp
LCAyMDE5LTA5LTEzIGF0IDEzOjMzICswMjAwLCBLYXJvbCBIZXJic3Qgd3JvdGU6Cj4gdjI6IGFk
ZCBmb3JjZSBkaXNhYmxlIEFTUE0gZnVuYyBwb2ludGVyCj4gCj4gU2lnbmVkLW9mZi1ieTogS2Fy
b2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwg
PGx5dWRlQHJlZGhhdC5jb20+ICh2MSkKPiAtLS0KPiAgZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
cGNpL2drMTA0LmMgfCAgOCArKysrLS0tLQo+ICBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kv
Z3AxMDAuYyB8IDExICsrKysrKysrKysrCj4gIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9w
cml2LmggIHwgIDUgKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9w
Y2kvZ2sxMDQuYwo+IGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMKPiBpbmRl
eCA4MDRlZjAxN2YuLjYxYzRlNzZlOCAxMDA2NDQKPiAtLS0gYS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9wY2kvZ2sxMDQuYwo+ICsrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEw
NC5jCj4gQEAgLTI1LDcgKzI1LDcgQEAKPiAgCj4gICNpbmNsdWRlIDxzdWJkZXYvdGltZXIuaD4K
PiAgCj4gLXN0YXRpYyBpbnQKPiAraW50Cj4gIGdrMTA0X3BjaWVfdmVyc2lvbl9zdXBwb3J0ZWQo
c3RydWN0IG52a21fcGNpICpwY2kpCj4gIHsKPiAgCXJldHVybiAobnZrbV9yZDMyKHBjaS0+c3Vi
ZGV2LmRldmljZSwgMHg4YzFjMCkgJiAweDQpID09IDB4NCA/IDIgOiAxOwo+IEBAIC0xMTAsNyAr
MTEwLDcgQEAgZ2sxMDRfcGNpZV9sbmtjdGxfc3BlZWQoc3RydWN0IG52a21fcGNpICpwY2kpCj4g
IAlyZXR1cm4gLTE7Cj4gIH0KPiAgCj4gLXN0YXRpYyBlbnVtIG52a21fcGNpZV9zcGVlZAo+ICtl
bnVtIG52a21fcGNpZV9zcGVlZAo+ICBnazEwNF9wY2llX21heF9zcGVlZChzdHJ1Y3QgbnZrbV9w
Y2kgKnBjaSkKPiAgewo+ICAJdTMyIG1heF9zcGVlZCA9IG52a21fcmQzMihwY2ktPnN1YmRldi5k
ZXZpY2UsIDB4OGMxYzApICYgMHgzMDAwMDA7Cj4gQEAgLTE1Niw3ICsxNTYsNyBAQCBnazEwNF9w
Y2llX3NldF9saW5rX3NwZWVkKHN0cnVjdCBudmttX3BjaSAqcGNpLCBlbnVtCj4gbnZrbV9wY2ll
X3NwZWVkIHNwZWVkKQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQKPiAraW50
Cj4gIGdrMTA0X3BjaWVfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKiBwY2kpCj4gIHsKPiAgCWVudW0g
bnZrbV9wY2llX3NwZWVkIGxua2N0bF9zcGVlZCwgbWF4X3NwZWVkLCBjYXBfc3BlZWQ7Cj4gQEAg
LTE4OCw3ICsxODgsNyBAQCBnazEwNF9wY2llX2luaXQoc3RydWN0IG52a21fcGNpICogcGNpKQo+
ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQKPiAraW50Cj4gIGdrMTA0X3BjaWVf
c2V0X2xpbmsoc3RydWN0IG52a21fcGNpICpwY2ksIGVudW0gbnZrbV9wY2llX3NwZWVkIHNwZWVk
LCB1OAo+IHdpZHRoKQo+ICB7Cj4gIAlzdHJ1Y3QgbnZrbV9zdWJkZXYgKnN1YmRldiA9ICZwY2kt
PnN1YmRldjsKPiBkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dwMTAw
LmMKPiBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9ncDEwMC5jCj4gaW5kZXggODJjNTIz
NGEwLi4xNjMyMzNmMTYgMTAwNjQ0Cj4gLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNp
L2dwMTAwLmMKPiArKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ3AxMDAuYwo+IEBA
IC0zNSw2ICszNSwxNyBAQCBncDEwMF9wY2lfZnVuYyA9IHsKPiAgCS53cjA4ID0gbnY0MF9wY2lf
d3IwOCwKPiAgCS53cjMyID0gbnY0MF9wY2lfd3IzMiwKPiAgCS5tc2lfcmVhcm0gPSBncDEwMF9w
Y2lfbXNpX3JlYXJtLAo+ICsKPiArCS5wY2llLmluaXQgPSBnazEwNF9wY2llX2luaXQsCj4gKwku
cGNpZS5zZXRfbGluayA9IGdrMTA0X3BjaWVfc2V0X2xpbmssCj4gKwo+ICsJLnBjaWUubWF4X3Nw
ZWVkID0gZ2sxMDRfcGNpZV9tYXhfc3BlZWQsCj4gKwkucGNpZS5jdXJfc3BlZWQgPSBnODRfcGNp
ZV9jdXJfc3BlZWQsCj4gKwo+ICsJLnBjaWUuc2V0X3ZlcnNpb24gPSBnZjEwMF9wY2llX3NldF92
ZXJzaW9uLAo+ICsJLnBjaWUudmVyc2lvbiA9IGdmMTAwX3BjaWVfdmVyc2lvbiwKPiArCS5wY2ll
LnZlcnNpb25fc3VwcG9ydGVkID0gZ2sxMDRfcGNpZV92ZXJzaW9uX3N1cHBvcnRlZCwKPiArCS5w
Y2llLmZvcmNlX2FzcG1fb2ZmID0gZzg0X3BjaWVfZm9yY2VfYXNwbV9vZmYsCj4gIH07Cj4gIAo+
ICBpbnQKPiBkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3ByaXYuaAo+
IGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3ByaXYuaAo+IGluZGV4IGM2YTllZjMzMC4u
ODJjNzhiZWZhIDEwMDY0NAo+IC0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wcml2
LmgKPiArKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcHJpdi5oCj4gQEAgLTU2LDYg
KzU2LDExIEBAIGludCBnZjEwMF9wY2llX2NhcF9zcGVlZChzdHJ1Y3QgbnZrbV9wY2kgKik7Cj4g
IGludCBnZjEwMF9wY2llX2luaXQoc3RydWN0IG52a21fcGNpICopOwo+ICBpbnQgZ2YxMDBfcGNp
ZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKiwgZW51bSBudmttX3BjaWVfc3BlZWQsIHU4KTsK
PiAgCj4gK2ludCBnazEwNF9wY2llX2luaXQoc3RydWN0IG52a21fcGNpICopOwo+ICtpbnQgZ2sx
MDRfcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKiwgZW51bSBudmttX3BjaWVfc3BlZWQs
IHU4IHdpZHRoKTsKPiArZW51bSBudmttX3BjaWVfc3BlZWQgZ2sxMDRfcGNpZV9tYXhfc3BlZWQo
c3RydWN0IG52a21fcGNpICopOwo+ICtpbnQgZ2sxMDRfcGNpZV92ZXJzaW9uX3N1cHBvcnRlZChz
dHJ1Y3QgbnZrbV9wY2kgKik7Cj4gKwo+ICBpbnQgbnZrbV9wY2llX29uZWluaXQoc3RydWN0IG52
a21fcGNpICopOwo+ICBpbnQgbnZrbV9wY2llX2luaXQoc3RydWN0IG52a21fcGNpICopOwo+ICAj
ZW5kaWYKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vbm91dmVhdQ==
