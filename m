Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C560C07D2
	for <lists+nouveau@lfdr.de>; Fri, 27 Sep 2019 16:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692216EF05;
	Fri, 27 Sep 2019 14:44:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94EB6EEFE
 for <nouveau@lists.freedesktop.org>; Fri, 27 Sep 2019 14:44:26 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 37A71C028320
 for <nouveau@lists.freedesktop.org>; Fri, 27 Sep 2019 14:44:26 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id v18so1121669wro.16
 for <nouveau@lists.freedesktop.org>; Fri, 27 Sep 2019 07:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tKJlXVu+C+SUSWhFcHR/cVLK3eVfpegwLk/6ZeTU4Lw=;
 b=gwP9ql8ztEc7i2+kIvg9T4xKu1LiipnOaSA2nD4glZC9kACk4f9ipgeHe2pt73w9E3
 T5bHX7lHK36zz34AgdkiEWZ6yciGMOEtt7b9rrapIHckjLT3ohnzF36BFR5IkeOmPecd
 VmAfXXNqyZ4j+LItDmSxzHEaqrVa9hGZHXFux5brLDrwooj/vWENta92QejixBAs7G+O
 +ypOStG7SOKfQYoePaVMeX5V+mTmP9LLO9dSlfr6uKbOzVDh/AApJhkJQsaOZYRztz/x
 Goa6V2T+jpO7VI3YpoWQNkB/2IKpriihwqpbdbxaoq7HpnBWo8C/RRloCzckRSpevW+U
 U6vQ==
X-Gm-Message-State: APjAAAWDNMuI1wPMmBVWnwPTCPFlx6WrR6lsM95QYFp8MO9OoNvUTZB7
 pIUly+ZmaE6hc/XyDhN+/SNCt2F45rUs7qWU6WOvmJr322JjuZqL3445VYVWDsVbYyFx7A3ZsQz
 DQsq9g44+b2smPrbUdw9lOQzcsg==
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr395781wmb.23.1569595464975;
 Fri, 27 Sep 2019 07:44:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxC2IYP1DXa/fMg1u9ig7ZhBeyIkZ56QIfJYKHZiecxua/UDg6iVgqlCp0MKwat0LoPX/Jjxg==
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr395767wmb.23.1569595464744;
 Fri, 27 Sep 2019 07:44:24 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:6174:20eb:3f66:382f])
 by smtp.gmail.com with ESMTPSA id e18sm4580926wrv.63.2019.09.27.07.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 07:44:23 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 27 Sep 2019 16:44:21 +0200
Message-Id: <20190927144421.22608-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [RFC PATCH] pci: prevent putting pcie devices into lower
 device states on certain intel bridges
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
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4ZXMgcnVucG0gYnJlYWthZ2UgbWFpbmx5IG9uIE52aWRpYSBHUFVzIGFzIHRoZXkgYXJlIG5v
dCBhYmxlIHRvIHJlc3VtZS4KCldvcmtzIHBlcmZlY3RseSB3aXRoIHRoaXMgd29ya2Fyb3VuZCBh
cHBsaWVkLgoKUkZDIGNvbW1lbnQ6CldlIGFyZSBxdWl0ZSBzdXJlIHRoYXQgdGhlcmUgaXMgYSBo
aWdoZXIgYW1vdW50IG9mIGJyaWRnZXMgYWZmZWN0ZWQgYnkgdGhpcywKYnV0IEkgd2FzIG9ubHkg
dGVzdGluZyBpdCBvbiBteSBvd24gbWFjaGluZSBmb3Igbm93LgoKSSd2ZSBzdHJlc3N0ZXN0ZWQg
cnVucG0gYnkgZG9pbmcgNTAwMCBydW5wbSBjeWNsZXMgd2l0aCB0aGF0IHBhdGNoIGFwcGxpZWQK
YW5kIG5ldmVyIHNhdyBpdCBmYWlsLgoKSSBtYWlubHkgd2FudGVkIHRvIGdldCBhIGRpc2N1c3Np
b24gZ29pbmcgb24gaWYgdGhhdCdzIGEgZmVhc2FibGUgd29ya2Fyb3VuZAppbmRlZWQgb3IgaWYg
d2UgbmVlZCBzb21ldGhpbmcgYmV0dGVyLgoKSSBhbSBhbHNvIHN1cmUsIHRoYXQgdGhlIG5vdXZl
YXUgZHJpdmVyIGl0c2VsZiBpc24ndCBhdCBmYXVsdCBhcyBJIGFtIGFibGUKdG8gcmVwcm9kdWNl
IHRoZSBzYW1lIGlzc3VlIGJ5IHBva2luZyBpbnRvIHNvbWUgUENJIHJlZ2lzdGVycyBvbiB0aGUg
UENJZQpicmlkZ2UgdG8gcHV0IHRoZSBHUFUgaW50byBEM2NvbGQgYXMgaXQncyBkb25lIGluIEFD
UEkgY29kZS4KCkkndmUgd3JpdHRlbiBhIGxpdHRsZSBweXRob24gc2NyaXB0IHRvIHJlcHJvZHVj
ZSB0aGlzIGlzc3VlIHdpdGhvdXQgdGhlIG5lZWQKb2YgbG9hZGluZyBub3V2ZWF1OgpodHRwczov
L3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20va2Fyb2xoZXJic3QvcGNpLXN0dWItcnVucG0vbWFz
dGVyL252X3J1bnBtX2J1Z190ZXN0LnB5CgpTaWduZWQtb2ZmLWJ5OiBLYXJvbCBIZXJic3QgPGto
ZXJic3RAcmVkaGF0LmNvbT4KQ2M6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+
CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogbGludXgtcGNpQHZnZXIua2Vy
bmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2ZXJzL3BjaS9wY2kuYyB8IDM5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM5IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2kuYyBiL2RyaXZlcnMvcGNpL3Bj
aS5jCmluZGV4IDA4OGZjZGM4ZDJiNC4uOWRiZDI5Y2VkMWFjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3BjaS9wY2kuYworKysgYi9kcml2ZXJzL3BjaS9wY2kuYwpAQCAtNzk5LDYgKzc5OSw0MiBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgcGxhdGZvcm1fcGNpX2JyaWRnZV9kMyhzdHJ1Y3QgcGNpX2RldiAq
ZGV2KQogCXJldHVybiBwY2lfcGxhdGZvcm1fcG0gPyBwY2lfcGxhdGZvcm1fcG0tPmJyaWRnZV9k
MyhkZXYpIDogZmFsc2U7CiB9CiAKKy8qCisgKiBzb21lIGludGVsIGJyaWRnZXMgY2F1c2Ugc2Vy
aW91cyBpc3N1ZXMgd2l0aCBydW5wbSBpZiB0aGUgY2xpZW50IGRldmljZQorICogaXMgcHV0IGlu
dG8gRDEvRDIvRDNob3QgYmVmb3JlIHB1dHRpbmcgdGhlIGNsaWVudCBpbnRvIEQzY29sZCB2aWEK
KyAqIHBsYXRmb3JtIG1lYW5zIChnZW5lcmFsbHkgQUNQSSkuCisgKgorICogc2tpcHBpbmcgdGhp
cyBtYWtlcyBydW5wbSB3b3JrIHBlcmZlY3RseSBmaW5lIG9uIHN1Y2ggZGV2aWNlcy4KKyAqCisg
KiBBcyBmYXIgYXMgd2Uga25vdyBvbmx5IHNreWxha2UgYW5kIGthYnkgbGFrZSBTb0NzIGFyZSBh
ZmZlY3RlZC4KKyAqLworc3RhdGljIHVuc2lnbmVkIHNob3J0IGludGVsX2Jyb2tlbl9kM19icmlk
Z2VzW10gPSB7CisJLyoga2JsICovCisJMHgxOTAxLAorfTsKKworc3RhdGljIGlubGluZSBib29s
IGludGVsX2Jyb2tlbl9wY2lfcG0oc3RydWN0IHBjaV9idXMgKmJ1cykKK3sKKwlzdHJ1Y3QgcGNp
X2RldiAqYnJpZGdlOworCWludCBpOworCisJaWYgKCFidXMgfHwgIWJ1cy0+c2VsZikKKwkJcmV0
dXJuIGZhbHNlOworCisJYnJpZGdlID0gYnVzLT5zZWxmOworCWlmIChicmlkZ2UtPnZlbmRvciAh
PSBQQ0lfVkVORE9SX0lEX0lOVEVMKQorCQlyZXR1cm4gZmFsc2U7CisKKwlmb3IgKGkgPSAwOyBp
IDwgQVJSQVlfU0laRShpbnRlbF9icm9rZW5fZDNfYnJpZGdlcyk7IGkrKykgeworCQlpZiAoYnJp
ZGdlLT5kZXZpY2UgPT0gaW50ZWxfYnJva2VuX2QzX2JyaWRnZXNbaV0pIHsKKwkJCXBjaV9lcnIo
YnJpZGdlLCAiZm91bmQgYnJva2VuIGludGVsIGJyaWRnZVxuIik7CisJCQlyZXR1cm4gdHJ1ZTsK
KwkJfQorCX0KKworCXJldHVybiBmYWxzZTsKK30KKwogLyoqCiAgKiBwY2lfcmF3X3NldF9wb3dl
cl9zdGF0ZSAtIFVzZSBQQ0kgUE0gcmVnaXN0ZXJzIHRvIHNldCB0aGUgcG93ZXIgc3RhdGUgb2YK
ICAqCQkJICAgICBnaXZlbiBQQ0kgZGV2aWNlCkBAIC04MjcsNiArODYzLDkgQEAgc3RhdGljIGlu
dCBwY2lfcmF3X3NldF9wb3dlcl9zdGF0ZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBwY2lfcG93ZXJf
dCBzdGF0ZSkKIAlpZiAoc3RhdGUgPCBQQ0lfRDAgfHwgc3RhdGUgPiBQQ0lfRDNob3QpCiAJCXJl
dHVybiAtRUlOVkFMOwogCisJaWYgKHN0YXRlICE9IFBDSV9EMCAmJiBpbnRlbF9icm9rZW5fcGNp
X3BtKGRldi0+YnVzKSkKKwkJcmV0dXJuIDA7CisKIAkvKgogCSAqIFZhbGlkYXRlIGN1cnJlbnQg
c3RhdGU6CiAJICogQ2FuIGVudGVyIEQwIGZyb20gYW55IHN0YXRlLCBidXQgaWYgd2UgY2FuIG9u
bHkgZ28gZGVlcGVyCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQ==
