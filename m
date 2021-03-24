Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D473484A5
	for <lists+nouveau@lfdr.de>; Wed, 24 Mar 2021 23:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD686EAA0;
	Wed, 24 Mar 2021 22:32:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42BC6EA9F
 for <nouveau@lists.freedesktop.org>; Wed, 24 Mar 2021 22:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616625161;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZDjqduBNfm0vLO9Elg+d/3qUbSImb2hg6PNhLUgfUs=;
 b=ahywgqR4mAgm7+od+Xc2kMbBsnSKfWYyl994ZniF1xlR4kgq/Z4+QSTGqEXZo6bfbmtVu9
 WguPpBh3UHBLXr/bXmNKjHdvR5X6AkfHgwtHP0SIJvqUPMMnN9kD7hZVABctuGTog9s1Cs
 l++xWj+rvdIk9Lb2xqeZxu4OQI/e9k0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-InlHETEiNH2wtcg35-WaIg-1; Wed, 24 Mar 2021 18:32:39 -0400
X-MC-Unique: InlHETEiNH2wtcg35-WaIg-1
Received: by mail-qt1-f199.google.com with SMTP id d11so2183924qth.3
 for <nouveau@lists.freedesktop.org>; Wed, 24 Mar 2021 15:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=+ZDjqduBNfm0vLO9Elg+d/3qUbSImb2hg6PNhLUgfUs=;
 b=sQ3WcBkhmYQsEcHlnIAdHbpxg/OOUtFzTUc4EnT0LQiEjeiknP+2OyQT627K526Fo1
 B5KA76ZOqWJBZzMBXx9R7pZDbhJlSdMUyBBnWDovKk1FbRPZ67+crqURd2XD5eQ6Xf6W
 pD1ACsE51G47A0Q/JbujBfm2/eFFBNZFlTUC7X5yQZa7iMIAGr5KqCyUV6WfdjRB0Boq
 kE5O/2zCHAXx5/+TiqLwMCufr3QqhgL/oFV0LLqKKfv6PkuUhgelqqD2YiyhfeTrGrj+
 mw2fI4iEzmhgMjWFvrwkP7irYpuJhrisGmfvM4PzffD0lUzZEjekCdv+AcZ1l8v4CCrW
 svGQ==
X-Gm-Message-State: AOAM531z2O0DmBJt14raP6i4KDIyKia+b6lSpFe4a1HxvJPQsZiVWiHz
 389IeIjz4s+I+d1ASu8QGxwi0xJiVrEYnnc2EctqpalXCx/6B/elQrfQEkpMXFhWYvhHAwn7sqF
 MhYD2W8Tzx99NYmepFrJJ7wx2uQ==
X-Received: by 2002:ac8:5313:: with SMTP id t19mr5110727qtn.148.1616625159461; 
 Wed, 24 Mar 2021 15:32:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjRHafADWIFFkLVEEynEbwKB5k4QbadiQh2nOAyaZ7Fq1sW7jabHOdN1wwpYEyqUprOSAnVg==
X-Received: by 2002:ac8:5313:: with SMTP id t19mr5110715qtn.148.1616625159290; 
 Wed, 24 Mar 2021 15:32:39 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id r35sm2414211qtd.95.2021.03.24.15.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 15:32:38 -0700 (PDT)
Message-ID: <363102914fd2e16088d10af14ee71e0112566e64.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 24 Mar 2021 18:32:37 -0400
In-Reply-To: <YFRpTVxr8Kso/7ky@platvala-desk.ger.corp.intel.com>
References: <20210317223827.446803-1-lyude@redhat.com>
 <f42f3af7-658e-b06f-fb79-c36273ac4810@mupuf.org>
 <YFMaG3tRgsiizy+J@platvala-desk.ger.corp.intel.com>
 <3c5108990850ae8f88952c3149eaa935f7e378e7.camel@redhat.com>
 <YFRpTVxr8Kso/7ky@platvala-desk.ger.corp.intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t] lib: Introduce the
 igt_nouveau library
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Martin Peres <martin.peres@mupuf.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTAzLTE5IGF0IDExOjA1ICswMjAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOgo+
IE9uIFRodSwgTWFyIDE4LCAyMDIxIGF0IDEyOjQ5OjEzUE0gLTA0MDAsIEx5dWRlIFBhdWwgd3Jv
dGU6Cj4gPiBPbiBUaHUsIDIwMjEtMDMtMTggYXQgMTE6MTUgKzAyMDAsIFBldHJpIExhdHZhbGEg
d3JvdGU6Cj4gPiA+IE9uIFRodSwgTWFyIDE4LCAyMDIxIGF0IDA5OjA2OjI5QU0gKzAyMDAsIE1h
cnRpbiBQZXJlcyB3cm90ZToKPiA+ID4gPiBPbiAxOC8wMy8yMDIxIDAwOjM4LCBMeXVkZSB3cm90
ZToKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS11YXBpL2RybV9mb3VyY2MuaCBi
L2luY2x1ZGUvZHJtLQo+ID4gPiA+ID4gdWFwaS9kcm1fZm91cmNjLmgKPiA+ID4gPiA+IGluZGV4
IGE3YmMwNThjLi44N2M4NzQ4NSAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2luY2x1ZGUvZHJtLXVh
cGkvZHJtX2ZvdXJjYy5oCj4gPiA+ID4gPiArKysgYi9pbmNsdWRlL2RybS11YXBpL2RybV9mb3Vy
Y2MuaAo+ID4gPiA+ID4gQEAgLTY4MSw3ICs2ODEsNyBAQCBkcm1fZm91cmNjX2Nhbm9uaWNhbGl6
ZV9udmlkaWFfZm9ybWF0X21vZChfX3U2NAo+ID4gPiA+ID4gbW9kaWZpZXIpCj4gPiA+ID4gPiDC
oCB9Cj4gPiA+ID4gPiDCoCAvKgo+ID4gPiA+ID4gLSAqIDE2QngyIEJsb2NrIExpbmVhciBsYXlv
dXQsIHVzZWQgYnkgVGVncmEgSzEgYW5kIGxhdGVyCj4gPiA+ID4gPiArICogMTZCeDIgQmxvY2sg
TGluZWFyIGxheW91dCwgdXNlZCBieSBkZXNrdG9wIEdQVXMsIGFuZCBUZWdyYSBLMSBhbmQKPiA+
ID4gPiA+IGxhdGVyCj4gPiA+ID4gCj4gPiA+ID4gTWF5YmUgcmVtb3ZlIG9uZSBvZiB0aGUgImFu
ZCJzPwo+ID4gPiA+IAo+ID4gPiA+IDE2QngyIEJsb2NrIExpbmVhciBsYXlvdXQsIHVzZWQgYnkg
ZGVza3RvcCBHUFVzLCBhbmQgVGVncmEgSzErCj4gPiA+IAo+ID4gPiBkcm1fZm91cmNjLmggaXMg
Y29waWVkIGZyb20gdGhlIGtlcm5lbCwgbm8gaGFuZC1lZGl0aW5nIGluIElHVC4KPiA+IAo+ID4g
VGhlc2UgYWRkaXRpb25zIGFyZSBhbGwgY29waWVkIGZyb20gdGhlIGRybV9mb3VyY2MuaCBmaWxl
IGluIHRoZSBrZXJuZWwKPiA+IHRob3VnaCwKPiA+IGRvIHlvdSB3YW50IG1lIHRvIGp1c3QgdXBk
YXRlIHRoZSB3aG9sZSBmaWxlIGluc3RlYWQ/Cj4gCj4gSXQgd2FzIG1vcmUgb2YgYSByZXNwb25z
ZSB0byBNYXJ0aW4ncyBzdWdnZXN0aW9uIHRoYXQgd291bGQgbmVlZCB0byBnbwo+IHRocm91Z2gg
dGhlIGtlcm5lbC4KPiAKPiBBcyBmb3IgdGhpcyBwYXRjaCB0byBJR1QsIHllcyBwbGVhc2UsIGNv
cHkgdGhlIGZpbGUgZnJvbSB0aGUga2VybmVsCj4gYXMtaXMuIEFzIGEgc2VwYXJhdGUgY29tbWl0
LCBjb21taXQgbWVzc2FnZSBzdGF0aW5nIHdoaWNoIFNIQSBpbgo+IGtlcm5lbCBpdCdzIGZyb20u
Cgpsb2wgLSBJIGp1c3QgcmVhbGl6ZWQgdGhpcyB3YXMgYmVjYXVzZSBJIHVwZGF0ZWQgdGhlIGZv
dXJjYyBmaWxlIGF0IHNvbWUgcG9pbnQsCmJ1dCB0aGVuIHNvbWVvbmUgdXBkYXRlZCBpdCBwcm9w
ZXJseSBpbiBpZ3Qgc28gdGhlIGNoYW5nZXMgdG8gZHJtX2ZvdXJjYy5oIHdlcmUKanVzdCBsZWZ0
b3ZlciByZWJhc2UgZ2FyYmFnZS4gb29wcyA6KQoKPiAKPiAKCi0tIApTaW5jZXJlbHksCiAgIEx5
dWRlIFBhdWwgKHNoZS9oZXIpCiAgIFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQKICAgCk5v
dGU6IEkgZGVhbCB3aXRoIGEgbG90IG9mIGVtYWlscyBhbmQgaGF2ZSBhIGxvdCBvZiBidWdzIG9u
IG15IHBsYXRlLiBJZiB5b3UndmUKYXNrZWQgbWUgYSBxdWVzdGlvbiwgYXJlIHdhaXRpbmcgZm9y
IGEgcmV2aWV3L21lcmdlIG9uIGEgcGF0Y2gsIGV0Yy4gYW5kIEkKaGF2ZW4ndCByZXNwb25kZWQg
aW4gYSB3aGlsZSwgcGxlYXNlIGZlZWwgZnJlZSB0byBzZW5kIG1lIGFub3RoZXIgZW1haWwgdG8g
Y2hlY2sKb24gbXkgc3RhdHVzLiBJIGRvbid0IGJpdGUhCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXUK
