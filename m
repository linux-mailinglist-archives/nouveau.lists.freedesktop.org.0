Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE447311344
	for <lists+nouveau@lfdr.de>; Fri,  5 Feb 2021 22:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6466F4D5;
	Fri,  5 Feb 2021 21:18:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F106D6F4D5
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 21:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612559917;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBS3myudFs4g2EeCLNUzGEZSzqxQP1tobXizBrU7EaA=;
 b=Ba/iG11R6z5ug0dcVeJatqT6WhHi1TXie7qGgHTrQva/Eux6iLPcgdtNEX9REHmzHR6wTl
 I0dxXfLKnmvCbx3yxynqMcWgVD6KWyRSoL005DVgf3JohrO4zoPkZOiiSJFs7my3dYo3g2
 kBm/6TUzFvULOubLjyu8UbjfOKd69BY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-Nbn3EwMwOXidXta9bfixcw-1; Fri, 05 Feb 2021 16:18:36 -0500
X-MC-Unique: Nbn3EwMwOXidXta9bfixcw-1
Received: by mail-qv1-f71.google.com with SMTP id l3so6005759qvz.12
 for <nouveau@lists.freedesktop.org>; Fri, 05 Feb 2021 13:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=vBS3myudFs4g2EeCLNUzGEZSzqxQP1tobXizBrU7EaA=;
 b=Y7o+2umAPDHhF3I+FkVfAs7e8NV2K0bAQvvMFEa6SxFi4+9Q4dZX5YXUFGiwl+Auy5
 BpJZjTbeFkxNeaheHTmSRPVnp7iWaSyVeeVeBXvnCFle4k3AyuAxNqSBUlXo84duJb/H
 0N9zvWKZuPrmUOt3KJyJdZTHJ9c2evwmufqF1REJIH3aKyjO91gA/tIMw63rOW5nzYE8
 JIrqK+saO0HsgDKvhzjNT2krfxX66FVHf5bODmM6afBLFepqZiOwVyvrbjI2GjM0MYWW
 7O8ceEc0Mt8PP7yslKdixzapcRMKz7lEERb6QPjmHsm7o8jJ+eFtDW6aOloFanxfThtq
 wDQw==
X-Gm-Message-State: AOAM532oeVk7Jg6tTfVMpdbjdbjcbYslSaGD6p3VlbXZm8OIPCpBSCUj
 XG+NsNbxPPJGOV+mI3P+PpjeBxRyQckcqq6JEKe04gEpbViawKj+IVGzI5hvOtPmDjPyHI5LjZA
 gW1PFb2GGihftoJEupWYhVZMyGw==
X-Received: by 2002:a37:544:: with SMTP id 65mr6260226qkf.407.1612559914936;
 Fri, 05 Feb 2021 13:18:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1VSgDx4eAFpOatlXWpsnMEKcgUzoVsKLhwjApgu/EmIVIPt+osn2imsEhvz4+bbIqlNHFbw==
X-Received: by 2002:a37:544:: with SMTP id 65mr6260219qkf.407.1612559914789;
 Fri, 05 Feb 2021 13:18:34 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id k190sm10876047qke.10.2021.02.05.13.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 13:18:34 -0800 (PST)
Message-ID: <d61cece3230a5e3a16612655a7571bfa7626daba.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Simon Ser <contact@emersion.fr>, nouveau@lists.freedesktop.org
Date: Fri, 05 Feb 2021 16:18:33 -0500
In-Reply-To: <20210205210044.2665-1-contact@emersion.fr>
References: <20210205210044.2665-1-contact@emersion.fr>
Organization: Red Hat
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH v2] nouveau/dispnv50: add cursor pitch check
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
Reply-To: lyude@redhat.com
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTAyLTA1IGF0IDIyOjAwICswMTAwLCBTaW1vbiBTZXIgd3JvdGU6Cj4gVGhl
IGhhcmR3YXJlIG5lZWRzIGEgRkIgd2hpY2ggaXMgcGFja2VkLiBBZGQgY2hlY2tzIHRvIG1ha2Ug
c3VyZQo+IHRoaXMgaXMgdGhlIGNhc2UuCj4gCj4gV2hpbGUgYXQgaXQsIGFkZCBkZWJ1ZyBsb2dz
IGZvciB0aGUgZXhpc3RpbmcgY2hlY2tzLiBUaGlzIGFsbG93cwo+IHVzZXItc3BhY2UgdG8gbW9y
ZSBlYXNpbHkgZmlndXJlIG91dCB3aHkgYSBjb25maWd1cmF0aW9uIGlzCj4gcmVqZWN0ZWQuCj4g
Cj4gdjI6Cj4gLSBVc2UgZHJtX2Zvcm1hdF9pbmZvIGluc3RlYWQgb2YgaGFyZGNvZGluZyBieXRl
cy1wZXItcGl4ZWwgKElsaWEpCj4gLSBSZW1vdmUgdW5uZWNlc3Nhcnkgc2l6ZSBjaGVjayAoSWxp
YSkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+Cj4g
Q2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gQ2M6IEJlbiBTa2VnZ3MgPGJza2Vn
Z3NAcmVkaGF0LmNvbT4KPiBDYzogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1Pgo+
IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3VyczUwN2EuYyB8IDIx
ICsrKysrKysrKysrKysrKysrKystLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L2Rpc3BudjUwL2N1cnM1MDdhLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djUwL2N1cnM1MDdhLmMKPiBpbmRleCA1NGZiZDZmZTc1MWQuLjAwZjA5YzlhOGQxNSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jdXJzNTA3YS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3VyczUwN2EuYwo+IEBAIC0zMCw2
ICszMCw3IEBACj4gwqAKPiDCoCNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KPiDC
oCNpbmNsdWRlIDxkcm0vZHJtX3BsYW5lX2hlbHBlci5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9m
b3VyY2MuaD4KPiDCoAo+IMKgYm9vbAo+IMKgY3VyczUwN2Ffc3BhY2Uoc3RydWN0IG52NTBfd25k
dyAqd25kdykKPiBAQCAtOTksNiArMTAwLDggQEAgY3VyczUwN2FfYWNxdWlyZShzdHJ1Y3QgbnY1
MF93bmR3ICp3bmR3LCBzdHJ1Y3QKPiBudjUwX3duZHdfYXRvbSAqYXN5dywKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbnY1MF9oZWFkX2F0b20gKmFzeWgpCj4gwqB7
Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBudjUwX2hlYWQgKmhlYWQgPSBudjUwX2hlYWQoYXN5
dy0+c3RhdGUuY3J0Yyk7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9
IGhlYWQtPmJhc2UuYmFzZS5kZXY7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9mcmFtZWJ1
ZmZlciAqZmIgPSBhc3l3LT5zdGF0ZS5mYjsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiDC
oAo+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVja19wbGFuZV9z
dGF0ZSgmYXN5dy0+c3RhdGUsICZhc3loLT5zdGF0ZSwKPiBAQCAtMTA5LDEyICsxMTIsMjYgQEAg
Y3VyczUwN2FfYWNxdWlyZShzdHJ1Y3QgbnY1MF93bmR3ICp3bmR3LCBzdHJ1Y3QKPiBudjUwX3du
ZHdfYXRvbSAqYXN5dywKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCB8fCAhYXN5aC0+Y3Vycy52
aXNpYmxlKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDC
oAo+IC3CoMKgwqDCoMKgwqDCoGlmIChhc3l3LT5pbWFnZS53ICE9IGFzeXctPmltYWdlLmgpCj4g
K8KgwqDCoMKgwqDCoMKgaWYgKGFzeXctPmltYWdlLncgIT0gYXN5dy0+aW1hZ2UuaCkgewo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fZGJnX2F0b21pYyhkZXYsCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIklu
dmFsaWQgY3Vyc29yIGltYWdlIHNpemU6IHdpZHRoICglZCkgbXVzdAo+IG1hdGNoIGhlaWdodCAo
JWQpIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBhc3l3LT5pbWFnZS53LCBhc3l3LT5pbWFnZS5oKTsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiAr
wqDCoMKgwqDCoMKgwqBpZiAoYXN5dy0+aW1hZ2UucGl0Y2hbMF0gIT0gYXN5dy0+aW1hZ2UudyAq
IGZiLT5mb3JtYXQtPmNwcFswXSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBk
cm1fZGJnX2F0b21pYyhkZXYsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkludmFsaWQgY3Vyc29yIGltYWdlIHBpdGNoOiBpbWFn
ZSBtdXN0IGJlCj4gcGFja2VkIChwaXRjaCA9ICVkLCB3aWR0aCA9ICVkKSIsCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXN5dy0+
aW1hZ2UucGl0Y2hbMF0sIGFzeXctPmltYWdlLncpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gLUVJTlZBTDsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiDCoMKgwqDC
oMKgwqDCoMKgcmV0ID0gaGVhZC0+ZnVuYy0+Y3Vyc19sYXlvdXQoaGVhZCwgYXN5dywgYXN5aCk7
Cj4gLcKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KSB7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9kYmdfYXRvbWljKGRldiwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAi
SW52YWxpZCBjdXJzb3IgaW1hZ2Ugc2l6ZTogdW5zdXBwb3J0ZWQgc2l6ZQo+ICVkeCVkIiwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBhc3l3LT5pbWFnZS53LCBhc3l3LT5pbWFnZS5oKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gK8KgwqDCoMKgwqDCoMKgfQoKT2gtc29tZSB0aGluZ3Mg
SSBmb3Jnb3QgdG8gbWVudGlvbjoKCi0gWW91J3JlIG1pc3Npbmcgc29tZSBuZXdsaW5lcyBpbiB5
b3VyIGRlYnVnIG1lc3NhZ2VzCi0gQWxzbywgTlZfQVRPTUlDKCkgaXMgYSB0aGluZwoKV2l0aCB0
aG9zZSB0d28gZml4ZWQ6CgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNv
bT4KCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGhlYWQtPmZ1bmMtPmN1cnNfZm9ybWF0
KGhlYWQsIGFzeXcsIGFzeWgpOwo+IMKgfQoKLS0gClNpbmNlcmVseSwKICAgTHl1ZGUgUGF1bCAo
c2hlL2hlcikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAogICAKTm90ZTogSSBkZWFs
IHdpdGggYSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1Z3Mgb24gbXkgcGxhdGUu
IElmIHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBmb3IgYSByZXZpZXcv
bWVyZ2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3BvbmRlZCBpbiBhIHdoaWxl
LCBwbGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFpbCB0byBjaGVjawpvbiBt
eSBzdGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQo=
