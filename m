Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F44D536C
	for <lists+nouveau@lfdr.de>; Sun, 13 Oct 2019 02:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AFC6E0E8;
	Sun, 13 Oct 2019 00:27:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F74A6E0E8
 for <nouveau@lists.freedesktop.org>; Sun, 13 Oct 2019 00:27:21 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m15so19714212qtq.2
 for <nouveau@lists.freedesktop.org>; Sat, 12 Oct 2019 17:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=S2oNk0Mf0vX1AMvMMllaciCGOd4nSh0hZGzcab8dNZI=;
 b=iZCc/MEi6D/IRYyRn2pDlzGOv0GOP1QZsdn170lIqKWzW371SSKnKWr468MJBf7mnH
 5T7t28oAPhJEu7KfcbCwx3pm/wuV43ODOBX38L8RQtiyGXXeulj/xdoueHFxsTJt4oQC
 pkzj7ZCySRTXX+VxOEumDpNQH5wm77b/djhwHteN+3GUJTZlK9u8LDyACiYy6fQ5Wlz1
 0aIzxAU4s04t9GXg0Lw3qrP2PcDrHda4ASNpdIbHMQUvek0OcXWKXMM52KJG0VLA2msz
 mIX01pCaRL1znm/4MPLSUdvLGPOIKv79AHSoICQwPVFs87qm4DKAhV4TMvjiReYJJfL0
 Ur8g==
X-Gm-Message-State: APjAAAWmgLE4a++HxLo49MIhBynMu36q5C4pXOB1w201k79ZatclMrKU
 nyq7zVid9RbPZcUh3dxI0Lp3qlg8G/8=
X-Google-Smtp-Source: APXvYqzVf2FNiFj0SQYwJ3WJyn4+BKN0nRyIGghWBqvDTZtacbR1ttMD8Q85nscc9a3sbpkZ6VtQCQ==
X-Received: by 2002:a0c:95a5:: with SMTP id s34mr6347747qvs.72.1570926439377; 
 Sat, 12 Oct 2019 17:27:19 -0700 (PDT)
Received: from athos.fios-router.home
 (pool-173-68-201-69.nycmny.fios.verizon.net. [173.68.201.69])
 by smtp.gmail.com with ESMTPSA id m19sm6325324qke.22.2019.10.12.17.27.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Oct 2019 17:27:18 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: nouveau@lists.freedesktop.org
Date: Sat, 12 Oct 2019 20:27:17 -0400
Message-Id: <20191013002717.3678-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S2oNk0Mf0vX1AMvMMllaciCGOd4nSh0hZGzcab8dNZI=;
 b=dbkpKBFgaDdHtbnbpzJDdkpuRkTs+mp1rX7OGdvz+D1kM/dCpX93RVlJw5n+C8gun1
 +k7g5zvxrqKY7KPXJ20Y15wbQJMK4Q3ACTN5dOat/SfcH+O2Owk1bO4BoOIEZjsl8LOt
 Bbwn/qVdnVYVbSJoREYUlwoWDfV11M+iu9tQCn/aj4OFme4i0xMXZfBLDRgLWG9qMm9D
 B8otV7lGHRuUYwYpgpI1WumTruYdn/Wfme2/SRY15gP0z7G60fk5gRUdRFySriNedHbt
 OTvRPWGjV1qUbBqtx80LsNjFijH9Of+du+9bwP2B12j1JiJYaWPzlB9zX1Hro9vwhhfR
 yNkA==
Subject: [Nouveau] [PATCH xf86-video-nouveau] dri2,
 present: move in pixmap before getting addresses
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

Rmlyc3Qgb2YgYWxsLCB3ZSB3ZXJlIG5vdCBmb3JjaW5nIHRoZSBwaXhtYXAgdG8gYmUgbW92ZWQg
aW4gYmVmb3JlCmF0dGVtcHRpbmcgdG8gcHJlc2VudCBpdC4gU2Vjb25kbHksIGluIGNlcnRhaW4g
Y29uZmlndXJhdGlvbnMsIHdlIGF2b2lkCmV2ZXIgYmFja2luZyBwaXhtYXBzIHdpdGggdnJhbSAo
aW4gR1BVcyB3aXRoIDMyTUIgb2YgVlJBTSBvciBsZXNzKS4KClRoaXMgZml4ZXMgdGhlIG9ic2Vy
dmVkIGNhc2VzIHdoZXJlIHdlIGVuZGVkIHVwIGFzc3VtaW5nIHRoYXQgYSBibyB3YXMKYmFja2lu
ZyBhIHBpeG1hcCB3aXRob3V0IGRvaW5nIHRoZSBleHBsaWNpdCBtb3ZlLWluLgoKU2lnbmVkLW9m
Zi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgotLS0KClRoaXMgZml4ZXMg
c29tZSBjcmFzaGVzIG9uIGEgTlY1IHdpdGggMzJNQiBWUkFNICsgeGZ3bTQgLS12Ymxhbms9cHJl
c2VudCwKaG93ZXZlciB0aGUgZmFpbHVyZSBtb2RlcyAoZS5nLiBwaXhtYXAgZG9lc24ndCBoYXZl
IGJhY2tpbmcpIGNhbiBoYXBwZW4KYW55d2hlcmUgSSBiZWxpZXZlLCBqdXN0IG11Y2ggbGVzcyBs
aWtlbHkuCgogc3JjL25vdXZlYXVfZHJpMi5jICAgIHwgMTggKysrKysrKysrKysrKysrLS0tCiBz
cmMvbm91dmVhdV9wcmVzZW50LmMgfCAxNSArKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zcmMvbm91
dmVhdV9kcmkyLmMgYi9zcmMvbm91dmVhdV9kcmkyLmMKaW5kZXggY2UwYTU3My4uOGMyOWVjYSAx
MDA2NDQKLS0tIGEvc3JjL25vdXZlYXVfZHJpMi5jCisrKyBiL3NyYy9ub3V2ZWF1X2RyaTIuYwpA
QCAtMjQ4LDkgKzI0OCwxMyBAQCBzdGF0aWMgdWludDY0X3QgZHJpMl9zZXF1ZW5jZTsKIHN0YXRp
YyBCb29sCiB1cGRhdGVfZnJvbnQoRHJhd2FibGVQdHIgZHJhdywgRFJJMkJ1ZmZlclB0ciBmcm9u
dCkKIHsKLQlpbnQgcjsKLQlQaXhtYXBQdHIgcGl4bWFwOworCVNjcm5JbmZvUHRyIHNjcm4gPSB4
Zjg2U2NyZWVuVG9TY3JuKGRyYXctPnBTY3JlZW4pOworCU5WUHRyIHBOdiA9IE5WUFRSKHNjcm4p
OwogCXN0cnVjdCBub3V2ZWF1X2RyaTJfYnVmZmVyICpudmJ1ZiA9IG5vdXZlYXVfZHJpMl9idWZm
ZXIoZnJvbnQpOworCXN0cnVjdCBub3V2ZWF1X2JvICpwaXhtYXBfYm87CisKKwlQaXhtYXBQdHIg
cGl4bWFwOworCWludCByOwogCiAJaWYgKGRyYXctPnR5cGUgPT0gRFJBV0FCTEVfUElYTUFQKQog
CQlwaXhtYXAgPSAoUGl4bWFwUHRyKWRyYXc7CkBAIC0yNTksOCArMjYzLDE2IEBAIHVwZGF0ZV9m
cm9udChEcmF3YWJsZVB0ciBkcmF3LCBEUkkyQnVmZmVyUHRyIGZyb250KQogCiAJcGl4bWFwLT5y
ZWZjbnQrKzsKIAorCXBOdi0+ZXhhX2ZvcmNlX2NwID0gVFJVRTsKIAlleGFNb3ZlSW5QaXhtYXAo
cGl4bWFwKTsKLQlyID0gbm91dmVhdV9ib19uYW1lX2dldChub3V2ZWF1X3BpeG1hcF9ibyhwaXht
YXApLCAmZnJvbnQtPm5hbWUpOworCXBOdi0+ZXhhX2ZvcmNlX2NwID0gRkFMU0U7CisJcGl4bWFw
X2JvID0gbm91dmVhdV9waXhtYXBfYm8ocGl4bWFwKTsKKworCWlmICghcGl4bWFwX2JvKQorCQly
ID0gLTE7CisJZWxzZQorCQlyID0gbm91dmVhdV9ib19uYW1lX2dldChwaXhtYXBfYm8sICZmcm9u
dC0+bmFtZSk7CisKIAlpZiAocikgewogCQkoKmRyYXctPnBTY3JlZW4tPkRlc3Ryb3lQaXhtYXAp
KHBpeG1hcCk7CiAJCXJldHVybiBGQUxTRTsKZGlmZiAtLWdpdCBhL3NyYy9ub3V2ZWF1X3ByZXNl
bnQuYyBiL3NyYy9ub3V2ZWF1X3ByZXNlbnQuYwppbmRleCA5MzY0NzVlLi44MTY3ZmQ4IDEwMDY0
NAotLS0gYS9zcmMvbm91dmVhdV9wcmVzZW50LmMKKysrIGIvc3JjL25vdXZlYXVfcHJlc2VudC5j
CkBAIC0xNDcsMTIgKzE0NywyNSBAQCBub3V2ZWF1X3ByZXNlbnRfZmxpcF9jaGVjayhSUkNydGNQ
dHIgcnJjcnRjLCBXaW5kb3dQdHIgd2luZG93LAogCQkJICAgUGl4bWFwUHRyIHBpeG1hcCwgQm9v
bCBzeW5jX2ZsaXApCiB7CiAJU2NybkluZm9QdHIgc2NybiA9IHhmODZTY3JlZW5Ub1Njcm4od2lu
ZG93LT5kcmF3YWJsZS5wU2NyZWVuKTsKKwlOVlB0ciBwTnYgPSBOVlBUUihzY3JuKTsKIAl4Zjg2
Q3J0Y1B0ciBjcnRjID0gcnJjcnRjLT5kZXZQcml2YXRlOworCXN0cnVjdCBub3V2ZWF1X3BpeG1h
cCAqcHJpdiA9IG5vdXZlYXVfcGl4bWFwKHBpeG1hcCk7CiAKIAlpZiAoIXNjcm4tPnZ0U2VtYSB8
fCAhZHJtbW9kZV9jcnRjX29uKGNydGMpIHx8IGNydGMtPnJvdGF0ZWREYXRhKQogCQlyZXR1cm4g
RkFMU0U7CiAKLQlyZXR1cm4gVFJVRTsKKwlpZiAoIXByaXYpIHsKKwkJLyogVGhlIHBpeG1hcCBt
YXkgbm90IGhhdmUgaGFkIGJhY2tpbmcgZm9yIGxvdy1tZW1vcnkgR1BVcywgb3IKKwkJICogaWYg
d2UgcmFuIG91dCBvZiBWUkFNLiBNYWtlIHN1cmUgaXQncyBwcm9wZXJseSBiYWNrZWQgZm9yCisJ
CSAqIGZsaXBwaW5nLgorCQkgKi8KKwkJcE52LT5leGFfZm9yY2VfY3AgPSBUUlVFOworCQlleGFN
b3ZlSW5QaXhtYXAocGl4bWFwKTsKKwkJcE52LT5leGFfZm9yY2VfY3AgPSBGQUxTRTsKKwkJcHJp
diA9IG5vdXZlYXVfcGl4bWFwKHBpeG1hcCk7CisJfQorCisJcmV0dXJuIHByaXYgPyBUUlVFIDog
RkFMU0U7CiB9CiAKIHN0YXRpYyB2b2lkCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
