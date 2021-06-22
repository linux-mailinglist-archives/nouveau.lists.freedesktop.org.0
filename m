Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C9A3B0019
	for <lists+nouveau@lfdr.de>; Tue, 22 Jun 2021 11:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B086E456;
	Tue, 22 Jun 2021 09:20:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DE16E456
 for <nouveau@lists.freedesktop.org>; Tue, 22 Jun 2021 09:20:49 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 b24-20020a4a34180000b029024b199e7d4dso4876764ooa.4
 for <nouveau@lists.freedesktop.org>; Tue, 22 Jun 2021 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B0CLRv/C97SIL4mDRjWeR2RS/vw2/AXlOiSHFmBfaag=;
 b=iXyQoMTlfsopHp7iUDCM50Nbt8fJ0O4Y/hzi7SqPnEBKB+F2nCcWCTEjeR/Rm5vwYJ
 6GurH29V+pDQhvsuH8KEjYTLVuM/AOgTeToykj4dLY5ugg1UJl4O8FGiKggvZUSj7gDB
 9TOraxxUNlsd1zUSqN/1hwfpiBNZOvIhBNTNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B0CLRv/C97SIL4mDRjWeR2RS/vw2/AXlOiSHFmBfaag=;
 b=F5Jx0RflxjQ+KDITC00X6Nvh7Nt5Bh+T5+gp3cP7wRTZx6LNEwq1OM/xNUXcUCWroJ
 ZoYGpb0k5tnJoFFcuzvynX/ZQBrzvWX/VPxG5T/wrwfcQtRhTNVNXxge3h+ZmUFWsmWk
 bmZgCyy8undlPfbnJnUMEb/YNHkuedRhTqdpXZzXv7w248rapCkKAyLgsku8d9M8upYY
 tyb4Xiu+QMqXTqzzv56b228mSkAI3sElsrtTK/ewhZGa4w79k/OVPkSNJyKEvHzx4SfT
 b4HGM57vXjyHYqMsVz+TNfb4a6NIk4C5SA8rrxyYs4NtufyFNNXmCvk8sxel8tu131FA
 jhAw==
X-Gm-Message-State: AOAM532HN/cMu2IjHbzqMDorrTKWRro8d9Yaj8qxh6VLTaTrh+ANQvYQ
 ngK/02cJbKi9wY20rDGj6bryWNDlj4hYl/wPdIKvuQ==
X-Google-Smtp-Source: ABdhPJyXDdHBte8f3i/aHTI1hWl//Nq8BnqMgfp8TRuBWA/zUcgICOOM03TiXWCNBTBU6rvXyp5dZmjeybWnMHyRq4w=
X-Received: by 2002:a4a:9b99:: with SMTP id x25mr2429637ooj.85.1624353648166; 
 Tue, 22 Jun 2021 02:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210621130328.11070-1-christian.koenig@amd.com>
 <YNCoK1qv6CCIy0Rl@phenom.ffwll.local>
 <2033755d-c49f-8b90-f726-d640146a3df7@gmail.com>
 <CAKMK7uEET_E7eJa1No3KLMBudgE16ymXzXZp0CRYt_ZjS-_YsA@mail.gmail.com>
In-Reply-To: <CAKMK7uEET_E7eJa1No3KLMBudgE16ymXzXZp0CRYt_ZjS-_YsA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 22 Jun 2021 11:20:37 +0200
Message-ID: <CAKMK7uECbQ+Fk6y9rsGdGdh4fEErhjUjSGicJLifnENAhjnZZw@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjEsIDIwMjEgYXQgNTo1MyBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMjEsIDIwMjEgYXQgNTo0OSBQTSBDaHJpc3Rp
YW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPiA+
Cj4gPiBBbSAyMS4wNi4yMSB1bSAxNjo1NCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiA+IE9u
IE1vbiwgSnVuIDIxLCAyMDIxIGF0IDAzOjAzOjI2UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6Cj4gPiA+PiBXZSBhY3R1YWxseSBuZWVkIHRvIHdhaXQgZm9yIHRoZSBtb3ZpbmcgZmVu
Y2UgYWZ0ZXIgcGlubmluZwo+ID4gPj4gdGhlIEJPIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBwaW4g
aXMgY29tcGxldGVkLgo+ID4gPj4KPiA+ID4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+ID4+IENDOiBzdGFibGVAa2VybmVsLm9y
Zwo+ID4gPj4gLS0tCj4gPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfcHJp
bWUuYyB8IDggKysrKysrKy0KPiA+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+ID4gPj4KPiA+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X3ByaW1lLmMKPiA+ID4+IGluZGV4IDM0NzQ4ODY4NWY3NC4uNTkxNzM4NTQ1ZWJhIDEwMDY0
NAo+ID4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9wcmltZS5jCj4g
PiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3ByaW1lLmMKPiA+ID4+
IEBAIC05Myw3ICs5MywxMyBAQCBpbnQgbm91dmVhdV9nZW1fcHJpbWVfcGluKHN0cnVjdCBkcm1f
Z2VtX29iamVjdCAqb2JqKQo+ID4gPj4gICAgICBpZiAocmV0KQo+ID4gPj4gICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ID4gPj4KPiA+ID4+IC0gICAgcmV0dXJuIDA7Cj4gPiA+PiArICAg
IGlmIChudmJvLT5iby5tb3ZpbmcpIHsKPiA+ID4gRG9uJ3Qgd2UgbmVlZCB0byBob2xkIHRoZSBk
bWFfcmVzdiB0byByZWFkIHRoaXM/IFdlIGNhbiBncmFiIGEgcmVmZXJlbmNlCj4gPiA+IGFuZCB0
aGVuIHVubG9jaywgYnV0IEkgdGhpbmsganVzdCB1bmxvY2tlZCB3YWl0IGNhbiBnbyBib29tIHBy
ZXR0eSBlYXNpbHkKPiA+ID4gKHNpbmNlIHdlIGRvbid0IGhvbGQgYSByZWZlcmVuY2Ugb3IgbG9j
ayBzbyBzb21lb25lIGVsc2UgY2FuIGp1bXAgaW4gYW5kCj4gPiA+IGZyZWUgdGhlIG1vdmluZyBm
ZW5jZSkuCj4gPgo+ID4gVGhlIG1vdmluZyBmZW5jZSBpcyBvbmx5IG1vZGlmaWVkIHdoaWxlIHRo
ZSBCTyBpcyBtb3ZlZCBhbmQgc2luY2Ugd2UKPiA+IGhhdmUganVzdCBzdWNjZXNzZnVsbHkgcGlu
bmVkIGl0Li4uLgo+Cj4gWWVhaCAgLi4uIHNvIHByb2JhYmx5IGNvcnJlY3QsIGJ1dCByZWFsbHkg
dHJpY2t5LiBKdXN0IHdyYXBwaW5nIGEKPiB0dG1fYm9fcmVzZXJ2ZS91bnJlc2VydmUgYXJvdW5k
IHRoZSBjb2RlIHlvdSBhZGQgc2hvdWxkIGJlIGVub3VnaCBhbmQKPiBnZXQgdGhlIGpvYiBkb25l
PwoKSSB0aGluayB5b3UgZGlzdHJhY3RlZCBtZSBhIGJpdCB3aXRoIHRoZSAiaXQgY2FuJ3QgbW92
ZSIsIHNvIHllcwp0aGVyZSdzIGEgZ3VhcmFudGVlIHRoYXQgbm8gb3RoZXIgZmVuY2UgY2FuIHNo
b3cgdXAgaW4gdHRtX2JvLT5tb3ZpbmcKYW5kIGNvbmZ1c2UgdXMuIEJ1dCBpdCBjb3VsZCBnZXQg
c2V0IHRvIE5VTEwgYmVjYXVzZSBzb21lb25lIHJlYWxpemVkCml0IHNpZ25hbGxlZC4gV2UncmUg
bm90IGRvaW5nIHRoYXQgc3lzdGVtYXRpY2FsbHksIGJ1dCByZWx5aW5nIG9uCmZlbmNlcyBuZXZl
ciBnZXR0aW5nIGdhcmJhZ2UtY29sbGVjdGVkIGZvciBjb3JyZWN0bmVzcyBpc24ndCBncmVhdC4K
ClNvdCB0aGUgdHRtX2JvX3Jlc2VydmUvdW5yZXNlcnZlIGlzIGRlZmluaXRlbHkgbmVlZGVkIGhl
cmUgYXJvdW5kIHRoaXMKYml0IG9mIGNvZGUuIFlvdSBkb24ndCBuZWVkIHRvIG1lcmdlIGl0IHdp
dGggdGhlIHJlc2VydmUvdW5yZXNlcnZlIGluCnRoZSBwaW4gZnVuY3Rpb24gdGhvdWdoLCBpdCdz
IGp1c3QgdG8gcHJvdGVjdCBhZ2FpbnN0IHRoZQp1c2UtYWZ0ZXItZnJlZS4KLURhbmllbAoKPgo+
ID4gQnV0IGluIGdlbmVyYWwgSSBhZ3JlZSB0aGF0IGl0IHdvdWxkIGJlIGJldHRlciB0byBhdm9p
ZCB0aGlzLiBJIGp1c3QKPiA+IGRpZG4ndCB3YW50ZWQgdG8gb3BlbiBhIGJpZ2dlciBjYW4gb2Yg
d29ybXMgYnkgY2hhbmdpbmcgbm91dmVhdSBzbyBtdWNoLgo+Cj4gWWVhaCwgYnV0IEknbSBraW5k
YSB0aGlua2luZyBvZiBzb21lIGhlbHBlcnMgdG8gd2FpdCBmb3IgdGhlIG1vdmUKPiBmZW5jZSAo
c28gdGhhdCBsYXRlciBvbiB3ZSBjYW4gc3dpdGNoIGZyb20gaGF2aW5nIHRoZSBleGNsdXNpdmUg
ZmVuY2UKPiB0byB0aGUgbW92ZSBmZW5jZSBkbyB0aGF0LCBtYXliZSkuIEFuZCB0aGVuIGxvY2tp
bmcgY2hlY2tzIGluIHRoZXJlCj4gd291bGQgYmUgbmljZS4KPgo+IEFsc28gYXZvaWRzIHRoZSBj
YXNlIG9mIGV4cGxhaW5pbmcgd2h5IGxvY2tsZXNzIGhlcmUgaXMgZmluZSwgYnV0Cj4gbG9ja2xl
c3Mgd2FpdCBmb3IgdGhlIGV4Y2x1c2l2ZSBmZW5jZSBpbiBlLmcuIGEgZHluYW1pIGRtYS1idWYK
PiBpbXBvcnRlciBpcyB2ZXJ5IG11Y2ggbm90IGZpbmUgYXQgYWxsLiBKdXN0IGFsbCBhcm91bmQg
bGVzcyB0cm91YmxlLgo+IC1EYW5pZWwKPgo+ID4KPiA+IENocmlzdGlhbi4KPiA+Cj4gPiA+IC1E
YW5pZWwKPiA+ID4KPiA+ID4+ICsgICAgICAgICAgICByZXQgPSBkbWFfZmVuY2Vfd2FpdChudmJv
LT5iby5tb3ZpbmcsIHRydWUpOwo+ID4gPj4gKyAgICAgICAgICAgIGlmIChyZXQpCj4gPiA+PiAr
ICAgICAgICAgICAgICAgICAgICBub3V2ZWF1X2JvX3VucGluKG52Ym8pOwo+ID4gPj4gKyAgICB9
Cj4gPiA+PiArCj4gPiA+PiArICAgIHJldHVybiByZXQ7Cj4gPiA+PiAgIH0KPiA+ID4+Cj4gPiA+
PiAgIHZvaWQgbm91dmVhdV9nZW1fcHJpbWVfdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmopCj4gPiA+PiAtLQo+ID4gPj4gMi4yNS4xCj4gPiA+Pgo+ID4KPgo+Cj4gLS0KPiBEYW5pZWwg
VmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Js
b2cuZmZ3bGwuY2gKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vbm91dmVhdQo=
