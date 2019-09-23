Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191A7BBD29
	for <lists+nouveau@lfdr.de>; Mon, 23 Sep 2019 22:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5BD89F73;
	Mon, 23 Sep 2019 20:40:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931CD89F5F
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 20:40:04 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EA6518535C
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 20:40:03 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id k9so7241108wmb.0
 for <nouveau@lists.freedesktop.org>; Mon, 23 Sep 2019 13:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVGJBUX/jjwFiabladxV1Uh63QDU1v/EtBGJWacHYe4=;
 b=SoEWpekOABaWbP/6GLQte3d9yWO6RiEDsKvAQUYb8felYoScKc9SEXSB6a98YcBVq8
 F2/XRUr99yEJqLJFkZMMiWuhYkeDO202gmTWwNTo+NLwh3DQJjcnMajNR9+jRN8LDFF0
 PxDbi9PzqeITeKRJZExaSvad773WUgtBvm9Py4+vLBuFK+A6+3DZ4Kl5J7xZRloIpd+o
 LlA7KtUCBjdLZpkIiLrczFMg+j/Wuy9QOCtZOWvK5sFZFQRSghyqujws5uhwdpd/jjMT
 +ud2um4ktpTQT+a/c/CJmQ2L+tDze5AVRaWLuEEUafww+wNuwuNuRCycJX9HzHM/rY6K
 5KWw==
X-Gm-Message-State: APjAAAXX0pOxLw0s3AuhGlWzsT/tJTr73i06e+UAa0+VK4282Bid8IsC
 k1MqlwNtsy3odLDbqXTl1zBIyMsyjITo7TNHYUoGpwUZ5j5upJRJYv170UD3tUEoHjVnBjreUPR
 RbklpZKFBAW9jNp7hrboWLLEAag==
X-Received: by 2002:a1c:4384:: with SMTP id q126mr1133692wma.153.1569271202426; 
 Mon, 23 Sep 2019 13:40:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzkqmswOKG74QMTQhs5qbgpbMNhIzRmexGsSJF8JhY17OfWpSjX7vmfVdhC3tSAcv8dnb3DAA==
X-Received: by 2002:a1c:4384:: with SMTP id q126mr1133682wma.153.1569271202238; 
 Mon, 23 Sep 2019 13:40:02 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:2d3c:bd88:58b8:6e7c])
 by smtp.gmail.com with ESMTPSA id o9sm21912918wrh.46.2019.09.23.13.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 13:40:01 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 23 Sep 2019 22:39:47 +0200
Message-Id: <20190923203951.1652-5-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923203951.1652-1-kherbst@redhat.com>
References: <20190923203951.1652-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 4/8] pci: enable pcie link changes for pascal
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
PGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0
LmMgfCAgOCArKysrLS0tLQogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dwMTAwLmMgfCAx
MSArKysrKysrKysrKwogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3ByaXYuaCAgfCAgNSAr
KysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jIGIvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMKaW5kZXggZGRhMTEzYTQ1Li5kNmJhMTkxOGUg
MTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jCisrKyBiL2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jCkBAIC0yNSw3ICsyNSw3IEBACiAKICNp
bmNsdWRlIDxzdWJkZXYvdGltZXIuaD4KIAotc3RhdGljIGludAoraW50CiBnazEwNF9wY2llX3Zl
cnNpb25fc3VwcG9ydGVkKHN0cnVjdCBudmttX3BjaSAqcGNpKQogewogCXJldHVybiAobnZrbV9y
ZDMyKHBjaS0+c3ViZGV2LmRldmljZSwgMHg4YzFjMCkgJiAweDQpID09IDB4NCA/IDIgOiAxOwpA
QCAtMTEwLDcgKzExMCw3IEBAIGdrMTA0X3BjaWVfbG5rY3RsX3NwZWVkKHN0cnVjdCBudmttX3Bj
aSAqcGNpKQogCXJldHVybiAtMTsKIH0KIAotc3RhdGljIGVudW0gbnZrbV9wY2llX3NwZWVkCitl
bnVtIG52a21fcGNpZV9zcGVlZAogZ2sxMDRfcGNpZV9tYXhfc3BlZWQoc3RydWN0IG52a21fcGNp
ICpwY2kpCiB7CiAJdTMyIG1heF9zcGVlZCA9IG52a21fcmQzMihwY2ktPnN1YmRldi5kZXZpY2Us
IDB4OGMxYzApICYgMHgzMDAwMDA7CkBAIC0xNTYsNyArMTU2LDcgQEAgZ2sxMDRfcGNpZV9zZXRf
bGlua19zcGVlZChzdHJ1Y3QgbnZrbV9wY2kgKnBjaSwgZW51bSBudmttX3BjaWVfc3BlZWQgc3Bl
ZWQpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQKK2ludAogZ2sxMDRfcGNpZV9pbml0KHN0
cnVjdCBudmttX3BjaSAqIHBjaSkKIHsKIAllbnVtIG52a21fcGNpZV9zcGVlZCBsbmtjdGxfc3Bl
ZWQsIG1heF9zcGVlZCwgY2FwX3NwZWVkOwpAQCAtMTg4LDcgKzE4OCw3IEBAIGdrMTA0X3BjaWVf
aW5pdChzdHJ1Y3QgbnZrbV9wY2kgKiBwY2kpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQK
K2ludAogZ2sxMDRfcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKnBjaSwgZW51bSBudmtt
X3BjaWVfc3BlZWQgc3BlZWQsIHU4IHdpZHRoKQogewogCXN0cnVjdCBudmttX3N1YmRldiAqc3Vi
ZGV2ID0gJnBjaS0+c3ViZGV2OwpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
cGNpL2dwMTAwLmMgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ3AxMDAuYwppbmRleCA4
MmM1MjM0YTAuLmMxMDIxMDlkOSAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
cGNpL2dwMTAwLmMKKysrIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dwMTAwLmMKQEAg
LTM1LDYgKzM1LDE3IEBAIGdwMTAwX3BjaV9mdW5jID0gewogCS53cjA4ID0gbnY0MF9wY2lfd3Iw
OCwKIAkud3IzMiA9IG52NDBfcGNpX3dyMzIsCiAJLm1zaV9yZWFybSA9IGdwMTAwX3BjaV9tc2lf
cmVhcm0sCisKKwkucGNpZS5pbml0ID0gZ2sxMDRfcGNpZV9pbml0LAorCS5wY2llLnNldF9saW5r
ID0gZ2sxMDRfcGNpZV9zZXRfbGluaywKKworCS5wY2llLm1heF9zcGVlZCA9IGdrMTA0X3BjaWVf
bWF4X3NwZWVkLAorCS5wY2llLmN1cl9zcGVlZCA9IGc4NF9wY2llX2N1cl9zcGVlZCwKKworCS5w
Y2llLnNldF92ZXJzaW9uID0gZ2YxMDBfcGNpZV9zZXRfdmVyc2lvbiwKKwkucGNpZS52ZXJzaW9u
ID0gZ2YxMDBfcGNpZV92ZXJzaW9uLAorCS5wY2llLnZlcnNpb25fc3VwcG9ydGVkID0gZ2sxMDRf
cGNpZV92ZXJzaW9uX3N1cHBvcnRlZCwKKwkucGNpZS5hc3BtX29mZiA9IGc4NF9wY2llX2FzcG1f
b2ZmLAogfTsKIAogaW50CmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kv
cHJpdi5oIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3ByaXYuaAppbmRleCA4NTE4ZmYw
NTYuLjE3YmUxZDU2MyAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3By
aXYuaAorKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcHJpdi5oCkBAIC02NCw2ICs2
NCwxMSBAQCBpbnQgZ2YxMDBfcGNpZV9jYXBfc3BlZWQoc3RydWN0IG52a21fcGNpICopOwogaW50
IGdmMTAwX3BjaWVfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKik7CiBpbnQgZ2YxMDBfcGNpZV9zZXRf
bGluayhzdHJ1Y3QgbnZrbV9wY2kgKiwgZW51bSBudmttX3BjaWVfc3BlZWQsIHU4KTsKIAoraW50
IGdrMTA0X3BjaWVfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKik7CitpbnQgZ2sxMDRfcGNpZV9zZXRf
bGluayhzdHJ1Y3QgbnZrbV9wY2kgKiwgZW51bSBudmttX3BjaWVfc3BlZWQsIHU4IHdpZHRoKTsK
K2VudW0gbnZrbV9wY2llX3NwZWVkIGdrMTA0X3BjaWVfbWF4X3NwZWVkKHN0cnVjdCBudmttX3Bj
aSAqKTsKK2ludCBnazEwNF9wY2llX3ZlcnNpb25fc3VwcG9ydGVkKHN0cnVjdCBudmttX3BjaSAq
KTsKKwogaW50IG52a21fcGNpZV9vbmVpbml0KHN0cnVjdCBudmttX3BjaSAqKTsKIGludCBudmtt
X3BjaWVfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKik7CiAjZW5kaWYKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5n
IGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
