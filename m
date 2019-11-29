Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C48D610D867
	for <lists+nouveau@lfdr.de>; Fri, 29 Nov 2019 17:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0F16E937;
	Fri, 29 Nov 2019 16:28:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA9D6E937;
 Fri, 29 Nov 2019 16:28:34 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iaj88-0000bz-Lk; Fri, 29 Nov 2019 16:28:28 +0000
From: Colin King <colin.king@canonical.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ralph Campbell <rcampbell@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Fri, 29 Nov 2019 16:28:28 +0000
Message-Id: <20191129162828.84570-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] nouveau: fix incorrect sizeof on args.src an
 args.dst
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBzaXpl
b2YgaXMgY3VycmVudGx5IG9uIGFyZ3Muc3JjIGFuZCBhcmdzLmRzdCBhbmQgc2hvdWxkIGJlIG9u
CiphcmdzLnNyYyBhbmQgKmFyZ3MuZHN0LiBGb3J0dW5hdGVseSB0aGVzZSBzaXplcyBqdXN0IHNv
IGhhcHBlbgp0byBiZSB0aGUgc2FtZSBzaXplIHNvIGl0IHdvcmtlZCwgaG93ZXZlciwgdGhpcyBz
aG91bGQgYmUgZml4ZWQKYW5kIGl0IGFsc28gY2xlYW5zIHVwIHN0YXRpYyBhbmFseXNpcyB3YXJu
aW5ncwoKQWRkcmVzc2VzLUNvdmVyaXR5OiAoInNpemVvZiBub3QgcG9ydGFibGUiKQpGaXhlczog
ZjI2ODMwN2VjN2M3ICgibm91dmVhdTogc2ltcGxpZnkgbm91dmVhdV9kbWVtX21pZ3JhdGVfdm1h
IikKU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCmluZGV4IGZhMTQzOTk0MTU5Ni4uMGFkNWQ4N2I1
YThlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwpAQCAtNjM1LDEwICs2
MzUsMTAgQEAgbm91dmVhdV9kbWVtX21pZ3JhdGVfdm1hKHN0cnVjdCBub3V2ZWF1X2RybSAqZHJt
LAogCXVuc2lnbmVkIGxvbmcgYywgaTsKIAlpbnQgcmV0ID0gLUVOT01FTTsKIAotCWFyZ3Muc3Jj
ID0ga2NhbGxvYyhtYXgsIHNpemVvZihhcmdzLnNyYyksIEdGUF9LRVJORUwpOworCWFyZ3Muc3Jj
ID0ga2NhbGxvYyhtYXgsIHNpemVvZigqYXJncy5zcmMpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWFy
Z3Muc3JjKQogCQlnb3RvIG91dDsKLQlhcmdzLmRzdCA9IGtjYWxsb2MobWF4LCBzaXplb2YoYXJn
cy5kc3QpLCBHRlBfS0VSTkVMKTsKKwlhcmdzLmRzdCA9IGtjYWxsb2MobWF4LCBzaXplb2YoKmFy
Z3MuZHN0KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFhcmdzLmRzdCkKIAkJZ290byBvdXRfZnJlZV9z
cmM7CiAKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
