Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F43640CD
	for <lists+nouveau@lfdr.de>; Mon, 19 Apr 2021 13:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350646E25A;
	Mon, 19 Apr 2021 11:46:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AF36E255
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KNIBhiX96SBAEns+eZY4MeATI7Fr3o+QWf55kiN81w=;
 b=XaTePvUbXK36QhJwvnZ1uP25q9CCbBv25m+s139x18KUdEpCBdTOt5j6pWoRACfBzO6jSz
 sFfdpBg+U/8gL0fBRn8XeTOOIVplwM7kWY8ABOzYU8Q+CuR/Wqsb5BSLgGPiL7JWCFaoyA
 muPu2VH8aRf2YaCMJFrK+sNnvCJIZ5o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-oDTEtfqPPBi8djwbcHdXZg-1; Mon, 19 Apr 2021 07:46:32 -0400
X-MC-Unique: oDTEtfqPPBi8djwbcHdXZg-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso5496417wrf.11
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4KNIBhiX96SBAEns+eZY4MeATI7Fr3o+QWf55kiN81w=;
 b=TcyJflVdYnwt/mpfybLbH9o0uKztA4VBo5+b/dBbAQfzhkHVAzEDS0oARF0kDd1RH+
 UPHHT3lCIblU2dbb9v7ww8e0aLAGfV/lOr+myJbyjLJFGERMFQjuryyviuXMdS7wbzz7
 EU3rv5beFkWgob4b3C59M+A/oa34RCg2Hag7ZcHTimmh/8atpBeR2AfYcP7hcRl+QTfu
 QHSW8/ZQCAWkAtGtFNYjMx+PjCtpe1WfjAn4MbGZoTDG9VFcQ7Pq/j4J43WeRoi5DRK/
 V91Yce+VfxCle9JsP+q4+alUGMpnOeHpso1DsrnJVUyi7K5YX9TX7gloQOtPJW+ikfqi
 tFpQ==
X-Gm-Message-State: AOAM532v9xXM1gTi05BrqFxi/623Za/35jQFFDQjrXdCmbgPs/JeIZre
 u8NoohwgXVdE1ld7M9fAhN1stSRCuRRVa036EZYHS9AYXTITIIL/mLht2qT3bO5UOI6lw7PXBUF
 VJcLZFUCcFIjLSB1pKLhhn8tz9W5JzHkO+7rm4sG25g==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr21147826wma.164.1618832790915; 
 Mon, 19 Apr 2021 04:46:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzowTJOaUjO7V9rrnhDskD/pazvcM/Gbrdk15YuD9A3xkWwis/lEV+VVmSDcLCwGuQu5ct6FvqXa0KU8VEG1q0=
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr21147815wma.164.1618832790809; 
 Mon, 19 Apr 2021 04:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-12-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-12-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:46:20 +0200
Message-ID: <CACO55tu3ZiNYKQgXEYtnt9VMa+FdSXKRfK1atWzY+mfUsr=jAQ@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 11/40] drm/nouveau/dispnv50/headc57d: Make
 local function 'headc57d_olut' static
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

UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gRnJpLCBB
cHIgMTYsIDIwMjEgYXQgNDozOCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3
cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
Ogo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmM6MTczOjE6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYaGVhZGM1N2Rfb2x1dOKAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQu
Y29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNv
bT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBub3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVz
QGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hl
YWRjNTdkLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUw
L2hlYWRjNTdkLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5j
Cj4gaW5kZXggZmQ1MTUyN2I1NmI4My4uYmRjZmQyNDBkNjFjOCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYwo+IEBAIC0xNjksNyArMTY5LDcgQEAg
aGVhZGM1N2Rfb2x1dF9sb2FkKHN0cnVjdCBkcm1fY29sb3JfbHV0ICppbiwgaW50IHNpemUsIHZv
aWQgX19pb21lbSAqbWVtKQo+ICAgICAgICAgd3JpdGV3KHJlYWR3KG1lbSAtIDQpLCBtZW0gKyA0
KTsKPiAgfQo+Cj4gLWJvb2wKPiArc3RhdGljIGJvb2wKPiAgaGVhZGM1N2Rfb2x1dChzdHJ1Y3Qg
bnY1MF9oZWFkICpoZWFkLCBzdHJ1Y3QgbnY1MF9oZWFkX2F0b20gKmFzeWgsIGludCBzaXplKQo+
ICB7Cj4gICAgICAgICBpZiAoc2l6ZSAhPSAwICYmIHNpemUgIT0gMjU2ICYmIHNpemUgIT0gMTAy
NCkKPiAtLQo+IDIuMjcuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
