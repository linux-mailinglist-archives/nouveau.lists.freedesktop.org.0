Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C19B1C68
	for <lists+nouveau@lfdr.de>; Fri, 13 Sep 2019 13:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533A46EF1F;
	Fri, 13 Sep 2019 11:33:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278BB6EF20
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 11:33:13 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 87FB42026F
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 11:33:12 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id 190so782136wme.4
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 04:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jQP0jBsyWalN3/I35Zc1wCJOHzurkUkBjdPE9X9aDU=;
 b=jTBvW0+a8cXrMYmLedYN2loxdCVqtbddfcgn6sDE9Tar9akJajXEA2vGdBFmMAN+rU
 4bs3GYGvdUTMqhjpCA5jg46YW2xSO49aBvd3QRrs+kKfYvfe3H6qklBJLNunBfccru0F
 xx6siD5UFbgxk5KHFgXG2cvytdBPlxSfcifYbx4wzvDXW1JYZaaGND62qqMSu7eqBZPW
 ig5OFfhqudMbLN59uXd9FDEMWdZVvo1VhMqcjDP6GozmsMr9JDEj3wLWmDqo6vNWl/Cg
 DC52FhbreYwi6Y4cbEkfJfhicr7j9wJkYFN/BqT7qymp4xVKYO95GqWzhKIWCuR7Lfzm
 YtiQ==
X-Gm-Message-State: APjAAAU9Ac94N8KMl+pzC8NLCiTWdzUmkLzH3XHhOdfvqDs1DTYfAFsX
 IpMe78+57VKuMfe79F5L3AvAps3fg6txVCo5Ad5PuUmQjvAjqZzrC4XhNTJP53MoVeoRE20VJF1
 rAYr9wnSdtuS4f+fsZSYyQvNOWw==
X-Received: by 2002:a05:600c:230d:: with SMTP id
 13mr3173944wmo.114.1568374391019; 
 Fri, 13 Sep 2019 04:33:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhryZg5XiD8iYUIZv0Kelz4MqhQr5l6N1hBYlBWFtJDjD5c9tuFGXbg8AEKXQytphi5BVTmg==
X-Received: by 2002:a05:600c:230d:: with SMTP id
 13mr3173927wmo.114.1568374390821; 
 Fri, 13 Sep 2019 04:33:10 -0700 (PDT)
Received: from kherbst.pingu.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r15sm2262769wmh.42.2019.09.13.04.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 04:33:10 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 13 Sep 2019 13:33:03 +0200
Message-Id: <20190913113306.20972-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913113306.20972-1-kherbst@redhat.com>
References: <20190913113306.20972-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v4 1/4] pci: enable pcie link changes for pascal
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

djI6IGFkZCBmb3JjZSBkaXNhYmxlIEFTUE0gZnVuYyBwb2ludGVyCgpTaWduZWQtb2ZmLWJ5OiBL
YXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwg
PGx5dWRlQHJlZGhhdC5jb20+ICh2MSkKLS0tCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kv
Z2sxMDQuYyB8ICA4ICsrKystLS0tCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ3AxMDAu
YyB8IDExICsrKysrKysrKysrCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcHJpdi5oICB8
ICA1ICsrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMgYi9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYwppbmRleCA4MDRlZjAxN2YuLjYxYzRl
NzZlOCAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMKKysr
IGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMKQEAgLTI1LDcgKzI1LDcgQEAK
IAogI2luY2x1ZGUgPHN1YmRldi90aW1lci5oPgogCi1zdGF0aWMgaW50CitpbnQKIGdrMTA0X3Bj
aWVfdmVyc2lvbl9zdXBwb3J0ZWQoc3RydWN0IG52a21fcGNpICpwY2kpCiB7CiAJcmV0dXJuIChu
dmttX3JkMzIocGNpLT5zdWJkZXYuZGV2aWNlLCAweDhjMWMwKSAmIDB4NCkgPT0gMHg0ID8gMiA6
IDE7CkBAIC0xMTAsNyArMTEwLDcgQEAgZ2sxMDRfcGNpZV9sbmtjdGxfc3BlZWQoc3RydWN0IG52
a21fcGNpICpwY2kpCiAJcmV0dXJuIC0xOwogfQogCi1zdGF0aWMgZW51bSBudmttX3BjaWVfc3Bl
ZWQKK2VudW0gbnZrbV9wY2llX3NwZWVkCiBnazEwNF9wY2llX21heF9zcGVlZChzdHJ1Y3QgbnZr
bV9wY2kgKnBjaSkKIHsKIAl1MzIgbWF4X3NwZWVkID0gbnZrbV9yZDMyKHBjaS0+c3ViZGV2LmRl
dmljZSwgMHg4YzFjMCkgJiAweDMwMDAwMDsKQEAgLTE1Niw3ICsxNTYsNyBAQCBnazEwNF9wY2ll
X3NldF9saW5rX3NwZWVkKHN0cnVjdCBudmttX3BjaSAqcGNpLCBlbnVtIG52a21fcGNpZV9zcGVl
ZCBzcGVlZCkKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludAoraW50CiBnazEwNF9wY2llX2lu
aXQoc3RydWN0IG52a21fcGNpICogcGNpKQogewogCWVudW0gbnZrbV9wY2llX3NwZWVkIGxua2N0
bF9zcGVlZCwgbWF4X3NwZWVkLCBjYXBfc3BlZWQ7CkBAIC0xODgsNyArMTg4LDcgQEAgZ2sxMDRf
cGNpZV9pbml0KHN0cnVjdCBudmttX3BjaSAqIHBjaSkKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGlj
IGludAoraW50CiBnazEwNF9wY2llX3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqcGNpLCBlbnVt
IG52a21fcGNpZV9zcGVlZCBzcGVlZCwgdTggd2lkdGgpCiB7CiAJc3RydWN0IG52a21fc3ViZGV2
ICpzdWJkZXYgPSAmcGNpLT5zdWJkZXY7CmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9wY2kvZ3AxMDAuYyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9ncDEwMC5jCmlu
ZGV4IDgyYzUyMzRhMC4uMTYzMjMzZjE2IDEwMDY0NAotLS0gYS9kcm0vbm91dmVhdS9udmttL3N1
YmRldi9wY2kvZ3AxMDAuYworKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ3AxMDAu
YwpAQCAtMzUsNiArMzUsMTcgQEAgZ3AxMDBfcGNpX2Z1bmMgPSB7CiAJLndyMDggPSBudjQwX3Bj
aV93cjA4LAogCS53cjMyID0gbnY0MF9wY2lfd3IzMiwKIAkubXNpX3JlYXJtID0gZ3AxMDBfcGNp
X21zaV9yZWFybSwKKworCS5wY2llLmluaXQgPSBnazEwNF9wY2llX2luaXQsCisJLnBjaWUuc2V0
X2xpbmsgPSBnazEwNF9wY2llX3NldF9saW5rLAorCisJLnBjaWUubWF4X3NwZWVkID0gZ2sxMDRf
cGNpZV9tYXhfc3BlZWQsCisJLnBjaWUuY3VyX3NwZWVkID0gZzg0X3BjaWVfY3VyX3NwZWVkLAor
CisJLnBjaWUuc2V0X3ZlcnNpb24gPSBnZjEwMF9wY2llX3NldF92ZXJzaW9uLAorCS5wY2llLnZl
cnNpb24gPSBnZjEwMF9wY2llX3ZlcnNpb24sCisJLnBjaWUudmVyc2lvbl9zdXBwb3J0ZWQgPSBn
azEwNF9wY2llX3ZlcnNpb25fc3VwcG9ydGVkLAorCS5wY2llLmZvcmNlX2FzcG1fb2ZmID0gZzg0
X3BjaWVfZm9yY2VfYXNwbV9vZmYsCiB9OwogCiBpbnQKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L3BjaS9wcml2LmggYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcHJp
di5oCmluZGV4IGM2YTllZjMzMC4uODJjNzhiZWZhIDEwMDY0NAotLS0gYS9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9wY2kvcHJpdi5oCisrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9w
cml2LmgKQEAgLTU2LDYgKzU2LDExIEBAIGludCBnZjEwMF9wY2llX2NhcF9zcGVlZChzdHJ1Y3Qg
bnZrbV9wY2kgKik7CiBpbnQgZ2YxMDBfcGNpZV9pbml0KHN0cnVjdCBudmttX3BjaSAqKTsKIGlu
dCBnZjEwMF9wY2llX3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqLCBlbnVtIG52a21fcGNpZV9z
cGVlZCwgdTgpOwogCitpbnQgZ2sxMDRfcGNpZV9pbml0KHN0cnVjdCBudmttX3BjaSAqKTsKK2lu
dCBnazEwNF9wY2llX3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqLCBlbnVtIG52a21fcGNpZV9z
cGVlZCwgdTggd2lkdGgpOworZW51bSBudmttX3BjaWVfc3BlZWQgZ2sxMDRfcGNpZV9tYXhfc3Bl
ZWQoc3RydWN0IG52a21fcGNpICopOworaW50IGdrMTA0X3BjaWVfdmVyc2lvbl9zdXBwb3J0ZWQo
c3RydWN0IG52a21fcGNpICopOworCiBpbnQgbnZrbV9wY2llX29uZWluaXQoc3RydWN0IG52a21f
cGNpICopOwogaW50IG52a21fcGNpZV9pbml0KHN0cnVjdCBudmttX3BjaSAqKTsKICNlbmRpZgot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
