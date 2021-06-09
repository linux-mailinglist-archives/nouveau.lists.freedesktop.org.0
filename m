Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261983A17F6
	for <lists+nouveau@lfdr.de>; Wed,  9 Jun 2021 16:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DA06E059;
	Wed,  9 Jun 2021 14:52:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EC16E059;
 Wed,  9 Jun 2021 14:52:35 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id b14so26279740ilq.7;
 Wed, 09 Jun 2021 07:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g6kmw8K4NVOjfm80qKIii8vlGgWXSA520RlIgHO8Yb4=;
 b=iOygF/OZ+8OUprxAN/JdngI4LKQdwuqUdVRlfb9n7vHGK1GIXrnbhjPR7vOF/VmT4f
 NYt2OLrPlOL/ldX1eadQPdgdJvlwfGjO0NTLTnDAKd8gmiRlVtOBsmqho6j7HiWbMPPA
 NIR6CX9Hi+v7HBIAXAxcfpXOqDsHt81LDkSZagiAhmgg+n/JqX3kL7tldXleoczIjQNU
 X9n9kwx7CepzAbja6N958d9IVDm+iAuAEOsGafY3J4gM+7QG1ZsfcnmyQ5g+jQIhWlUM
 E9TY+P23tLVOIyMKhXRyihNUNJSwBoSCFYBDvzAVyh+NDKkN7RLYOAacDVY00j1ou3hv
 U8NQ==
X-Gm-Message-State: AOAM5338roNX74SFeerWKC/2Kkk0+ZtpVV3hbqsKVpwBhLsUX0IoM+Q2
 1v72EmC+vJirKJemUmBzPxhSDyQpLlAmetnnyyA=
X-Google-Smtp-Source: ABdhPJwOEVIdBD1niBDUdAkWBw+dsLEFdp+UdqONoNjS03w5Wptmn1Ai6NpFrW05sn0t4+Zkq1uUrVf0bg33ef8fqrk=
X-Received: by 2002:a6b:f805:: with SMTP id o5mr22516174ioh.55.1623250354514; 
 Wed, 09 Jun 2021 07:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <2e4987b0-7fc9-d217-450c-943de430dbd1@kapsi.fi>
 <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
In-Reply-To: <816b619b-ff20-009a-ea05-504497c1946b@amd.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 9 Jun 2021 10:52:23 -0400
Message-ID: <CAKb7UvjrxXyvr9qpLbkoDQ2eScj4YdayP6OnG8rZnmEn1hyKvw@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [Nouveau] Trouble with TTM patches w/nouveau in linux-next
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, ray.huang@amd.com,
 matthew.auld@intel.com, linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Q2hyaXN0aWFuIC0gcG90ZW50aWFsbHkgcmVsZXZhbnQgaXMgdGhhdCBUZWdyYSBkb2Vzbid0IGhh
dmUgVlJBTSBhdAphbGwgLS0gYWxsIEdUVCAob3IgR0FSVCBvciB3aGF0ZXZlciBpdCdzIGNhbGxl
ZCBub3dhZGF5cykuIE5vCmZha2Uvc3RvbGVuIFZSQU0uCgpDaGVlcnMsCgogIC1pbGlhCgpPbiBX
ZWQsIEp1biA5LCAyMDIxIGF0IDEwOjE4IEFNIENocmlzdGlhbiBLw7ZuaWcKPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBIaSBNaWtrbywKPgo+IHN0cmFuZ2Ugc291bmRzIGxp
a2UgTm91dmVhdSB3YXMgc29tZWhvdyBhbHNvIHVzaW5nIHRoZSBHRU0gd29ya2Fyb3VuZAo+IGZv
ciBWTVdHRlggYXMgd2VsbC4KPgo+IEJ1dCAtMTIgbWVhbnMgLUVOT01FTSB3aGljaCBkb2Vzbid0
IGZpdHMgaW50byB0aGUgcGljdHVyZS4KPgo+IEkgd2lsbCB0cnkgd2l0aCBhIEc3MTAsIGJ1dCBp
ZiB0aGF0IGRvZXNuJ3QgeWllbGRzIGFueXRoaW5nIEkgbmVlZCBzb21lCj4gbW9yZSBpbnB1dCBm
cm9tIHlvdS4KPgo+IFRoYW5rcyBmb3IgdGhlIHJlcG9ydCwKPiBDaHJpc3RpYW4uCj4KPgo+IEFt
IDA5LjA2LjIxIHVtIDE1OjQ3IHNjaHJpZWIgTWlra28gUGVydHR1bmVuOgo+ID4gSGksCj4gPgo+
ID4gSSdtIG9ic2VydmluZyBub3V2ZWF1IG5vdCBpbml0aWFsaXppbmcgcmVjZW50bHkgb24gbGlu
dXgtbmV4dCBvbiBteQo+ID4gVGVncmExODYgSmV0c29uIFRYMiBib2FyZC4gU3BlY2lmaWNhbGx5
IGl0IGxvb2tzIGxpa2UgQk8gYWxsb2NhdGlvbiBpcwo+ID4gZmFpbGluZyB3aGVuIGluaXRpYWxp
emluZyB0aGUgc3luYyBzdWJzeXN0ZW06Cj4gPgo+ID4gWyAgIDIxLjg1ODE0OV0gbm91dmVhdSAx
NzAwMDAwMC5ncHU6IERSTTogZmFpbGVkIHRvIGluaXRpYWxpc2Ugc3luYwo+ID4gc3Vic3lzdGVt
LCAtMjgKPiA+Cj4gPiBJIGhhdmUgYmVlbiBiaXNlY3RpbmcgYW5kIEkgaGF2ZSBmb3VuZCB0d28g
cGF0Y2hlcyB0aGF0IGFmZmVjdCB0aGlzLgo+ID4gRmlyc3RseSwgdGhpbmdzIGZpcnN0IGJyZWFr
IG9uCj4gPgo+ID4gZDAyMTE3ZjhlZmFhIGRybS90dG06IHJlbW92ZSBzcGVjaWFsIGhhbmRsaW5n
IGZvciBub24gR0VNIGRyaXZlcnMKPiA+Cj4gPiBzdGFydGluZyB0byByZXR1cm4gZXJyb3IgY29k
ZSAtMTIuIFRoZW4sIGF0Cj4gPgo+ID4gZDc5MDI1YzdmNWUzIGRybS90dG06IGFsd2F5cyBpbml0
aWFsaXplIHRoZSBmdWxsIHR0bV9yZXNvdXJjZSB2Mgo+ID4KPiA+IHRoZSBlcnJvciBjb2RlIGNo
YW5nZXMgdG8gdGhlIGFib3ZlIC0yOC4KPiA+Cj4gPiBJZiBJIGNoZWNrb3V0IG9uZSBjb21taXQg
cHJpb3IgdG8gZDc5MDI1YzdmNWUzIGFuZCByZXZlcnQKPiA+IGQwMjExN2Y4ZWZhYSwgdGhpbmdz
IHdvcmsgYWdhaW4uIFRoZXJlIGFyZSBhIGJ1bmNoIG9mIG90aGVyIFRUTQo+ID4gY29tbWl0cyBi
ZXR3ZWVuIHRoaXMgYW5kIEhFQUQsIHNvIHJldmVydGluZyB0aGVzZSBvbiB0b3Agb2YgSEVBRAo+
ID4gZG9lc24ndCB3b3JrLiBIb3dldmVyLCBJIGNoZWNrZWQgdGhhdCBib3RoIHllc3RlcmRheSdz
IGFuZCB0b2RheSdzCj4gPiBuZXh0cyBhcmUgYWxzbyBicm9rZW4uCj4gPgo+ID4gVGhhbmsgeW91
LAo+ID4gTWlra28KPiA+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IE5vdXZlYXUgbWFpbGluZyBsaXN0Cj4gTm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Tm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
