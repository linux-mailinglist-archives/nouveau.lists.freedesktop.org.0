Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08835311580
	for <lists+nouveau@lfdr.de>; Fri,  5 Feb 2021 23:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9F5887EF;
	Fri,  5 Feb 2021 22:38:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04DC887EF
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 22:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612564707;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sT5gFUOksj4b4OKsSkY1SHtvx5Do/92CyZB4jSofSZ4=;
 b=BX/vx1tfu1Agh8J2WBPg3fZ1BC8Ac3nZvbtNZIdSDNfFjQ20nice8biSe/BYRdBse4TIDG
 2mpgxyL1n6MglQI/Xt08ntR/QPnorcTgGZ2FHq1RjHU1eaYX4C0Z4yWKw50lGzkanOwv4M
 L/4pA16GvFmAuiG127g1hqPx21/eoM8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-XdcZXdtcOFaweNrQJ--UXQ-1; Fri, 05 Feb 2021 17:38:22 -0500
X-MC-Unique: XdcZXdtcOFaweNrQJ--UXQ-1
Received: by mail-qv1-f72.google.com with SMTP id u8so6150532qvm.5
 for <nouveau@lists.freedesktop.org>; Fri, 05 Feb 2021 14:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=sT5gFUOksj4b4OKsSkY1SHtvx5Do/92CyZB4jSofSZ4=;
 b=DaP4ejEdLQ4otYluzYBUB/a7BOT6XHHtFTOczf5Lr/qVy4qEM86Y7C8P2pym6YQe3G
 5b5679sTl2BONl3PkY+J3mXVhn50dviUREkW3mraMLGooby/yy8NJ4YTJvr8DtGpwJCa
 saEmECmTxRh9G9wUowMvcQprBMnz3WjOSjNa6gKdSjkMC3lswcLjzerqmPMO4omUCdJs
 YLyTzvTYqpyuvMkLt1hI8+f7fDjuYkZm2AvtDffn23jlZKN/XtZLRmptk7SXABrjkZcy
 UaLDh1HobXvxrFNqZg1PMrTFUaTuWR1zLM0pL9vjZ0Sq0eNX7g0H9cG5S1dLvJyOmjE5
 Ig+g==
X-Gm-Message-State: AOAM532hW7GJH5rIrLTPAFao8C8S+wfZSdWwA/yDg8lJjC1KPxnBHoaP
 dm5U4IFP/HbAS25/LlFEg+msMDcPFXeE9s0tk7n9Qu1CSAzgfQ2hfXO8lLicDMv0Ft1jTe1/P3H
 8nPFLGNYzMFhOLNb3zHZc9mgtlw==
X-Received: by 2002:ac8:82b:: with SMTP id u40mr6518700qth.332.1612564702478; 
 Fri, 05 Feb 2021 14:38:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXsZft6rvQGQMoWkpOOIRa/mLda97/5KgvaVrmgKTNDNbfT7gP5RQuSo23rq5CTEYNzLUnMw==
X-Received: by 2002:ac8:82b:: with SMTP id u40mr6518685qth.332.1612564702254; 
 Fri, 05 Feb 2021 14:38:22 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id d10sm9558393qto.81.2021.02.05.14.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:38:21 -0800 (PST)
Message-ID: <af9965362f40415e3a4b8f6677a62fd5dcfdcde2.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>, Simon Ser <contact@emersion.fr>
Date: Fri, 05 Feb 2021 17:38:20 -0500
In-Reply-To: <CAKb7Uvi0qV7MMRQ6kDw_aNtcVjcQj7zZ=TNLxxQhta9fRJ0vCA@mail.gmail.com>
References: <20210205222442.19555-1-contact@emersion.fr>
 <CAKb7Uvi0qV7MMRQ6kDw_aNtcVjcQj7zZ=TNLxxQhta9fRJ0vCA@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH v3] nouveau/dispnv50: add cursor pitch check
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTAyLTA1IGF0IDE3OjM2IC0wNTAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBP
biBGcmksIEZlYiA1LCAyMDIxIGF0IDU6MjQgUE0gU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9u
LmZyPiB3cm90ZToKPiA+IAo+ID4gVGhlIGhhcmR3YXJlIG5lZWRzIGEgRkIgd2hpY2ggaXMgcGFj
a2VkLiBBZGQgY2hlY2tzIHRvIG1ha2Ugc3VyZQo+ID4gdGhpcyBpcyB0aGUgY2FzZS4KPiA+IAo+
ID4gV2hpbGUgYXQgaXQsIGFkZCBkZWJ1ZyBsb2dzIGZvciB0aGUgZXhpc3RpbmcgY2hlY2tzLiBU
aGlzIGFsbG93cwo+ID4gdXNlci1zcGFjZSB0byBtb3JlIGVhc2lseSBmaWd1cmUgb3V0IHdoeSBh
IGNvbmZpZ3VyYXRpb24gaXMKPiA+IHJlamVjdGVkLgo+ID4gCj4gPiB2MjoKPiA+IC0gVXNlIGRy
bV9mb3JtYXRfaW5mbyBpbnN0ZWFkIG9mIGhhcmRjb2RpbmcgYnl0ZXMtcGVyLXBpeGVsIChJbGlh
KQo+ID4gLSBSZW1vdmUgdW5uZWNlc3Nhcnkgc2l6ZSBjaGVjayAoSWxpYSkKPiA+IAo+ID4gdjM6
Cj4gPiAtIEFkZCBtaXNzaW5nIG5ld2xpbmVzIGluIGRlYnVnIG1lc3NhZ2VzIChMeXVkZSkKPiA+
IC0gVXNlIE5WX0FUT01JQyAoTHl1ZGUpCj4gPiAtIEFkZCBtaXNzaW5nIGRlYnVnIGxvZyBmb3Ig
aW52YWxpZCBmb3JtYXQgKElsaWEpCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8
Y29udGFjdEBlbWVyc2lvbi5mcj4KPiA+IFJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUBy
ZWRoYXQuY29tPgo+ID4gQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiA+IENj
OiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+Cj4gPiAtLS0KPiA+IMKgZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3VyczUwN2EuYyB8IDMxICsrKysrKysrKysrKysr
KysrKystLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djUwL2N1cnM1MDdhLmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3Vy
czUwN2EuYwo+ID4gaW5kZXggNTRmYmQ2ZmU3NTFkLi41NjQ1OWNmZDAzN2UgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jdXJzNTA3YS5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jdXJzNTA3YS5jCj4gPiBAQCAtMzAs
NiArMzAsNyBAQAo+ID4gCj4gPiDCoCNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4K
PiA+IMKgI2luY2x1ZGUgPGRybS9kcm1fcGxhbmVfaGVscGVyLmg+Cj4gPiArI2luY2x1ZGUgPGRy
bS9kcm1fZm91cmNjLmg+Cj4gCj4gV2h5IGlzIHRoaXMgbmVlZGVkPwo+IAo+ID4gCj4gPiDCoGJv
b2wKPiA+IMKgY3VyczUwN2Ffc3BhY2Uoc3RydWN0IG52NTBfd25kdyAqd25kdykKPiA+IEBAIC05
OSw2ICsxMDAsOCBAQCBjdXJzNTA3YV9hY3F1aXJlKHN0cnVjdCBudjUwX3duZHcgKnduZHcsIHN0
cnVjdAo+ID4gbnY1MF93bmR3X2F0b20gKmFzeXcsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgbnY1MF9oZWFkX2F0b20gKmFzeWgpCj4gPiDCoHsKPiA+IMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBudjUwX2hlYWQgKmhlYWQgPSBudjUwX2hlYWQoYXN5dy0+c3RhdGUu
Y3J0Yyk7Cj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91dmVh
dV9kcm0oaGVhZC0+YmFzZS5iYXNlLmRldik7Cj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1f
ZnJhbWVidWZmZXIgKmZiID0gYXN5dy0+c3RhdGUuZmI7Cj4gPiDCoMKgwqDCoMKgwqDCoCBpbnQg
cmV0Owo+ID4gCj4gPiDCoMKgwqDCoMKgwqDCoCByZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVj
a19wbGFuZV9zdGF0ZSgmYXN5dy0+c3RhdGUsICZhc3loLQo+ID4gPnN0YXRlLAo+ID4gQEAgLTEw
OSwxNCArMTEyLDM2IEBAIGN1cnM1MDdhX2FjcXVpcmUoc3RydWN0IG52NTBfd25kdyAqd25kdywg
c3RydWN0Cj4gPiBudjUwX3duZHdfYXRvbSAqYXN5dywKPiA+IMKgwqDCoMKgwqDCoMKgIGlmIChy
ZXQgfHwgIWFzeWgtPmN1cnMudmlzaWJsZSkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gcmV0Owo+ID4gCj4gPiAtwqDCoMKgwqDCoMKgIGlmIChhc3l3LT5pbWFnZS53
ICE9IGFzeXctPmltYWdlLmgpCj4gPiArwqDCoMKgwqDCoMKgIGlmIChhc3l3LT5pbWFnZS53ICE9
IGFzeXctPmltYWdlLmgpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5WX0FU
T01JQyhkcm0sCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICJJbnZhbGlkIGN1cnNvciBpbWFnZSBzaXplOiB3aWR0aCAoJWQpIG11c3QgbWF0Y2gK
PiA+IGhlaWdodCAoJWQpXG4iLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBhc3l3LT5pbWFnZS53LCBhc3l3LT5pbWFnZS5oKTsKPiAKPiBNYXli
ZSBrZWVwIHdpdGggdGhlIHN0eWxlIG9mIHRoZSBvdGhlciBOVl9BVE9NSUMncywgZS5nLiBpbmNs
dWRlICVzOgo+IGF0IHRoZSBiZWdpbm5pbmcgd2l0aCB3bmR3LT5wbGFuZS5uYW1lIGFzIHRoZSB2
YWx1ZT8KClNlY29uZGVkIG9uIHRoYXQgLSB0aGFua3MgZm9yIGNhdGNoaW5nIHRoYXQhCgo+IAo+
IEVpdGhlciB3YXksCj4gCj4gUmV2aWV3ZWQtYnk6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0u
bWl0LmVkdT4KPiAKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJ
TlZBTDsKPiA+ICvCoMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoYXN5dy0+aW1h
Z2UucGl0Y2hbMF0gIT0gYXN5dy0+aW1hZ2UudyAqIGZiLT5mb3JtYXQtPmNwcFswXSkgewo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTlZfQVRPTUlDKGRybSwKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkludmFsaWQgY3Vyc29y
IGltYWdlIHBpdGNoOiBpbWFnZSBtdXN0IGJlIHBhY2tlZAo+ID4gKHBpdGNoID0gJWQsIHdpZHRo
ID0gJWQpXG4iLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBhc3l3LT5pbWFnZS5waXRjaFswXSwgYXN5dy0+aW1hZ2Uudyk7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiA+ICvCoMKgwqDCoMKgwqAg
fQo+ID4gCj4gPiDCoMKgwqDCoMKgwqDCoCByZXQgPSBoZWFkLT5mdW5jLT5jdXJzX2xheW91dCho
ZWFkLCBhc3l3LCBhc3loKTsKPiA+IC3CoMKgwqDCoMKgwqAgaWYgKHJldCkKPiA+ICvCoMKgwqDC
oMKgwqAgaWYgKHJldCkgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTlZfQVRP
TUlDKGRybSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgIkludmFsaWQgY3Vyc29yIGltYWdlIHNpemU6IHVuc3VwcG9ydGVkIHNpemUKPiA+ICVk
eCVkXG4iLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBhc3l3LT5pbWFnZS53LCBhc3l3LT5pbWFnZS5oKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gPiArwqDCoMKgwqDCoMKgIH0KPiA+ICsKPiA+ICvC
oMKgwqDCoMKgwqAgcmV0ID0gaGVhZC0+ZnVuYy0+Y3Vyc19mb3JtYXQoaGVhZCwgYXN5dywgYXN5
aCk7Cj4gPiArwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIE5WX0FUT01JQyhkcm0sCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJJbnZhbGlkIGN1cnNvciBpbWFnZSBmb3JtYXQgMHglWFxu
IiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZmItPmZvcm1hdC0+Zm9ybWF0KTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gcmV0Owo+ID4gK8KgwqDCoMKgwqDCoCB9Cj4gPiAKPiA+IC3CoMKgwqDCoMKgwqAgcmV0
dXJuIGhlYWQtPmZ1bmMtPmN1cnNfZm9ybWF0KGhlYWQsIGFzeXcsIGFzeWgpOwo+ID4gK8KgwqDC
oMKgwqDCoCByZXR1cm4gMDsKPiA+IMKgfQo+ID4gCj4gPiDCoHN0YXRpYyBjb25zdCB1MzIKPiA+
IC0tCj4gPiAyLjMwLjAKPiA+IAo+IAoKLS0gClNpbmNlcmVseSwKICAgTHl1ZGUgUGF1bCAoc2hl
L2hlcikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAogICAKTm90ZTogSSBkZWFsIHdp
dGggYSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1Z3Mgb24gbXkgcGxhdGUuIElm
IHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBmb3IgYSByZXZpZXcvbWVy
Z2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3BvbmRlZCBpbiBhIHdoaWxlLCBw
bGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFpbCB0byBjaGVjawpvbiBteSBz
dGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQo=
