Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA753640D8
	for <lists+nouveau@lfdr.de>; Mon, 19 Apr 2021 13:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C01E6E252;
	Mon, 19 Apr 2021 11:49:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308A26E252
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8/WB5h/DCpqWz25sPbtK613PP91ho7sThr7U3NsdLI=;
 b=OEtl5oYZ0J24OGiW5ijqjxbuWwts0PrdNg4U7v0JVJfqSRLgU3vRSLTYnVczKd4vxsOrxB
 YhbdCU3661vXSvGgXqwjROjg41pLL4VOKZROu5SV+Bx+CIYK2SPwZ05xxYkZIKxrPxLAju
 EsncctTIf4A0U80NBZ4ASwMFzZDx8ag=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-pxjH0EFWMNCEnzJ_pHHikA-1; Mon, 19 Apr 2021 07:49:02 -0400
X-MC-Unique: pxjH0EFWMNCEnzJ_pHHikA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so241207wmb.2
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X8/WB5h/DCpqWz25sPbtK613PP91ho7sThr7U3NsdLI=;
 b=qWSNXfvdKCcuP6FNoaqFgrK1BYiFUYPiiSZF3v9ns7lBIHJhzQvKp6tm5XbPzJxows
 l7FivY4K/oltaVKlU1lwAAil9tH4aQ1qFXs5f1A30GJBlh67d7d+N4NcIZr1cPEJU0fq
 LEg6fKQFl5Yhsz+aMUVrDFXZ0QNFWUFlMcjwZzgphF758eAfGCspIEFXEtkf0Z0z5gHJ
 Y8r7DdE4e5JGSB1rDYq+lb9V67qa3aA0YvHU/2XStqtaquDEs3EsJw5pevS+ij34XTfs
 +eka+VAipKlO/i26wv+bZNQkESlY001EZhAEaVGTcaPmI39Me7lKN8Tz7CP4GNDea0Jh
 380w==
X-Gm-Message-State: AOAM5314reXdylZDuu4l4O26XMitJDxIwGgy/Q5HTZiLmobe7xN2QvFM
 l2PJH4VrzL/SZACX9ZYcZjODmKBzb0+NmEU7v6jOwom/8YLvJdOxcyls8D4L5W6SkAYLAtsQRd0
 +DKh5jvqa4YpNnTMEcLTgUSyfqUWQeej6l3Zsp+BHYQ==
X-Received: by 2002:a05:600c:3796:: with SMTP id
 o22mr21036155wmr.139.1618832941557; 
 Mon, 19 Apr 2021 04:49:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqeEo6baFAOSCC5EED8Adjw7elmBbplC1HwyVdu+epP3qNnST1SJ2pLkLV0oLFm79ijqBFSPkWTkiLHj2i6Lo=
X-Received: by 2002:a05:600c:3796:: with SMTP id
 o22mr21036144wmr.139.1618832941419; 
 Mon, 19 Apr 2021 04:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-16-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-16-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:48:50 +0200
Message-ID: <CACO55tvbVFPfjzTxmoKMbxVv1bR9xguX+QCLZawtg2SdSN9qzQ@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 15/40] drm/nouveau/nouveau_svm: Remove unused
 variable 'ret' from void function
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTYsIDIwMjEgYXQgNDozOCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmM6IElu
IGZ1bmN0aW9uIOKAmG5vdXZlYXVfcGZuc19tYXDigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfc3ZtLmM6ODEwOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gQ2M6IEJlbiBTa2Vn
Z3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIHwgNSArKy0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4gaW5kZXggMWMzZjg5MDM3N2QyYy4uMjZhZjZl
ZTkxNTM2OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2
bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwo+IEBAIC04
MTEsNyArODExLDYgQEAgbm91dmVhdV9wZm5zX21hcChzdHJ1Y3Qgbm91dmVhdV9zdm1tICpzdm1t
LCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
YWRkciwgdTY0ICpwZm5zLCB1bnNpZ25lZCBsb25nIG5wYWdlcykKPiAgewo+ICAgICAgICAgc3Ry
dWN0IG5vdXZlYXVfcGZubWFwX2FyZ3MgKmFyZ3MgPSBub3V2ZWF1X3BmbnNfdG9fYXJncyhwZm5z
KTsKPiAtICAgICAgIGludCByZXQ7Cj4KPiAgICAgICAgIGFyZ3MtPnAuYWRkciA9IGFkZHI7Cj4g
ICAgICAgICBhcmdzLT5wLnNpemUgPSBucGFnZXMgPDwgUEFHRV9TSElGVDsKPiBAQCAtODE5LDgg
KzgxOCw4IEBAIG5vdXZlYXVfcGZuc19tYXAoc3RydWN0IG5vdXZlYXVfc3ZtbSAqc3ZtbSwgc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sCj4gICAgICAgICBtdXRleF9sb2NrKCZzdm1tLT5tdXRleCk7Cj4K
PiAgICAgICAgIHN2bW0tPnZtbS0+dm1tLm9iamVjdC5jbGllbnQtPnN1cGVyID0gdHJ1ZTsKPiAt
ICAgICAgIHJldCA9IG52aWZfb2JqZWN0X2lvY3RsKCZzdm1tLT52bW0tPnZtbS5vYmplY3QsIGFy
Z3MsIHNpemVvZigqYXJncykgKwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnBh
Z2VzICogc2l6ZW9mKGFyZ3MtPnAucGh5c1swXSksIE5VTEwpOwo+ICsgICAgICAgbnZpZl9vYmpl
Y3RfaW9jdGwoJnN2bW0tPnZtbS0+dm1tLm9iamVjdCwgYXJncywgc2l6ZW9mKCphcmdzKSArCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICBucGFnZXMgKiBzaXplb2YoYXJncy0+cC5waHlzWzBd
KSwgTlVMTCk7Cgp5ZWFoIG1oaC4uIEkgdGhpbmsgdGhpcyBvbmUgaXMgYWN0dWFsbHkgZmluZSwg
YnV0IGl0IG1pZ2h0IG1ha2Ugc2Vuc2UKdG8gc3RpbGwgcmVwb3J0IHNvbWV0aGluZyBiYWNrLCBh
bHRob3VnaCBpbiB1c2Vyc3BhY2Ugd2Ugc3RpbGwgZG9uJ3QKY2FyZSBhcyB0aGUgQ0wgQVBJIGRv
ZXNuJ3QgcmV0dXJuIGFueSBlcnJvci4KCj4gICAgICAgICBzdm1tLT52bW0tPnZtbS5vYmplY3Qu
Y2xpZW50LT5zdXBlciA9IGZhbHNlOwo+Cj4gICAgICAgICBtdXRleF91bmxvY2soJnN2bW0tPm11
dGV4KTsKPiAtLQo+IDIuMjcuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
