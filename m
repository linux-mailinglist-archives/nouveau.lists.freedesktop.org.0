Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E312F16B9D
	for <lists+nouveau@lfdr.de>; Tue,  7 May 2019 21:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A35389FE3;
	Tue,  7 May 2019 19:44:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701C389ECB
 for <nouveau@lists.freedesktop.org>; Tue,  7 May 2019 19:44:53 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c14so2561451qke.3
 for <nouveau@lists.freedesktop.org>; Tue, 07 May 2019 12:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=LSmVza5B/7wXvgj2MYAefD+5P6jsaElt58gW6DsajsE=;
 b=ftC0+lG+9CgAP0JZTlz+RThg44ZanGjXutVLvnKGqdbPTOttkJailSdwebZKh2Xrdj
 xyv4QW3JmsIhaM3whH3rngmSHErg4CvJTDVLIlUvY6swL9l4cyk0ECrqomjTHw9teqhX
 iXuVB+dLjC0vUP7ve65E9f5Z1eTYmvTpl4hGc/5XnFCUA9NakIcoaSSgBdMa+KjIe4u+
 QABDUTyjWjJyWsaJsxGMfkIDyagkz9f5UTCc35qdcsIWouQ6VPzAgUBQBfJQ2xfI/qzr
 WcfhuTdFfAiJ/a4MSqBatWtSbXR4Q65uj05G6PoblkT+aBF1hfvDWGo4iHZmiIzs3YG0
 E9JQ==
X-Gm-Message-State: APjAAAUa5JMqml8JkTWPk5AqqnpvyC+cmNIIQ2ashD0lXxy8Fz1MBIyV
 FMUH58eQ5chvr2F1ftLhGIIgRw==
X-Google-Smtp-Source: APXvYqzq7Vht3zwHR+Zlosdu2DP9qFuM7vx1VT9PsOtWzLEt9xSFC/GqdRSbgALY+glCsSfQvxmlpw==
X-Received: by 2002:a37:a005:: with SMTP id j5mr15921094qke.331.1557258292627; 
 Tue, 07 May 2019 12:44:52 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id n7sm8614096qtl.43.2019.05.07.12.44.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 07 May 2019 12:44:51 -0700 (PDT)
Message-ID: <8624e3c787b500b2a9a9e8788785a7343eb46ead.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org
Date: Tue, 07 May 2019 15:44:50 -0400
In-Reply-To: <20190504163219.8349-6-kherbst@redhat.com>
References: <20190504163219.8349-1-kherbst@redhat.com>
 <20190504163219.8349-6-kherbst@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH 5/5] pci: restore the boot pcie link speed on
 fini
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

SSB0aGluayBpdCBzaG91bGQgYmUgZmluZSB0byBqdXN0IHNxdWFzaCB0aGlzIGFuZCB0aGUgcHJl
dmlvdXMgcGF0Y2ggdG9nZXRoZXIuCklmIG5vdCwgbG9uZ2VyIGNvbW1pdCBtZXNzYWdlIGhlcmUg
YXQgbGVhc3QKCnVwIHRvIHlvdSwgZWl0aGVyIHdheTogUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwg
PGx5dWRlQHJlZGhhdC5jb20+CgpPbiBTYXQsIDIwMTktMDUtMDQgYXQgMTg6MzIgKzAyMDAsIEth
cm9sIEhlcmJzdCB3cm90ZToKPiBmaXhlcyBydW50aW1lIHN1c3BlbmQgb24gbXkgZ3AxMDcKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4KPiAtLS0K
PiAgZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2Jhc2UuYyB8IDIgKysKPiAgZHJtL25vdXZl
YXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYyB8IDggKysrKysrKysKPiAgZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvcGNpL3ByaXYuaCB8IDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2Jhc2Uu
Ywo+IGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2Jhc2UuYwo+IGluZGV4IGI2ZWJlZTZm
Li5kOWZiNWE4MyAxMDA2NDQKPiAtLS0gYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvYmFz
ZS5jCj4gKysrIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2Jhc2UuYwo+IEBAIC05MCw2
ICs5MCw4IEBAIG52a21fcGNpX2Zpbmkoc3RydWN0IG52a21fc3ViZGV2ICpzdWJkZXYsIGJvb2wg
c3VzcGVuZCkKPiAgCj4gIAlpZiAocGNpLT5hZ3AuYnJpZGdlKQo+ICAJCW52a21fYWdwX2Zpbmko
cGNpKTsKPiArCWVsc2UgaWYgKHBjaV9pc19wY2llKHBjaS0+cGRldikpCj4gKwkJbnZrbV9wY2ll
X2ZpbmkocGNpKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+IGRpZmYgLS1naXQgYS9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5jCj4gYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9w
Y2kvcGNpZS5jCj4gaW5kZXggNzI3YjVkNmEuLjAwYzA3ZmQ4IDEwMDY0NAo+IC0tLSBhL2RybS9u
b3V2ZWF1L252a20vc3ViZGV2L3BjaS9wY2llLmMKPiArKysgYi9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9wY2kvcGNpZS5jCj4gQEAgLTExOCw2ICsxMTgsMTQgQEAgbnZrbV9wY2llX2luaXQoc3Ry
dWN0IG52a21fcGNpICpwY2kpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAraW50Cj4gK252a21f
cGNpZV9maW5pKHN0cnVjdCBudmttX3BjaSAqcGNpKQo+ICt7Cj4gKwlpZiAoIUlTX0VSUl9WQUxV
RShwY2ktPnBjaWUuZGVmX3NwZWVkKSkKPiArCQlyZXR1cm4gbnZrbV9wY2llX3NldF9saW5rKHBj
aSwgcGNpLT5wY2llLmRlZl9zcGVlZCwgMTYpOwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gIGlu
dAo+ICBudmttX3BjaWVfc2V0X2xpbmsoc3RydWN0IG52a21fcGNpICpwY2ksIGVudW0gbnZrbV9w
Y2llX3NwZWVkIHNwZWVkLCB1OAo+IHdpZHRoKQo+ICB7Cj4gZGlmZiAtLWdpdCBhL2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L3BjaS9wcml2LmgKPiBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3Bj
aS9wcml2LmgKPiBpbmRleCBkYzNhZTNjZC4uZTc3NDQ2NzEgMTAwNjQ0Cj4gLS0tIGEvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvcGNpL3ByaXYuaAo+ICsrKyBiL2RybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L3BjaS9wcml2LmgKPiBAQCAtNjIsNCArNjIsNSBAQCBpbnQgZ2sxMDRfcGNpZV92ZXJzaW9u
X3N1cHBvcnRlZChzdHJ1Y3QgbnZrbV9wY2kgKik7Cj4gIGludCBudmttX3BjaWVfb25laW5pdChz
dHJ1Y3QgbnZrbV9wY2kgKik7Cj4gIGludCBudmttX3BjaWVfcHJlaW5pdChzdHJ1Y3QgbnZrbV9w
Y2kgKik7Cj4gIGludCBudmttX3BjaWVfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKik7Cj4gK2ludCBu
dmttX3BjaWVfZmluaShzdHJ1Y3QgbnZrbV9wY2kgKik7Cj4gICNlbmRpZgotLSAKQ2hlZXJzLAoJ
THl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
