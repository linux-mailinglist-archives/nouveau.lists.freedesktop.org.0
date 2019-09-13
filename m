Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F94B2847
	for <lists+nouveau@lfdr.de>; Sat, 14 Sep 2019 00:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AB56F47C;
	Fri, 13 Sep 2019 22:21:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC146F47C
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 22:21:48 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BAD4631E7AF
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 22:21:47 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id m19so7823527qtm.13
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 15:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=JP4jP6mpEPQIK7y8sW6Sm0fCYeb5xv15y7wA/cmFkyw=;
 b=p75criJdcAWkeqmJP1JYlOE5oyC2oMM7GqXkH1d1sL7CByKlmzbJFL5nUxbPxIK29a
 qQdBdSUzNnSa2DXLW9+BtdL9u1P0YLwR7kxDWsGuEjESAcMBGNkvYf85l/qWp05lMHiZ
 T7prWQjHhYUlYvmWlTtK2jE3IQVJzzmzeCRTN1FvpubH5HkVbeEjEcUfIiq49KWEvETg
 /v/Fz5kpDjzvYkwBjHORf2aExkLK6+CAo6K5Vlj++Ubr3vXWNZzeK6eNbOrQlaiI2Ti6
 96AIzCKqnWenazMCT2W9idBx/xmawGWazYwAaCSXx0UA2o/RjN/VX3yrWBVT2xZPbIRR
 ngPA==
X-Gm-Message-State: APjAAAVj+V/K+/ZkGrH0lzKnRqzUeFE7YAa9MDIwE2n9P3sYGO7cj6EI
 pu6HYUCdYYK6XidEhQ1IA88Yy3j0j7EM+AS1RMIG5B9ydeDzjMkjlrVnvkP1u9vEOieP2HqAGtm
 ZyTX68eR8v2BxO/4nJSfNC3y4Kw==
X-Received: by 2002:ac8:760e:: with SMTP id t14mr5745155qtq.175.1568413307109; 
 Fri, 13 Sep 2019 15:21:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNcQUL3hq0iC38keGiPsp4lrFZMdU6Rmc/zogZLcerutTN40gUktNk6Sbz0VYRaa1/dEvUsg==
X-Received: by 2002:ac8:760e:: with SMTP id t14mr5745135qtq.175.1568413306922; 
 Fri, 13 Sep 2019 15:21:46 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id 60sm14417517qta.77.2019.09.13.15.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 15:21:46 -0700 (PDT)
Message-ID: <648aabc005e7cffa50060cd60452135a1a4d7818.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 13 Sep 2019 18:21:44 -0400
In-Reply-To: <CAKb7UvgQE0UDTvvhbq4FgtgOWjvXDDKSZs8RSLA-ECa2YZiFLA@mail.gmail.com>
References: <20190913220355.6883-1-lyude@redhat.com>
 <20190913220355.6883-2-lyude@redhat.com>
 <CAKb7UvgQE0UDTvvhbq4FgtgOWjvXDDKSZs8RSLA-ECa2YZiFLA@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH 2/4] drm/nouveau: dispnv50: Remove
 nv50_mstc_best_encoder()
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA5LTEzIGF0IDE4OjIwIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBP
biBGcmksIFNlcCAxMywgMjAxOSBhdCA2OjA1IFBNIEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+IHdyb3RlOgo+ID4gV2hlbiBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcy0+YXRvbWljX2Jl
c3RfZW5jb2RlciBpcyBkZWZpbmVkLAo+ID4gLT5iZXN0X2VuY29kZXIgaXMgaWdub3JlZCBib3Ro
IGJ5IHRoZSBhdG9taWMgbW9kZXNldHRpbmcgaGVscGVycy4gVGhhdAo+IAo+IEJ5IGJvdGggdGhl
IGF0b21pYyBtb2Rlc2V0dGluZyBoZWxwZXJzIGFuZCAuLi4gKHVzdWFsbHkgImJvdGgiIGltcGxp
ZXMgMgo+IHRoaW5ncykKCmdvb2QgY2F0Y2gsIHdpbGwgZml4IGFuZCByZXNwaW4gaW4gYSBtb21l
bnQKPiAKPiA+IGJlaW5nIHNhaWQsIHRoaXMgaG9vayBpcyBjb21wbGV0ZWx5IGJyb2tlbiBhbnl3
YXkgLSBpdCBhbHdheXMgcmV0dXJucwo+ID4gdGhlIGZpcnN0IG1zdG8gZm9yIGEgZ2l2ZW4gbXN0
YywgZGVzcGl0ZSB0aGUgZmFjdCBpdCBtaWdodCBhbHJlYWR5IGJlIGluCj4gPiB1c2UuCj4gPiAK
PiA+IFNvLCBqdXN0IGdldCByaWQgb2YgaXQuIFdlJ2xsIG5lZWQgdGhpcyBpbiBhIG1vbWVudCBh
bnl3YXksIHdoZW4gd2UgbWFrZQo+ID4gbXN0b3MgcGVyLWhlYWQgYXMgb3Bwb3NlZCB0byBwZXIt
Y29ubmVjdG9yLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlz
cC5jIHwgOSAtLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
Ywo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiA+IGluZGV4
IGI0NmJlOGEwOTFlOS4uYTNmMzUwZmRmYThjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiA+IEBAIC05MjAsMTQgKzkyMCw2IEBAIG52NTBfbXN0Y19h
dG9taWNfYmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yCj4gPiAqY29ubmVjdG9yLAo+
ID4gICAgICAgICByZXR1cm4gJm1zdGMtPm1zdG0tPm1zdG9baGVhZC0+YmFzZS5pbmRleF0tPmVu
Y29kZXI7Cj4gPiAgfQo+ID4gCj4gPiAtc3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAqCj4gPiAt
bnY1MF9tc3RjX2Jlc3RfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+
ID4gLXsKPiA+IC0gICAgICAgc3RydWN0IG52NTBfbXN0YyAqbXN0YyA9IG52NTBfbXN0Yyhjb25u
ZWN0b3IpOwo+ID4gLQo+ID4gLSAgICAgICByZXR1cm4gJm1zdGMtPm1zdG0tPm1zdG9bMF0tPmVu
Y29kZXI7Cj4gPiAtfQo+ID4gLQo+ID4gIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cwo+ID4g
IG52NTBfbXN0Y19tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4g
PiAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiA+
IEBAIC05OTAsNyArOTgyLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hl
bHBlcl9mdW5jcwo+ID4gIG52NTBfbXN0Y19oZWxwID0gewo+ID4gICAgICAgICAuZ2V0X21vZGVz
ID0gbnY1MF9tc3RjX2dldF9tb2RlcywKPiA+ICAgICAgICAgLm1vZGVfdmFsaWQgPSBudjUwX21z
dGNfbW9kZV92YWxpZCwKPiA+IC0gICAgICAgLmJlc3RfZW5jb2RlciA9IG52NTBfbXN0Y19iZXN0
X2VuY29kZXIsCj4gPiAgICAgICAgIC5hdG9taWNfYmVzdF9lbmNvZGVyID0gbnY1MF9tc3RjX2F0
b21pY19iZXN0X2VuY29kZXIsCj4gPiAgICAgICAgIC5hdG9taWNfY2hlY2sgPSBudjUwX21zdGNf
YXRvbWljX2NoZWNrLAo+ID4gIH07Cj4gPiAtLQo+ID4gMi4yMS4wCj4gPiAKLS0gCkNoZWVycywK
CUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
