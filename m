Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50643AECC3
	for <lists+nouveau@lfdr.de>; Mon, 21 Jun 2021 17:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF6C6E1F5;
	Mon, 21 Jun 2021 15:49:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E116E1F5;
 Mon, 21 Jun 2021 15:49:40 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id s6so19580882edu.10;
 Mon, 21 Jun 2021 08:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=l69wzpWpD3xFCsCLvgEOzx5xEbTW98k9SqCkGGVwX4E=;
 b=sGNsmFf7YJpHZUpK4nsoMQDudvK1PxSTBeWQAKWJ3uSwgHoD4CsanJHw9JcPnEbxwh
 GvkqVJjqTfiFI+Pa3DxhoNoMzeQeaWg0+fBeXmT+GI89v4vNb1iKWKzz8EIzfP/T3mSu
 zng/7DcWFz+BzaEt6rm+mPIQJrWbsCW4gPSc3mm7LXrUEkiQsCIq1M/PHSuZuP5c40Ly
 e8Rs4rk0RSas/eOXJMCpxKTvLKy1yK8yZfvE2McZyZKxV6TbTBAAh8jrlZ0ozfFj30PG
 X+/3bSBlTU9GONcIgNpYgBVZKGXenMAi2caMRbuWZHQ8BJxXtxfOvINpz6kuXPn7WLnM
 wiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=l69wzpWpD3xFCsCLvgEOzx5xEbTW98k9SqCkGGVwX4E=;
 b=QiFe4rqKmrIWrqzF6T3rIjVwtwbGYPgaCm0VnJVTDE///djWV4bmXWJ5A5QwLj1DFl
 DGmkXPDs3h7GoK+W43JjSiEFwu63iw56XHiqsdufdicyC43zXfEcw5jh58sJueJQxfxS
 fXzZRiByPyr/GKFwZNiNQlTh2eRp/l/AHc8s3pa672o3dXvvawiMzkaoDLGt4Q9CHjMO
 OPesVG/ArQFFMmW6Qi65YQ+cPIbhuWVIhDnEvwQqcahPyktMQVhdrp4fkaIK/sRzf3z3
 gA4uaJ5s9GXHqdblnu7L878UZnBk9SPNoMGfwBtjPtDZrCq62//M+GEKkrkgE8yC6k9E
 aEBA==
X-Gm-Message-State: AOAM533BMYLPHOwvsLIul/LQbkbP9gGc85qXROgQBNHqm7WgO9z/Cxn1
 ZBM0MOjrkIL2bakUdXmzdbVkdNA6zsM=
X-Google-Smtp-Source: ABdhPJxGDQwE9Q4s51LvWebCQ/o2v7eyBlUYHatpJCDZWknokS7gDwU4wqKoCBnonI4qtEjTCnB6rQ==
X-Received: by 2002:a05:6402:28b5:: with SMTP id
 eg53mr13834613edb.110.1624290579094; 
 Mon, 21 Jun 2021 08:49:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:98e4:7a7c:4972:8db6?
 ([2a02:908:1252:fb60:98e4:7a7c:4972:8db6])
 by smtp.gmail.com with ESMTPSA id jl10sm694971ejc.56.2021.06.21.08.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 08:49:38 -0700 (PDT)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210621130328.11070-1-christian.koenig@amd.com>
 <YNCoK1qv6CCIy0Rl@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2033755d-c49f-8b90-f726-d640146a3df7@gmail.com>
Date: Mon, 21 Jun 2021 17:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YNCoK1qv6CCIy0Rl@phenom.ffwll.local>
Content-Language: en-US
Subject: Re: [Nouveau] [PATCH 1/3] drm/nouveau: wait for moving fence after
 pinning
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QW0gMjEuMDYuMjEgdW0gMTY6NTQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgSnVu
IDIxLCAyMDIxIGF0IDAzOjAzOjI2UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IFdlIGFjdHVhbGx5IG5lZWQgdG8gd2FpdCBmb3IgdGhlIG1vdmluZyBmZW5jZSBhZnRlciBwaW5u
aW5nCj4+IHRoZSBCTyB0byBtYWtlIHN1cmUgdGhhdCB0aGUgcGluIGlzIGNvbXBsZXRlZC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgo+PiBDQzogc3RhYmxlQGtlcm5lbC5vcmcKPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9wcmltZS5jIHwgOCArKysrKysrLQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfcHJpbWUuYwo+PiBpbmRleCAzNDc0ODg2ODVmNzQuLjU5MTczODU0NWViYSAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9wcmltZS5jCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfcHJpbWUuYwo+PiBAQCAtOTMs
NyArOTMsMTMgQEAgaW50IG5vdXZlYXVfZ2VtX3ByaW1lX3BpbihzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKm9iaikKPj4gICAJaWYgKHJldCkKPj4gICAJCXJldHVybiAtRUlOVkFMOwo+PiAgIAo+PiAt
CXJldHVybiAwOwo+PiArCWlmIChudmJvLT5iby5tb3ZpbmcpIHsKPiBEb24ndCB3ZSBuZWVkIHRv
IGhvbGQgdGhlIGRtYV9yZXN2IHRvIHJlYWQgdGhpcz8gV2UgY2FuIGdyYWIgYSByZWZlcmVuY2UK
PiBhbmQgdGhlbiB1bmxvY2ssIGJ1dCBJIHRoaW5rIGp1c3QgdW5sb2NrZWQgd2FpdCBjYW4gZ28g
Ym9vbSBwcmV0dHkgZWFzaWx5Cj4gKHNpbmNlIHdlIGRvbid0IGhvbGQgYSByZWZlcmVuY2Ugb3Ig
bG9jayBzbyBzb21lb25lIGVsc2UgY2FuIGp1bXAgaW4gYW5kCj4gZnJlZSB0aGUgbW92aW5nIGZl
bmNlKS4KClRoZSBtb3ZpbmcgZmVuY2UgaXMgb25seSBtb2RpZmllZCB3aGlsZSB0aGUgQk8gaXMg
bW92ZWQgYW5kIHNpbmNlIHdlIApoYXZlIGp1c3Qgc3VjY2Vzc2Z1bGx5IHBpbm5lZCBpdC4uLi4K
CkJ1dCBpbiBnZW5lcmFsIEkgYWdyZWUgdGhhdCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gYXZvaWQg
dGhpcy4gSSBqdXN0IApkaWRuJ3Qgd2FudGVkIHRvIG9wZW4gYSBiaWdnZXIgY2FuIG9mIHdvcm1z
IGJ5IGNoYW5naW5nIG5vdXZlYXUgc28gbXVjaC4KCkNocmlzdGlhbi4KCj4gLURhbmllbAo+Cj4+
ICsJCXJldCA9IGRtYV9mZW5jZV93YWl0KG52Ym8tPmJvLm1vdmluZywgdHJ1ZSk7Cj4+ICsJCWlm
IChyZXQpCj4+ICsJCQlub3V2ZWF1X2JvX3VucGluKG52Ym8pOwo+PiArCX0KPj4gKwo+PiArCXJl
dHVybiByZXQ7Cj4+ICAgfQo+PiAgIAo+PiAgIHZvaWQgbm91dmVhdV9nZW1fcHJpbWVfdW5waW4o
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4+IC0tIAo+PiAyLjI1LjEKPj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
