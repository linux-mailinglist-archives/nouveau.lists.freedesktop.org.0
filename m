Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C253D5256
	for <lists+nouveau@lfdr.de>; Sat, 12 Oct 2019 22:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107CC6E0C9;
	Sat, 12 Oct 2019 20:18:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CAB6E0C9
 for <nouveau@lists.freedesktop.org>; Sat, 12 Oct 2019 20:18:07 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id v52so19112477qtb.8
 for <nouveau@lists.freedesktop.org>; Sat, 12 Oct 2019 13:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2RH6F8ZGw5i0FE+2u5lxtLL0iEAXSEQTzhA72fBlEuc=;
 b=VxKDkKHMX3MPQawoDVtpXaOotHkJjRa6ime+E7vM7HGCtsgMuP5JUUMbCYAQ0wOGrh
 EuNKytBH0ZoB75k9KqrkYfVBLPbvsCHbcaJSyXeg1f9CvCxW7QUzjHhJGq7cAd6j/wxG
 U9kXWXi2/qZWJzPtw5NTmfJ/XCItwB2YWbPL7IIsM29m93l4W1eL9mnEfSYTbX6r88vI
 XGPFAGh1d+u7f9nhYQkK+x/1PyAeyQ46yFB55YwTkF2xM0Mge2qfRbj0WKUZcA8m8y4d
 nOxJWwmAFetowIZ8QvvagmYa8/zXW9sll0UDeKJOq07wmB5F75nDkysNhl5kq3puOgk5
 WRnA==
X-Gm-Message-State: APjAAAXTJoDx0/FT4PQtqhvAHgAPEPdw9mU3Wcnlq2uQctt399xkCHrX
 ELAbojrNEW3rI9obqd4isc88p902hcc=
X-Google-Smtp-Source: APXvYqxagZEelWYygT0+mjV3BL/NVjcmEVrUb259V60IZNfMGTKsXdHiXudpHS2foHDhwUlTvazhmw==
X-Received: by 2002:ac8:2894:: with SMTP id i20mr24266790qti.270.1570911486194; 
 Sat, 12 Oct 2019 13:18:06 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-201-69.nycmny.fios.verizon.net. [173.68.201.69])
 by smtp.gmail.com with ESMTPSA id g33sm5810918qtd.12.2019.10.12.13.18.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Oct 2019 13:18:05 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: nouveau@lists.freedesktop.org
Date: Sat, 12 Oct 2019 16:17:55 -0400
Message-Id: <20191012201755.10940-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2RH6F8ZGw5i0FE+2u5lxtLL0iEAXSEQTzhA72fBlEuc=;
 b=EV2zcTVUz9creCjgE1eSIak/5Z9f2KeQJBxWWXEAnR9MJp4Wmr6pCMmktymd/c1URk
 RK43MAmOEM0lZM9yAfMGSgNkR/ZkIoa2oVTJW1VMfaTg1GNruu3JyuEj9BoAcuCwKSAX
 uid+yIevvzTuPCQp0CdIRv95Y4wv/EckCEDIMjE631gIfCrxLDTBTD/tCDVgb88mO+6Q
 xwj1r8jF91kZYu0UTgvWSY2k8V/j8PGqSnE8QnlP8McvjAoucmUXfDKHwqkP7U8pfin4
 4rGRajnePxn3U92y6y11SlbCZ7yDuZIa9Pm52yFBeMmXykgYDlqWMP5Xn50Oz3f8LpxL
 ELrA==
Subject: [Nouveau] [PATCH xf86-video-nouveau] nv4/exa: tiling is unsupported
 pre-nv10, reduce alignment requirements
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
Cc: =?UTF-8?q?Marcin=20Ko=C5=9Bcielnicki?= <koriakin@0x04.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Q29tbWl0IDhjOGYxNWM5ZDMgYWRkZWQgaW5jcmVhc2VkIHBpdGNoIGFsaWdubWVudCByZXF1aXJl
bWVudHMgdG8gaGFuZGxlCm52MTAtbnY0MCB0aWxpbmcgKHdoaWNoIG11c3QgaGF2ZSBhIHNtYWxs
IG51bWJlciAqIFBvVCBwaXRjaCkuIFdoaWxlCk5WNC9OVjUgZG8gaGF2ZSB0aWxpbmcsIHRoaXMg
d2FzIG5ldmVyIHN1cHBvcnRlZCBpbiBub3V2ZWF1LgoKVGhpcyBjaGFuZ2UgZW5hYmxlcyAxOTIw
eDEyMDAgcmVzb2x1dGlvbnMgc2luY2UgdGhlIG1heGltdW0gc3VyZmFjZQpwaXRjaCBoYXMgdG8g
YmUgc3RyaWN0bHkgbGVzcyB0aGFuIDgxOTIuIFRoZSBjdXJyZW50IGxvZ2ljIHdpbGwgYWxpZ24K
MTkyMCo0IHVwIHRvIDgxOTIgdW5uZWNlc3NhcmlseS4KClNpZ25lZC1vZmYtYnk6IElsaWEgTWly
a2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4KQ2M6IE1hcmNpbiBLb8WbY2llbG5pY2tpIDxrb3Jp
YWtpbkAweDA0Lm5ldD4KQ2M6IEZyYW5jaXNjbyBKZXJleiA8Y3Vycm9qZXJlekByaXNldXAubmV0
PgotLS0KIHNyYy9ub3V2ZWF1X2RyaTIuYyB8IDUgKysrKy0KIHNyYy9udl9kcml2ZXIuYyAgICB8
IDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9zcmMvbm91dmVhdV9kcmkyLmMgYi9zcmMvbm91dmVhdV9kcmkyLmMKaW5k
ZXggM2Q1Mzc4NS4uY2UwYTU3MyAxMDA2NDQKLS0tIGEvc3JjL25vdXZlYXVfZHJpMi5jCisrKyBi
L3NyYy9ub3V2ZWF1X2RyaTIuYwpAQCAtNjIsNyArNjIsMTAgQEAgbm91dmVhdV9kcmkyX2NyZWF0
ZV9idWZmZXIyKFNjcmVlblB0ciBwU2NyZWVuLCBEcmF3YWJsZVB0ciBwRHJhdywgdW5zaWduZWQg
aW50IGEKIAkJCXBwaXgtPnJlZmNudCsrOwogCX0gZWxzZSB7CiAJCWludCBicHA7Ci0JCXVuc2ln
bmVkIGludCB1c2FnZV9oaW50ID0gTk9VVkVBVV9DUkVBVEVfUElYTUFQX1RJTEVEOworCQl1bnNp
Z25lZCBpbnQgdXNhZ2VfaGludCA9IDA7CisKKwkJaWYgKHBOdi0+QXJjaGl0ZWN0dXJlID49IE5W
X0FSQ0hfMTApCisJCQl1c2FnZV9oaW50IHw9IE5PVVZFQVVfQ1JFQVRFX1BJWE1BUF9USUxFRDsK
IAogCQkvKiAnZm9ybWF0JyBpcyBqdXN0IGRlcHRoIChvciAwLCBvciBtYXliZSBpdCBkZXBlbmRz
IG9uIHRoZSBjYWxsZXIpICovCiAJCWJwcCA9IHJvdW5kX3VwX3BvdzIoZm9ybWF0ID8gZm9ybWF0
IDogcERyYXctPmRlcHRoKTsKZGlmZiAtLWdpdCBhL3NyYy9udl9kcml2ZXIuYyBiL3NyYy9udl9k
cml2ZXIuYwppbmRleCA0MmViOWRiLi5hNjM2NzRjIDEwMDY0NAotLS0gYS9zcmMvbnZfZHJpdmVy
LmMKKysrIGIvc3JjL252X2RyaXZlci5jCkBAIC0xMDgyLDcgKzEwODIsOCBAQCBOVlByZUluaXQo
U2NybkluZm9QdHIgcFNjcm4sIGludCBmbGFncykKIAkJCXBOdi0+d2ZiX2VuYWJsZWQgPSB4Zjg2
UmV0dXJuT3B0VmFsQm9vbCgKIAkJCQlwTnYtPk9wdGlvbnMsIE9QVElPTl9XRkIsIEZBTFNFKTsK
IAotCQlwTnYtPnRpbGVkX3NjYW5vdXQgPSBUUlVFOworCQlpZiAocE52LT5BcmNoaXRlY3R1cmUg
Pj0gTlZfQVJDSF8xMCkKKwkJCXBOdi0+dGlsZWRfc2Nhbm91dCA9IFRSVUU7CiAJfQogCiAJcE52
LT5jZV9lbmFibGVkID0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1
