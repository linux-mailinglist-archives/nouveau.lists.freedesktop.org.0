Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A21D107C
	for <lists+nouveau@lfdr.de>; Wed, 13 May 2020 13:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9301D6EA14;
	Wed, 13 May 2020 11:03:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E796EA0A;
 Wed, 13 May 2020 11:03:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j5so20362697wrq.2;
 Wed, 13 May 2020 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=flrIWlcxo+T8QU048u531Ya+sOmNNhchsukJ+2ShIJU=;
 b=aXZUZKwZNa3YCQi0RIK08waBtzu+AAObk2k4mO/F26ojslPgVFfLgtfzTCbYXHP39J
 9/altfk2CJtbq6SXr5YG3QE4yItUM4AZkJba0mOUFzB4zgs8xC7K2dXOi55kpq8b+KEt
 uTOAL2LpfFv4MUIg0LYw9Kt51HeqdxC55o6qITYXonYCHKgDDTCzRB+91iGxOZDCcxP7
 aeyrnQ0pWS1EBiAJQaIwHxNWdpYebINTfbaYMzgZhpAjGrsbxdoIvr8AN4ztZ0WQYYDd
 v3fZvJA/fkkZoG0BDWor1F2XRXecZ/lFYzyJ6RstCQAlY+K7NOTMxA+F2hLYllmbQ1WQ
 z30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=flrIWlcxo+T8QU048u531Ya+sOmNNhchsukJ+2ShIJU=;
 b=nONqR6boayrNIdugTmgyCnvt2wkOirGG9GRY/oL1LK33NxjNnsxi51KUvzp8j50ljU
 emstt9/x2K79k5HAxIwDdqVSq79c5sKmFkH9McsV8Jl35RNkHxVsABlhhms4eRRAxBeP
 KpyaL0DGqDYT4Uk+Bk6Fcku5fhemLfegT0Fr74/pDFoH83g12go++77FVnHbELDzGTqH
 J3DpB+/053WUNo3D7yIHFyzqiOfN1uRQUY6wspyjpaf/yvfxe5BNP/gasroPQj/6S5pE
 SDZp2BT0hkHeFeo2zuagI1W8Lu7WCo22fzcd7ywdR+Rw1ysQNVJ/cYmRjTQbIH/GIppu
 kESg==
X-Gm-Message-State: AGi0PuasZkruMb8tcy+Inv/jLUICczw1eyfh3UviiMNoXYTxxjyqTj53
 bmu7YNG+83HbGknuabsLKZk7f3uZ
X-Google-Smtp-Source: APiQypKeSrbLr6df3BCWccVKlw6qQ+obtyhTbTgr6Xgls7jLE8wudyvHn/KTQKlekk0qxVjWPC+6NQ==
X-Received: by 2002:adf:d841:: with SMTP id k1mr29785341wrl.129.1589367797713; 
 Wed, 13 May 2020 04:03:17 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:78fa:bd2b:6c37:2c35])
 by smtp.gmail.com with ESMTPSA id z3sm27806975wrm.81.2020.05.13.04.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 04:03:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, debian-powerpc@lists.debian.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Wed, 13 May 2020 13:03:13 +0200
Message-Id: <20200513110313.12979-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513110313.12979-1-christian.koenig@amd.com>
References: <20200513110313.12979-1-christian.koenig@amd.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/2] drm/ttm: deprecate AGP support
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

RXZlbiB3aGVuIGNvcmUgQUdQIHN1cHBvcnQgaXMgY29tcGlsZWQgaW4gUmFkZW9uIGFuZApOb3V2
ZWF1IGNhbiBhbHNvIHdvcmsgd2l0aCB0aGUgUENJIEdBUlQuCgpUaGUgQUdQIHN1cHBvcnQgd2Fz
IG5vdG9yaW91cyB1bnN0YWJsZSBhbmQgaGFyZCB0bwptYWludGFpbiwgc28gZGVwcmVjYXRlIGl0
IGZvciBub3cgYW5kIG9ubHkgZW5hYmxlIGl0IGlmCnRoZXJlIGlzIGEgZ29vZCByZWFzb24gdG8g
ZG8gc28uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDggKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyAg
ICAgICAgICB8ICA4ICsrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9wY2kvYWdwLmggfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYWdwLmMg
ICAgICAgICAgIHwgIDggKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0
bS5jICAgICAgICAgICB8IDEwICsrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vTWFrZWZp
bGUgICAgICAgICAgICAgICAgICB8ICAyICstCiA2IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlv
bnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9LY29u
ZmlnIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKaW5kZXggNGY0ZTdmYTAwMWMxLi41MmQ4MzQz
MDM3NjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9LY29uZmlnCkBAIC0xODIsNiArMTgyLDE0IEBAIGNvbmZpZyBEUk1fVFRNCiAJICBH
UFUgbWVtb3J5IHR5cGVzLiBXaWxsIGJlIGVuYWJsZWQgYXV0b21hdGljYWxseSBpZiBhIGRldmlj
ZSBkcml2ZXIKIAkgIHVzZXMgaXQuCiAKK2NvbmZpZyBEUk1fVFRNX0FHUAorCWJvb2wgIlRUTSBB
R1AgR0FSVCBzdXBwb3J0IChkZXByZWNhdGVkKSIKKwlkZXBlbmRzIG9uIERSTV9UVE0gJiYgQUdQ
CisJZGVmYXVsdCBuCisJaGVscAorCSAgRW5hYmxlcyBkZXByZWNhdGVkIEFHUCBHQVJUIHN1cHBv
cnQgaW4gVFRNLgorCSAgTGVzcyByZWxpYWJsZSB0aGFuIFBDSSBHQVJULCBidXQgZmFzdGVyIGlu
IHNvbWUgY2FzZXMuCisKIGNvbmZpZyBEUk1fVFRNX0RNQV9QQUdFX1BPT0wKIAlib29sCiAJZGVw
ZW5kcyBvbiBEUk1fVFRNICYmIChTV0lPVExCIHx8IElOVEVMX0lPTU1VKQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9iby5jCmluZGV4IGM0MGYxMjdkZTNkMC4uYzczZDRhZTQ4ZjVjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCkBAIC02MzUsNyArNjM1LDcgQEAgbm91dmVh
dV9ib193cjMyKHN0cnVjdCBub3V2ZWF1X2JvICpudmJvLCB1bnNpZ25lZCBpbmRleCwgdTMyIHZh
bCkKIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0ICoKIG5vdXZlYXVfdHRtX3R0X2NyZWF0ZShzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLCB1aW50MzJfdCBwYWdlX2ZsYWdzKQogewotI2lmIElTX0VO
QUJMRUQoQ09ORklHX0FHUCkKKyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fVFRNX0FHUCkKIAlz
dHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfYmRldihiby0+YmRldik7CiAKIAlpZiAo
ZHJtLT5hZ3AuYnJpZGdlKSB7CkBAIC0xNDQ4LDcgKzE0NDgsNyBAQCBub3V2ZWF1X3R0bV9pb19t
ZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgc3RydWN0IHR0bV9tZW1fcmVn
ICpyZWcpCiAJCS8qIFN5c3RlbSBtZW1vcnkgKi8KIAkJcmV0dXJuIDA7CiAJY2FzZSBUVE1fUExf
VFQ6Ci0jaWYgSVNfRU5BQkxFRChDT05GSUdfQUdQKQorI2lmIElTX0VOQUJMRUQoQ09ORklHX0RS
TV9UVE1fQUdQKQogCQlpZiAoZHJtLT5hZ3AuYnJpZGdlKSB7CiAJCQlyZWctPmJ1cy5vZmZzZXQg
PSByZWctPnN0YXJ0IDw8IFBBR0VfU0hJRlQ7CiAJCQlyZWctPmJ1cy5iYXNlID0gZHJtLT5hZ3Au
YmFzZTsKQEAgLTE2MDMsNyArMTYwMyw3IEBAIG5vdXZlYXVfdHRtX3R0X3BvcHVsYXRlKHN0cnVj
dCB0dG1fdHQgKnR0bSwgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpCiAJZHJtID0gbm91
dmVhdV9iZGV2KHR0bS0+YmRldik7CiAJZGV2ID0gZHJtLT5kZXYtPmRldjsKIAotI2lmIElTX0VO
QUJMRUQoQ09ORklHX0FHUCkKKyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fVFRNX0FHUCkKIAlp
ZiAoZHJtLT5hZ3AuYnJpZGdlKSB7CiAJCXJldHVybiB0dG1fYWdwX3R0X3BvcHVsYXRlKHR0bSwg
Y3R4KTsKIAl9CkBAIC0xNjU2LDcgKzE2NTYsNyBAQCBub3V2ZWF1X3R0bV90dF91bnBvcHVsYXRl
KHN0cnVjdCB0dG1fdHQgKnR0bSkKIAlkcm0gPSBub3V2ZWF1X2JkZXYodHRtLT5iZGV2KTsKIAlk
ZXYgPSBkcm0tPmRldi0+ZGV2OwogCi0jaWYgSVNfRU5BQkxFRChDT05GSUdfQUdQKQorI2lmIElT
X0VOQUJMRUQoQ09ORklHX0RSTV9UVE1fQUdQKQogCWlmIChkcm0tPmFncC5icmlkZ2UpIHsKIAkJ
dHRtX2FncF90dF91bnBvcHVsYXRlKHR0bSk7CiAJCXJldHVybjsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9hZ3AuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9hZ3AuaAppbmRleCBhZDRkMzYyMWQwMmIuLmQ1NzI1
MjhkYTg1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
cGNpL2FncC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9h
Z3AuaApAQCAtMSw2ICsxLDYgQEAKIC8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8K
ICNpbmNsdWRlICJwcml2LmgiCi0jaWYgZGVmaW5lZChDT05GSUdfQUdQKSB8fCAoZGVmaW5lZChD
T05GSUdfQUdQX01PRFVMRSkgJiYgZGVmaW5lZChNT0RVTEUpKQorI2lmIGRlZmluZWQoQ09ORklH
X0RSTV9UVE1fQUdQKQogI2lmbmRlZiBfX05WS01fUENJX0FHUF9IX18KICNkZWZpbmUgX19OVktN
X1BDSV9BR1BfSF9fCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2FncC5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYWdwLmMKaW5kZXggMGFjYTdi
ZGY1NGM3Li4yOTRkMTkzMDE3MDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2FncC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2FncC5jCkBA
IC0zMyw3ICszMyw3IEBACiAKICNpbmNsdWRlICJyYWRlb24uaCIKIAotI2lmIElTX0VOQUJMRUQo
Q09ORklHX0FHUCkKKyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fVFRNX0FHUCkKIAogc3RydWN0
IHJhZGVvbl9hZ3Btb2RlX3F1aXJrIHsKIAl1MzIgaG9zdGJyaWRnZV92ZW5kb3I7CkBAIC0xMzEs
NyArMTMxLDcgQEAgc3RhdGljIHN0cnVjdCByYWRlb25fYWdwbW9kZV9xdWlyayByYWRlb25fYWdw
bW9kZV9xdWlya19saXN0W10gPSB7CiAKIGludCByYWRlb25fYWdwX2luaXQoc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYpCiB7Ci0jaWYgSVNfRU5BQkxFRChDT05GSUdfQUdQKQorI2lmIElTX0VO
QUJMRUQoQ09ORklHX0RSTV9UVE1fQUdQKQogCXN0cnVjdCByYWRlb25fYWdwbW9kZV9xdWlyayAq
cCA9IHJhZGVvbl9hZ3Btb2RlX3F1aXJrX2xpc3Q7CiAJc3RydWN0IGRybV9hZ3BfbW9kZSBtb2Rl
OwogCXN0cnVjdCBkcm1fYWdwX2luZm8gaW5mbzsKQEAgLTI2NSw3ICsyNjUsNyBAQCBpbnQgcmFk
ZW9uX2FncF9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCiB2b2lkIHJhZGVvbl9h
Z3BfcmVzdW1lKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogewotI2lmIElTX0VOQUJMRUQo
Q09ORklHX0FHUCkKKyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fVFRNX0FHUCkKIAlpbnQgcjsK
IAlpZiAocmRldi0+ZmxhZ3MgJiBSQURFT05fSVNfQUdQKSB7CiAJCXIgPSByYWRlb25fYWdwX2lu
aXQocmRldik7CkBAIC0yNzcsNyArMjc3LDcgQEAgdm9pZCByYWRlb25fYWdwX3Jlc3VtZShzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldikKIAogdm9pZCByYWRlb25fYWdwX2Zpbmkoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpCiB7Ci0jaWYgSVNfRU5BQkxFRChDT05GSUdfQUdQKQorI2lmIElT
X0VOQUJMRUQoQ09ORklHX0RSTV9UVE1fQUdQKQogCWlmIChyZGV2LT5kZGV2LT5hZ3AgJiYgcmRl
di0+ZGRldi0+YWdwLT5hY3F1aXJlZCkgewogCQlkcm1fYWdwX3JlbGVhc2UocmRldi0+ZGRldik7
CiAJfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwppbmRleCA1ZDUwYzllZGJlODAuLjRm
OWM0ZTVmODI2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKQEAgLTg2LDcgKzg2
LDcgQEAgc3RhdGljIGludCByYWRlb25faW5pdF9tZW1fdHlwZShzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwgdWludDMyX3QgdHlwZSwKIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9Q
TF9NQVNLX0NBQ0hJTkc7CiAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FD
SEVEOwogCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRSB8IFRUTV9NRU1U
WVBFX0ZMQUdfQ01BOwotI2lmIElTX0VOQUJMRUQoQ09ORklHX0FHUCkKKyNpZiBJU19FTkFCTEVE
KENPTkZJR19EUk1fVFRNX0FHUCkKIAkJaWYgKHJkZXYtPmZsYWdzICYgUkFERU9OX0lTX0FHUCkg
ewogCQkJaWYgKCFyZGV2LT5kZGV2LT5hZ3ApIHsKIAkJCQlEUk1fRVJST1IoIkFHUCBpcyBub3Qg
ZW5hYmxlZCBmb3IgbWVtb3J5IHR5cGUgJXVcbiIsCkBAIC00MTEsNyArNDExLDcgQEAgc3RhdGlj
IGludCByYWRlb25fdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2
LCBzdHJ1Y3QgdHRtX21lbV8KIAkJLyogc3lzdGVtIG1lbW9yeSAqLwogCQlyZXR1cm4gMDsKIAlj
YXNlIFRUTV9QTF9UVDoKLSNpZiBJU19FTkFCTEVEKENPTkZJR19BR1ApCisjaWYgSVNfRU5BQkxF
RChDT05GSUdfRFJNX1RUTV9BR1ApCiAJCWlmIChyZGV2LT5mbGFncyAmIFJBREVPTl9JU19BR1Ap
IHsKIAkJCS8qIFJBREVPTl9JU19BR1AgaXMgc2V0IG9ubHkgaWYgQUdQIGlzIGFjdGl2ZSAqLwog
CQkJbWVtLT5idXMub2Zmc2V0ID0gbWVtLT5zdGFydCA8PCBQQUdFX1NISUZUOwpAQCAtNjMxLDcg
KzYzMSw3IEBAIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0ICpyYWRlb25fdHRtX3R0X2NyZWF0ZShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXN0cnVjdCByYWRlb25fdHRtX3R0ICpndHQ7CiAK
IAlyZGV2ID0gcmFkZW9uX2dldF9yZGV2KGJvLT5iZGV2KTsKLSNpZiBJU19FTkFCTEVEKENPTkZJ
R19BR1ApCisjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX1RUTV9BR1ApCiAJaWYgKHJkZXYtPmZs
YWdzICYgUkFERU9OX0lTX0FHUCkgewogCQlyZXR1cm4gdHRtX2FncF90dF9jcmVhdGUoYm8sIHJk
ZXYtPmRkZXYtPmFncC0+YnJpZGdlLAogCQkJCQkgcGFnZV9mbGFncyk7CkBAIC02ODMsNyArNjgz
LDcgQEAgc3RhdGljIGludCByYWRlb25fdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fdHQgKnR0
bSwKIAl9CiAKIAlyZGV2ID0gcmFkZW9uX2dldF9yZGV2KHR0bS0+YmRldik7Ci0jaWYgSVNfRU5B
QkxFRChDT05GSUdfQUdQKQorI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9UVE1fQUdQKQogCWlm
IChyZGV2LT5mbGFncyAmIFJBREVPTl9JU19BR1ApIHsKIAkJcmV0dXJuIHR0bV9hZ3BfdHRfcG9w
dWxhdGUodHRtLCBjdHgpOwogCX0KQEAgLTcxNCw3ICs3MTQsNyBAQCBzdGF0aWMgdm9pZCByYWRl
b25fdHRtX3R0X3VucG9wdWxhdGUoc3RydWN0IHR0bV90dCAqdHRtKQogCQlyZXR1cm47CiAKIAly
ZGV2ID0gcmFkZW9uX2dldF9yZGV2KHR0bS0+YmRldik7Ci0jaWYgSVNfRU5BQkxFRChDT05GSUdf
QUdQKQorI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9UVE1fQUdQKQogCWlmIChyZGV2LT5mbGFn
cyAmIFJBREVPTl9JU19BR1ApIHsKIAkJdHRtX2FncF90dF91bnBvcHVsYXRlKHR0bSk7CiAJCXJl
dHVybjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vTWFrZWZpbGUgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL01ha2VmaWxlCmluZGV4IGNhZWEyYTA5OTQ5Ni4uYWE3NzJiMTk4MDEyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vTWFrZWZpbGUKQEAgLTUsNyArNSw3IEBACiB0dG0teSA6PSB0dG1fbWVtb3J5Lm8g
dHRtX3R0Lm8gdHRtX2JvLm8gXAogCXR0bV9ib191dGlsLm8gdHRtX2JvX3ZtLm8gdHRtX21vZHVs
ZS5vIFwKIAl0dG1fZXhlY2J1Zl91dGlsLm8gdHRtX3BhZ2VfYWxsb2MubyB0dG1fYm9fbWFuYWdl
ci5vCi10dG0tJChDT05GSUdfQUdQKSArPSB0dG1fYWdwX2JhY2tlbmQubwordHRtLSQoQ09ORklH
X0RSTV9UVE1fQUdQKSArPSB0dG1fYWdwX2JhY2tlbmQubwogdHRtLSQoQ09ORklHX0RSTV9UVE1f
RE1BX1BBR0VfUE9PTCkgKz0gdHRtX3BhZ2VfYWxsb2NfZG1hLm8KIAogb2JqLSQoQ09ORklHX0RS
TV9UVE0pICs9IHR0bS5vCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbm91dmVhdQo=
