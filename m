Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2950468685
	for <lists+nouveau@lfdr.de>; Mon, 15 Jul 2019 11:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE028991C;
	Mon, 15 Jul 2019 09:43:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC4189907
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 09:43:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c2so13124548wrm.8
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 02:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AtS5Bi3AXKgQGu2VSX8GEMgtr85OTdQa2cn3+kUUfnA=;
 b=GMAggGFwI3I4NCNI0wk2uvL1V0rsCufcq+LWt23HzDk3JasCvT1A9d8li47c0yhRbJ
 RHKowKE5eeoR0HE/GEg0EDFYSZX+YC2TF8qRX9dZPaTIxEtz6R9lv7Lxt5bs2d1Bnxrb
 oK5+ZfcWcgcBgH4zW5Z1SJTaIEJEVJwmfn9YU02h6CmB4zH46+q9DmKske0uTJuZo9Nn
 SDMRO3Kq6m8iFETemPXikAf8lGi/fQ2hl1MuGi6TD2S+8AEfMqTpIGwxmbvA57BoZm/6
 1HAdtDMa2c6kXZHwzEUNmUSegBZxKUWMdcvCGjXgStDg1WH/9ZxoipXRhU9/ml/SYVOt
 XkOA==
X-Gm-Message-State: APjAAAUEiTDZ45E/Na8mh737/eGcdeWWYP7zu8Sgx63mh1NRdQpA6JZU
 tR+PCsRtcTRNNOYtdLaozj1C1/g/rQA=
X-Google-Smtp-Source: APXvYqyVIA1d2oFbw3OrlhMhlVTtfT60ibi6942fG7jGlM/JZbKQvDYyxMTaN/7Kj6SMULfjiF7ezQ==
X-Received: by 2002:adf:e442:: with SMTP id t2mr22202409wrm.286.1563183790918; 
 Mon, 15 Jul 2019 02:43:10 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o126sm14383044wmo.1.2019.07.15.02.43.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 02:43:10 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 15 Jul 2019 11:42:45 +0200
Message-Id: <20190715094247.8331-3-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715094247.8331-1-mmenzyns@redhat.com>
References: <20190715094247.8331-1-mmenzyns@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 2/4] gpio: fail if gpu external power is missing
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

Q3VycmVudGx5LCBub3V2ZWF1IGRvZXNuJ3QgY2hlY2sgaWYgR1BVIGlzIG1pc3NpbmcgcG93ZXIu
IFRoaXMKcGF0Y2ggbWFrZXMgbm91dmVhdSBmYWlsIHdoZW4gdGhpcyBoYXBwZW5zIG9uIGxhdGVz
dCBHUFVzLgoKSXQgY2hlY2tzIEdQSU8gZnVuY3Rpb24gMTIxIChFeHRlcm5hbCBQb3dlciBFbWVy
Z2VuY3kpLCB3aGljaApzaG91bGQgZGV0ZWN0IHBvd2VyIHByb2JsZW1zIG9uIEdQVSBpbml0aWFs
aXphdGlvbi4KClRlc3RlZCBvbiBUVTEwNCwgR1AxMDYgYW5kIEdGMTAwLgoKU2lnbmVkLW9mZi1i
eTogTWFyayBNZW56eW5za2kgPG1tZW56eW5zQHJlZGhhdC5jb20+Ci0tLQogZHJtL25vdXZlYXUv
aW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaCB8ICAxICsKIGRybS9ub3V2ZWF1L252a20v
c3ViZGV2L2dwaW8vYmFzZS5jICAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1
L2luY2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmggYi9kcm0vbm91dmVhdS9pbmNsdWRlL252
a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCmluZGV4IDJmNDA5MzVmLi5hNzBlYzllOCAxMDA2NDQKLS0t
IGEvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaAorKysgYi9kcm0v
bm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCkBAIC03LDYgKzcsNyBAQCBl
bnVtIGRjYl9ncGlvX2Z1bmNfbmFtZSB7CiAJRENCX0dQSU9fVFZEQUMwID0gMHgwYywKIAlEQ0Jf
R1BJT19UVkRBQzEgPSAweDJkLAogCURDQl9HUElPX0ZBTl9TRU5TRSA9IDB4M2QsCisJRENCX0dQ
SU9fRVhUX1BPV0VSX0xPVyA9IDB4NzksCiAJRENCX0dQSU9fTE9HT19MRURfUFdNID0gMHg4NCwK
IAlEQ0JfR1BJT19VTlVTRUQgPSAweGZmLAogCURDQl9HUElPX1ZJRDAgPSAweDA0LApkaWZmIC0t
Z2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3Bpby9iYXNlLmMgYi9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9ncGlvL2Jhc2UuYwppbmRleCAxMzk5ZDkyMy4uYzQ2ODU4MDcgMTAwNjQ0Ci0t
LSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jCisrKyBiL2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L2dwaW8vYmFzZS5jCkBAIC0xODIsMTIgKzE4MiwzNSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgZ3Bpb19yZXNldF9pZHNbXSA9IHsKIAl7IH0KIH07CiAK
K3N0YXRpYyBlbnVtIGRjYl9ncGlvX2Z1bmNfbmFtZSBwb3dlcl9jaGVja3NbXSA9IHsKKwlEQ0Jf
R1BJT19FWFRfUE9XRVJfTE9XLAorfTsKKwogc3RhdGljIGludAogbnZrbV9ncGlvX2luaXQoc3Ry
dWN0IG52a21fc3ViZGV2ICpzdWJkZXYpCiB7CiAJc3RydWN0IG52a21fZ3BpbyAqZ3BpbyA9IG52
a21fZ3BpbyhzdWJkZXYpOworCXN0cnVjdCBkY2JfZ3Bpb19mdW5jIGZ1bmM7CisJaW50IHJldDsK
KwlpbnQgaTsKKwogCWlmIChkbWlfY2hlY2tfc3lzdGVtKGdwaW9fcmVzZXRfaWRzKSkKIAkJbnZr
bV9ncGlvX3Jlc2V0KGdwaW8sIERDQl9HUElPX1VOVVNFRCk7CisKKwlmb3IgKGkgPSAwOyBpIDwg
QVJSQVlfU0laRShwb3dlcl9jaGVja3MpOyArK2kpIHsKKwkJcmV0ID0gbnZrbV9ncGlvX2ZpbmQo
Z3BpbywgMCwgcG93ZXJfY2hlY2tzW2ldLCBEQ0JfR1BJT19VTlVTRUQsCisJCQkJICAgICAmZnVu
Yyk7CisJCWlmIChyZXQpCisJCQljb250aW51ZTsKKworCQlyZXQgPSBudmttX2dwaW9fZ2V0KGdw
aW8sIDAsIGZ1bmMuZnVuYywgZnVuYy5saW5lKTsKKwkJaWYgKHJldCkgeworCQkJbnZrbV9lcnJv
cigmZ3Bpby0+c3ViZGV2LAorCQkJCSAgICJub3QgZW5vdWdoIHBvd2VyLCBjaGVjayBHUFUgcG93
ZXIgY2FibGVcbiIpOworCQkJcmV0dXJuIC1FSU5WQUw7CisJCX0KKwl9CisKIAlyZXR1cm4gMDsK
IH0KIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
