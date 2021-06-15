Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F313A7559
	for <lists+nouveau@lfdr.de>; Tue, 15 Jun 2021 05:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829C86E1F7;
	Tue, 15 Jun 2021 03:44:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FC36E1F6
 for <nouveau@lists.freedesktop.org>; Tue, 15 Jun 2021 03:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623728643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aHGbJbj0ebE6QT9Ys/qhv9gUQ2vgyk5k0OjPBMHdeRg=;
 b=OXmaX5ZveF/pd3mpU7dUoLTeqeLdUvMZ48/oH7pHF8nmxMwJRLF/b3vgijDEKnUJ3ZkxQ2
 wW4+qL/FQjMl2l9CD+lTsMsy4DY3/ghrglbzWZflkGnribhVbP83Tbv60V1jDI+NcUj9K2
 OIVE+/ReH0kv9NLHAfR9l4ke1xbjls4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-VmbSOE4zPHOg0N3Q3yzg5g-1; Mon, 14 Jun 2021 23:43:59 -0400
X-MC-Unique: VmbSOE4zPHOg0N3Q3yzg5g-1
Received: by mail-qk1-f198.google.com with SMTP id
 r190-20020a375dc70000b02903acea04c19fso6703588qkb.8
 for <nouveau@lists.freedesktop.org>; Mon, 14 Jun 2021 20:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=aHGbJbj0ebE6QT9Ys/qhv9gUQ2vgyk5k0OjPBMHdeRg=;
 b=XGsdoFSVHXQwH8xvaPXkVagD/JPIiqupeLHUSytCLXxgWNVHwi3HegLbOewO7cncTl
 NoHmzrsgJzKB9e8Yh0tUN1TSIhtGGFLU7E+YjNEJ3GnqEp8zd+JNWu4m0U0Otcjj2Ze3
 OJWs3/pzT5IkwXX6mkn5sEOIuK/IWyewtlfKMu2Fg5U5B6DzRT7O2B/x/O34Sd1aRKPj
 T3AUpTKJY55rRN1wJT8c1bOk9ZYbjmbNJKas+Q/NECQDCdyhUqLG7uBoLRprjPtJnmg4
 xcGXOvdTUG33S9ekLknAzZ6UhkLGvBqv0KQ5EpjPg8w/7a5rLda0QcJXMYkjZ/xrUMlW
 PpCw==
X-Gm-Message-State: AOAM532jhuL6qUrOcPpD+81ABXvjKfM4gGeB+55E9BlvtezeKHRKP7ZY
 gzht+TBjAcK8QA2ainDsL3vM97UZJ1tsrOrPxcJ6EPVCgg+kFIVBPSSzHnSfsUw+v7wPuaD1Aqf
 QnwgYJn5q0YPjat3X7dAqS3NqLw==
X-Received: by 2002:a05:6214:321:: with SMTP id
 j1mr2711523qvu.38.1623728639305; 
 Mon, 14 Jun 2021 20:43:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuw2F0Hwmy8HsE3YZyb+Uzm7Uyn8BYHYIjsreErLv1PghnFw3ohtOSlSt4INE1txfNq/9atw==
X-Received: by 2002:a05:6214:321:: with SMTP id
 j1mr2711504qvu.38.1623728639099; 
 Mon, 14 Jun 2021 20:43:59 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id p3sm11128331qti.31.2021.06.14.20.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 20:43:58 -0700 (PDT)
Message-ID: <f3824dfa4b4d40d66e0ab56713ba168fc7952e0d.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Chen Jiahao <chenjiahao16@huawei.com>, bskeggs@redhat.com,
 airlied@linux.ie,  daniel@ffwll.ch, airlied@redhat.com,
 nikola.cornij@amd.com,  ville.syrjala@linux.intel.com,
 dri-devel@lists.freedesktop.org,  nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Mon, 14 Jun 2021 23:43:57 -0400
In-Reply-To: <20210615031658.176218-1-chenjiahao16@huawei.com>
References: <20210615031658.176218-1-chenjiahao16@huawei.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm: nouveau: fix nouveau_backlight compiling
 error
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
Cc: heying24@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhpcyBuZWVkcyBhIGZpeGVzIHRhZzoKCglGaXhlczogNmVjYTMxMGU4OTI0ICgiZHJtL25vdXZl
YXUva21zL252NTAtOiBBZGQgYmFzaWMgRFBDRCBiYWNrbGlnaHQgc3VwcG9ydCBmb3Igbm91dmVh
dSIpCgp3aXRoIHRoYXQgZml4ZWQ6CgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KCk9uIFR1ZSwgMjAyMS0wNi0xNSBhdCAxMToxNiArMDgwMCwgQ2hlbiBKaWFoYW8g
d3JvdGU6Cj4gVGhlcmUgaXMgYSBjb21waWxpbmcgZXJyb3IgaW4gZGlzcC5jIHdoaWxlIG5vdCBz
ZWxlY3RpbmcKPiBDT05GSUdfRFJNX05PVVZFQVVfQkFDS0xJR0hUOgo+IAo+IGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzogSW4gZnVuY3Rpb24KPiDigJhudjUwX3Nvcl9h
dG9taWNfZGlzYWJsZeKAmToKPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNw
LmM6MTY2NTo1MjogZXJyb3I6Cj4g4oCYc3RydWN0IG5vdXZlYXVfY29ubmVjdG9y4oCZIGhhcyBu
byBtZW1iZXIgbmFtZWQg4oCYYmFja2xpZ2h04oCZCj4gwqAxNjY1IHzCoCBzdHJ1Y3Qgbm91dmVh
dV9iYWNrbGlnaHQgKmJhY2tsaWdodCA9IG52X2Nvbm5lY3Rvci0+YmFja2xpZ2h0Owo+IMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefgo+
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzoxNjcwOjI4OiBlcnJvcjog
ZGVyZWZlcmVuY2luZwo+IHBvaW50ZXIKPiB0byBpbmNvbXBsZXRlIHR5cGUg4oCYc3RydWN0IG5v
dXZlYXVfYmFja2xpZ2h04oCZCj4gwqAxNjcwIHzCoCBpZiAoYmFja2xpZ2h0ICYmIGJhY2tsaWdo
dC0+dXNlc19kcGNkKSB7Cj4gwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+Cj4gCj4gVGhlIHByb2JsZW0gaXMgc29sdmVk
IGJ5IGFkZGluZyB0aGUgQ09ORklHX0RSTV9OT1VWRUFVX0JBQ0tMSUdIVCBkZXBlbmRlbmN5Cj4g
d2hlcmUgc3RydWN0IG5vdXZlYXVfYmFja2xpZ2h0IGlzIHVzZWQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2hlbiBKaWFoYW8gPGNoZW5qaWFoYW8xNkBodWF3ZWkuY29tPgo+IC0tLQo+IMKgZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIHwgNCArKysrCj4gwqAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52
NTAvZGlzcC5jCj4gaW5kZXggMDkzZTFmNzE2M2IzLi5kMjY2Yjc3MjFlMjkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gQEAgLTE2NjIsMTcgKzE2NjIsMjEg
QEAgbnY1MF9zb3JfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAo+
IHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdAo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgbm91
dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKG52X2VuY29kZXItPmJhc2UuYmFzZS5kZXYpOwo+
IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgbm91dmVhdV9jcnRjICpudl9jcnRjID0gbm91dmVhdV9j
cnRjKG52X2VuY29kZXItPmNydGMpOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgbm91dmVhdV9j
b25uZWN0b3IgKm52X2Nvbm5lY3RvciA9Cj4gbnY1MF9vdXRwX2dldF9vbGRfY29ubmVjdG9yKHN0
YXRlLCBudl9lbmNvZGVyKTsKPiArI2lmZGVmIENPTkZJR19EUk1fTk9VVkVBVV9CQUNLTElHSFQK
PiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IG5vdXZlYXVfYmFja2xpZ2h0ICpiYWNrbGlnaHQgPSBu
dl9jb25uZWN0b3ItPmJhY2tsaWdodDsKPiArI2VuZGlmCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVj
dCBkcm1fZHBfYXV4ICphdXggPSAmbnZfY29ubmVjdG9yLT5hdXg7Cj4gwqDCoMKgwqDCoMKgwqDC
oGludCByZXQ7Cj4gwqDCoMKgwqDCoMKgwqDCoHU4IHB3cjsKPiDCoAo+ICsjaWZkZWYgQ09ORklH
X0RSTV9OT1VWRUFVX0JBQ0tMSUdIVAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoYmFja2xpZ2h0ICYm
IGJhY2tsaWdodC0+dXNlc19kcGNkKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXQgPSBkcm1fZWRwX2JhY2tsaWdodF9kaXNhYmxlKGF1eCwgJmJhY2tsaWdodC0+ZWRwX2lu
Zm8pOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCA8IDApCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTlZfRVJST1IoZHJt
LCAiRmFpbGVkIHRvIGRpc2FibGUgYmFja2xpZ2h0IG9uCj4gW0NPTk5FQ1RPUjolZDolc106ICVk
XG4iLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbnZfY29ubmVjdG9yLT5iYXNlLmJhc2UuaWQsIG52X2Nvbm5lY3Rvci0K
PiA+YmFzZS5uYW1lLCByZXQpOwo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gKyNlbmRpZgo+IMKgCj4g
wqDCoMKgwqDCoMKgwqDCoGlmIChudl9lbmNvZGVyLT5kY2ItPnR5cGUgPT0gRENCX09VVFBVVF9E
UCkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IHJldCA9IGRybV9kcF9k
cGNkX3JlYWRiKGF1eCwgRFBfU0VUX1BPV0VSLCAmcHdyKTsKCi0tIApDaGVlcnMsCiBMeXVkZSBQ
YXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
