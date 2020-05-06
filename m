Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181001C7255
	for <lists+nouveau@lfdr.de>; Wed,  6 May 2020 16:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B326E87F;
	Wed,  6 May 2020 14:00:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877466E883
 for <nouveau@lists.freedesktop.org>; Wed,  6 May 2020 14:00:35 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id m24so1028309vsq.10
 for <nouveau@lists.freedesktop.org>; Wed, 06 May 2020 07:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o0Nh0rZkLa1KJDM+ia+w25xnHIEfYX6auQsqaJ4ScVg=;
 b=O+R3PP31zAuqWwgyqwaQw6U+DZCDkM4SN2MblBVgOq0MjsjQYkp2oLDwqQLLNgMzRc
 /08u1tLW2bVcn5EupC/gHu+DJKWDdF5wxLt82FZveqXIVleN3/4bLANBSKWIX8Es5gLs
 KPHqGBmOtMnv67IcY3lh7HASBqXpNEWTua9Xc3XuHRBGlN3jEKdMQYOdKWtQ4vvRfWcL
 vNT+Mk61h7AJj3aFf6X2h6uyAfbEdUoG6iYmzu1uxZr0tyoYdSZhBpWRpD6V7kExCvlm
 XIUYy96TyL+rAwSq5ViWabgHyXtwyuF51LuiDd6p2C41ES2hVmFBzrzVO6mJwKoMhgMp
 Bs3g==
X-Gm-Message-State: AGi0Pub3G3oTw5cbd0iuqcOAbNaScuOmmt0WJceVcllN3LoAIgtpsRon
 /PKEkHXVjlMxMyvQo0pPyxf9xeiuMZKkSatE6Gc=
X-Google-Smtp-Source: APiQypIEWeuMVLraVSVRlsGEOxn2KpGMipZ6VKz5E9d+xyGwXRVBxDJl4+2kWMZkNc91XaxlRd3jSV28mNoiub67wxI=
X-Received: by 2002:a05:6102:409:: with SMTP id
 d9mr7101484vsq.220.1588773634270; 
 Wed, 06 May 2020 07:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCWPP+WKRhhXG3CRfqRztWbFJwUqeeY6tiip4fT9gwtyjKNwQ@mail.gmail.com>
In-Reply-To: <CAFCWPP+WKRhhXG3CRfqRztWbFJwUqeeY6tiip4fT9gwtyjKNwQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 6 May 2020 10:00:22 -0400
Message-ID: <CAKb7UvhNDFKHkOV8p0v8cVHf7cMadNLVKi0iD_mCZnH_j5=2OA@mail.gmail.com>
To: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>
Subject: Re: [Nouveau] GeForce(R) GT 710 1GB PCIE x 1 on arm64
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SW4gZ2VuZXJhbCBpdCBzaG91bGQgYmUgcG9zc2libGUuIElmIHlvdSdyZSBoYXZpbmcgaXNzdWVz
LCBwbGVhc2UgaW5jbHVkZSBkbWVzZy4KCk9uZSBpc3N1ZSB0aGF0IGhhcyBjb21lIHVwIGlzIHRo
YXQgdGhlIFBDSWUgY29udHJvbGxlcnMgb24gc3VjaCBib2FyZHMKaGF2ZSB2ZXJ5IG5hcnJvdyBt
ZW1vcnkgd2luZG93cywgbm90IGVub3VnaCB0byBtYXAgY2VydGFpbiAocmVxdWlyZWQpCkJBUnMg
b2YgTlZJRElBIEdQVXMgKG9yIG90aGVyIEdQVXMsIEknZCBleHBlY3QpLiBUaGlzIGNvbWVzIHVw
IGluCmRtZXNnIHdpdGggUENJLXJlbGF0ZWQgZXJyb3JzLgoKQ2hlZXJzLAoKICAtaWxpYQoKT24g
V2VkLCBNYXkgNiwgMjAyMCBhdCA5OjUzIEFNIE1pbGFuIEJ1xaFrYSA8bWlsYW4uYnVza2FAZ21h
aWwuY29tPiB3cm90ZToKPgo+IEhpIHRvIGFsbC4KPiBJJ20gZXhwZXJpbWVudGluZyB3aXRoIHJ1
bm5pbmcgYSBodHRwczovL3d3dy56b3RhYy5jb20vdXMvcHJvZHVjdC9ncmFwaGljc19jYXJkL2dl
Zm9yY2UlQzIlQUUtZ3QtNzEwLTFnYi1wY2llLXgtMSBjYXJkIG9uIGFuIE52aWRpYSBKZXRzb24g
VFgyIGFybTY0IGRldmljZS4KPiBQb3NzaWJsZT8KPiBMaW51eCBrZXJuZWwgYWFyY2g2NCA1LjYu
MTAuCj4gQmVjYXVzZSBOdmlkaWEgZGlkIG5vdCBsaXN0IGRyaXZlcnMgZm9yIHRoaXMgYXJjaGl0
ZWN0dXJlLCBJJ20gZXhwZXJpbWVudGluZyB3aXRoIGEgbm91dmVhdSBkcml2ZXIuCj4gVGhlIEpl
dHNvbiBUWDIgaGFzIGEgZGVmYXVsdCBkcml2ZXIgZm9yIHRoZSBob3N0MXggZnJhbWVidWZmZXIg
Zm9yIG91dHB1dCBmcm9tIHRoZSBib2FyZCB2aWEgSERNSS4KPiBJIGNoYW5nZWQgdGhlIHZpZGVv
IGtlcm5lbCBwYXJhbWV0ZXIgdG8gbm91dmVhdS4gQm9vdGluZyB0aGUgc3lzdGVtIE9LIG9ubHkg
dGhlcmUgaXMgbm8gb3V0cHV0IG9uIHRoZSBtb25pdG9yLgo+IFRoZSBkZXZpY2UgY2FuIG9ubHkg
YmUgY29udHJvbGxlZCB2aWEgdGhlIHNlcmlhbCBjb25zb2xlLgo+IENhbiBhbnlvbmUgYWR2aXNl
IG1lIHdoZXJlIHRvIHN0YXJ0IHNldHRpbmcgdXAgLSAoaWYgc29tZXRoaW5nIG5lZWRzIHRvIGJl
IHNldCB1cCkKPgo+IEdyZWV0aW5nCj4KPiBNaWxhbiBCdcWha2EKPgo+IC0tCj4KPiBSZW1lbWJl
ciwgbm8gcXVlc3Rpb24gaXMgdG9vIHN0dXBpZCBhbmQgbm8gcHJvYmxlbSB0b28gc21hbGwKPiAg
ICAgICAgLS0gV2UndmUgYWxsIGJlZW4gYmVnaW5uZXJzCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQo=
