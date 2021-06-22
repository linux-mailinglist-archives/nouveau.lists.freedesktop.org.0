Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E4A3B003C
	for <lists+nouveau@lfdr.de>; Tue, 22 Jun 2021 11:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CD36E457;
	Tue, 22 Jun 2021 09:29:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7AB6E456;
 Tue, 22 Jun 2021 09:29:44 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id q14so1402645eds.5;
 Tue, 22 Jun 2021 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NdjMudB00SK16mm0slQHpVJFVcY9ZMyqCPAzIyYdoJM=;
 b=PZUiT3w/En6Y+vR/Ddzhajf9kBo/fxoyD7T/pE9cd9BRHOEWLXhlYWABIXosLkxYse
 hCjMHGy9CPj08IQmb0hTzEBNHncqOJVOgxxxap2c0VMz+AVNrWpJDdUcxKnclmsb1I++
 OgRRR5neV4lTMHLRX23ZO8ZCsyva8o2vuhGRuaX0mvJK2f0Vdf8SJnyNta0/573T/5dP
 er3ayXzZJBZpOApvz0j0fMv/Jbiva2Fns69o2CMlhB9jgF5zM16DtBZmNGR5sOsdDPhC
 nsry6UZw7LkrWjuJ9Ej3+nIoHg3M2mo5iCNswAhnDSoJ+A0xet55sgQuAn9utyHJXWMB
 JYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NdjMudB00SK16mm0slQHpVJFVcY9ZMyqCPAzIyYdoJM=;
 b=pnbQcciGkfqI1iAtft3hSFOm1XQke3azizGJ4viyKk1/L2QzNnRd1xhgK/0qOe93DF
 01kw+gbF5lWayr4VjuAnikcFlBisZW8Xxed3/74hi1uZnMBdUEGxs9ZriGzrqHbR2y5x
 /zymnkqMHhqbMv5NbWn6HJ+EvQ098bWph4zLNbDmQqi2FG0gXCSh/GBLZxP76VANfRSM
 sXKezTNRD69ht3Q6HoG89mMh2UdeDnfiaxPq/G2Aw2U887ptKP07uPwniThshiOGRvMh
 CCi/e3l4pREkA8Vy5aVIREKcykhU4/Z7NaLYlW8Yv8+/xr+LYnSCj8lPj/VcGxdpEuzp
 ASCQ==
X-Gm-Message-State: AOAM530Yzc6fHx1tHsKK17mOScJPtqvSUHIgkwrRdwzoi65EPXEGDFJy
 yFilnn6gxiEfr6NlO0pWeNbRCjw/ZZM=
X-Google-Smtp-Source: ABdhPJwjtiXEL/ty27bWRrZ4Tfuk29kWF5gNxmpQ3KlzAt/Bafax81pQe4w3XwRk/WC/rAwc7JqOJA==
X-Received: by 2002:a50:ef12:: with SMTP id m18mr3649099eds.285.1624354183026; 
 Tue, 22 Jun 2021 02:29:43 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4?
 ([2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4])
 by smtp.gmail.com with ESMTPSA id r4sm5805002ejd.105.2021.06.22.02.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 02:29:42 -0700 (PDT)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210621130328.11070-1-christian.koenig@amd.com>
 <YNCoK1qv6CCIy0Rl@phenom.ffwll.local>
 <2033755d-c49f-8b90-f726-d640146a3df7@gmail.com>
 <CAKMK7uEET_E7eJa1No3KLMBudgE16ymXzXZp0CRYt_ZjS-_YsA@mail.gmail.com>
 <CAKMK7uECbQ+Fk6y9rsGdGdh4fEErhjUjSGicJLifnENAhjnZZw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0785485d-60e2-5c5b-557e-42253d545a53@gmail.com>
Date: Tue, 22 Jun 2021 11:29:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uECbQ+Fk6y9rsGdGdh4fEErhjUjSGicJLifnENAhjnZZw@mail.gmail.com>
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
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QW0gMjIuMDYuMjEgdW0gMTE6MjAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgSnVu
IDIxLCAyMDIxIGF0IDU6NTMgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90
ZToKPj4gT24gTW9uLCBKdW4gMjEsIDIwMjEgYXQgNTo0OSBQTSBDaHJpc3RpYW4gS8O2bmlnCj4+
IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+PiBBbSAyMS4wNi4y
MSB1bSAxNjo1NCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+Pj4gT24gTW9uLCBKdW4gMjEsIDIw
MjEgYXQgMDM6MDM6MjZQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gV2Ug
YWN0dWFsbHkgbmVlZCB0byB3YWl0IGZvciB0aGUgbW92aW5nIGZlbmNlIGFmdGVyIHBpbm5pbmcK
Pj4+Pj4gdGhlIEJPIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBwaW4gaXMgY29tcGxldGVkLgo+Pj4+
Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4+Pj4+IENDOiBzdGFibGVAa2VybmVsLm9yZwo+Pj4+PiAtLS0KPj4+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9wcmltZS5jIHwgOCArKysrKysrLQo+Pj4+
PiAgICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+
Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMKPj4+Pj4gaW5kZXgg
MzQ3NDg4Njg1Zjc0Li41OTE3Mzg1NDVlYmEgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfcHJpbWUuYwo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMKPj4+Pj4gQEAgLTkzLDcgKzkzLDEzIEBAIGludCBub3V2
ZWF1X2dlbV9wcmltZV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4+Pj4+ICAgICAg
IGlmIChyZXQpCj4+Pj4+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+Cj4+Pj4+
IC0gICAgcmV0dXJuIDA7Cj4+Pj4+ICsgICAgaWYgKG52Ym8tPmJvLm1vdmluZykgewo+Pj4+IERv
bid0IHdlIG5lZWQgdG8gaG9sZCB0aGUgZG1hX3Jlc3YgdG8gcmVhZCB0aGlzPyBXZSBjYW4gZ3Jh
YiBhIHJlZmVyZW5jZQo+Pj4+IGFuZCB0aGVuIHVubG9jaywgYnV0IEkgdGhpbmsganVzdCB1bmxv
Y2tlZCB3YWl0IGNhbiBnbyBib29tIHByZXR0eSBlYXNpbHkKPj4+PiAoc2luY2Ugd2UgZG9uJ3Qg
aG9sZCBhIHJlZmVyZW5jZSBvciBsb2NrIHNvIHNvbWVvbmUgZWxzZSBjYW4ganVtcCBpbiBhbmQK
Pj4+PiBmcmVlIHRoZSBtb3ZpbmcgZmVuY2UpLgo+Pj4gVGhlIG1vdmluZyBmZW5jZSBpcyBvbmx5
IG1vZGlmaWVkIHdoaWxlIHRoZSBCTyBpcyBtb3ZlZCBhbmQgc2luY2Ugd2UKPj4+IGhhdmUganVz
dCBzdWNjZXNzZnVsbHkgcGlubmVkIGl0Li4uLgo+PiBZZWFoICAuLi4gc28gcHJvYmFibHkgY29y
cmVjdCwgYnV0IHJlYWxseSB0cmlja3kuIEp1c3Qgd3JhcHBpbmcgYQo+PiB0dG1fYm9fcmVzZXJ2
ZS91bnJlc2VydmUgYXJvdW5kIHRoZSBjb2RlIHlvdSBhZGQgc2hvdWxkIGJlIGVub3VnaCBhbmQK
Pj4gZ2V0IHRoZSBqb2IgZG9uZT8KPiBJIHRoaW5rIHlvdSBkaXN0cmFjdGVkIG1lIGEgYml0IHdp
dGggdGhlICJpdCBjYW4ndCBtb3ZlIiwgc28geWVzCj4gdGhlcmUncyBhIGd1YXJhbnRlZSB0aGF0
IG5vIG90aGVyIGZlbmNlIGNhbiBzaG93IHVwIGluIHR0bV9iby0+bW92aW5nCj4gYW5kIGNvbmZ1
c2UgdXMuIEJ1dCBpdCBjb3VsZCBnZXQgc2V0IHRvIE5VTEwgYmVjYXVzZSBzb21lb25lIHJlYWxp
emVkCj4gaXQgc2lnbmFsbGVkLiBXZSdyZSBub3QgZG9pbmcgdGhhdCBzeXN0ZW1hdGljYWxseSwg
YnV0IHJlbHlpbmcgb24KPiBmZW5jZXMgbmV2ZXIgZ2V0dGluZyBnYXJiYWdlLWNvbGxlY3RlZCBm
b3IgY29ycmVjdG5lc3MgaXNuJ3QgZ3JlYXQuCgpZZWFoLCB0aGF0J3Mgd2hhdCBJIGVzc2VudGlh
bGx5IG1lYW50IHdpdGggaXQgd291bGQgYmUgYmV0dGVyIGluIGdlbmVyYWwgCnRvIHRha2UgdGhl
IGxvY2suCgo+Cj4gU290IHRoZSB0dG1fYm9fcmVzZXJ2ZS91bnJlc2VydmUgaXMgZGVmaW5pdGVs
eSBuZWVkZWQgaGVyZSBhcm91bmQgdGhpcwo+IGJpdCBvZiBjb2RlLiBZb3UgZG9uJ3QgbmVlZCB0
byBtZXJnZSBpdCB3aXRoIHRoZSByZXNlcnZlL3VucmVzZXJ2ZSBpbgo+IHRoZSBwaW4gZnVuY3Rp
b24gdGhvdWdoLCBpdCdzIGp1c3QgdG8gcHJvdGVjdCBhZ2FpbnN0IHRoZQo+IHVzZS1hZnRlci1m
cmVlLgoKQWgsIHllcyBnb29kIHBvaW50LiBUaGF0IG1lYW5zIEkgZG9uJ3QgbmVlZCB0byBjaGFu
Z2UgdGhlIHBpbi91bnBpbiAKZnVuY3Rpb25zIGluIG5vdXZlYXUgYXQgYWxsLgoKCkJUVzogV2hh
dCBkbyB5b3UgdGhpbmsgb2YgbWFraW5nIGRtYV9mZW5jZV9pc19zaWduYWxlZCgpIGFuZCAKZG1h
X2ZlbmNlX3dhaXRfdGltZW91dCgpIHNhdmUgdG8gcGFzc2luZyBpbiBOVUxMIGFzIGZlbmNlPwoK
SSB0aGluayB3ZSBoYXZlIGEgbG90IG9mIGNhc2VzIHdoZXJlIHdlIGNoZWNrICIhZmVuY2UgfHwg
CmRtYV9mZW5jZV9pc19zaWduYWxlZChmZW5jZSkiIG9yIHNpbWlsYXIuCgpDaHJpc3RpYW4uCgo+
IC1EYW5pZWwKPgo+Pj4gQnV0IGluIGdlbmVyYWwgSSBhZ3JlZSB0aGF0IGl0IHdvdWxkIGJlIGJl
dHRlciB0byBhdm9pZCB0aGlzLiBJIGp1c3QKPj4+IGRpZG4ndCB3YW50ZWQgdG8gb3BlbiBhIGJp
Z2dlciBjYW4gb2Ygd29ybXMgYnkgY2hhbmdpbmcgbm91dmVhdSBzbyBtdWNoLgo+PiBZZWFoLCBi
dXQgSSdtIGtpbmRhIHRoaW5raW5nIG9mIHNvbWUgaGVscGVycyB0byB3YWl0IGZvciB0aGUgbW92
ZQo+PiBmZW5jZSAoc28gdGhhdCBsYXRlciBvbiB3ZSBjYW4gc3dpdGNoIGZyb20gaGF2aW5nIHRo
ZSBleGNsdXNpdmUgZmVuY2UKPj4gdG8gdGhlIG1vdmUgZmVuY2UgZG8gdGhhdCwgbWF5YmUpLiBB
bmQgdGhlbiBsb2NraW5nIGNoZWNrcyBpbiB0aGVyZQo+PiB3b3VsZCBiZSBuaWNlLgo+Pgo+PiBB
bHNvIGF2b2lkcyB0aGUgY2FzZSBvZiBleHBsYWluaW5nIHdoeSBsb2NrbGVzcyBoZXJlIGlzIGZp
bmUsIGJ1dAo+PiBsb2NrbGVzcyB3YWl0IGZvciB0aGUgZXhjbHVzaXZlIGZlbmNlIGluIGUuZy4g
YSBkeW5hbWkgZG1hLWJ1Zgo+PiBpbXBvcnRlciBpcyB2ZXJ5IG11Y2ggbm90IGZpbmUgYXQgYWxs
LiBKdXN0IGFsbCBhcm91bmQgbGVzcyB0cm91YmxlLgo+PiAtRGFuaWVsCj4+Cj4+PiBDaHJpc3Rp
YW4uCj4+Pgo+Pj4+IC1EYW5pZWwKPj4+Pgo+Pj4+PiArICAgICAgICAgICAgcmV0ID0gZG1hX2Zl
bmNlX3dhaXQobnZiby0+Ym8ubW92aW5nLCB0cnVlKTsKPj4+Pj4gKyAgICAgICAgICAgIGlmIChy
ZXQpCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgIG5vdXZlYXVfYm9fdW5waW4obnZibyk7Cj4+
Pj4+ICsgICAgfQo+Pj4+PiArCj4+Pj4+ICsgICAgcmV0dXJuIHJldDsKPj4+Pj4gICAgfQo+Pj4+
Pgo+Pj4+PiAgICB2b2lkIG5vdXZlYXVfZ2VtX3ByaW1lX3VucGluKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqKQo+Pj4+PiAtLQo+Pj4+PiAyLjI1LjEKPj4+Pj4KPj4KPj4gLS0KPj4gRGFuaWVs
IFZldHRlcgo+PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPj4gaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXUK
