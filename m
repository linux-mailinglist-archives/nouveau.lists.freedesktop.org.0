Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 813671D0EE
	for <lists+nouveau@lfdr.de>; Tue, 14 May 2019 22:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64E1892D4;
	Tue, 14 May 2019 20:57:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB87892D2;
 Tue, 14 May 2019 20:57:05 +0000 (UTC)
Received: from cpc129250-craw9-2-0-cust139.know.cable.virginm.net
 ([82.43.126.140] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hQeTu-0002fC-Bd; Tue, 14 May 2019 20:57:02 +0000
From: Colin King <colin.king@canonical.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Tue, 14 May 2019 21:57:01 +0100
Message-Id: <20190514205701.5750-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] drm/nouveau/bios/init: fix spelling mistake
 "CONDITON" -> "CONDITION"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGlz
IGEgc3BlbGxpbmcgbWlzdGFrZSBpbiBhIHdhcm5pbmcgbWVzc2FnZS4gRml4IGl0LgoKU2lnbmVk
LW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iaW9zL2luaXQuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9pbml0LmMKaW5kZXggZWMwZTlmNzIy
NGI1Li4zZjRmMjdkMTkxYWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L2Jpb3MvaW5pdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
c3ViZGV2L2Jpb3MvaW5pdC5jCkBAIC04MzQsNyArODM0LDcgQEAgaW5pdF9nZW5lcmljX2NvbmRp
dGlvbihzdHJ1Y3QgbnZiaW9zX2luaXQgKmluaXQpCiAJCWluaXRfZXhlY19zZXQoaW5pdCwgZmFs
c2UpOwogCQlicmVhazsKIAlkZWZhdWx0OgotCQl3YXJuKCJJTklUX0dFTkVSSUNfQ09ORElUT046
IHVua25vd24gMHglMDJ4XG4iLCBjb25kKTsKKwkJd2FybigiSU5JVF9HRU5FUklDX0NPTkRJVElP
TjogdW5rbm93biAweCUwMnhcbiIsIGNvbmQpOwogCQlpbml0LT5vZmZzZXQgKz0gc2l6ZTsKIAkJ
YnJlYWs7CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXU=
