Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E1F32B951
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 17:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E42C6E40B;
	Wed,  3 Mar 2021 16:52:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A829D6E40B
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614790321;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVLCdnJH1urOsLfjQLiFIHqVxaeVzNPym75ubWqLxR4=;
 b=LmHjekhkqj6IrM2H+joGU9+8GyA+mkbxmNWi7Iub69z03Yxr917NOWt6J2fQ3pUhVFILp5
 TWUWyXv85zNHQ/w43TN7zAvGbboFn4MFhcjTVGN/Hp4C4uDOh/Od+dSwB92y2MCkEd/v71
 5W81EUM9suXHfw6czP8Z20JADObBufw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-B-NuCuYrO1-3r5aQhZEgew-1; Wed, 03 Mar 2021 11:52:00 -0500
X-MC-Unique: B-NuCuYrO1-3r5aQhZEgew-1
Received: by mail-qk1-f198.google.com with SMTP id t6so16399573qkt.14
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 08:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=PVLCdnJH1urOsLfjQLiFIHqVxaeVzNPym75ubWqLxR4=;
 b=KCWR3Qi2RRWF69fgoUbkz3QnvPLBgQd4qbsvTTzmkVxW2rH/epnV81O150J5IY6uHN
 7G3T/SPh/A/cTj5NYow2KFRLgRsKmmOs0AUgyzVRgZw+3wHfzB+zenGy4u57EEC+qVz+
 nHXdhRpZt6FLRrbB9o2X//oqVeLPzYUn5Doq3gF3tvOZfKxC3lsuamYxUgMQsXnWXBZ4
 CeHhtGSkMECUTvLxlVbwO9QVOj1XO9Ldb6yX23dZtiuFKP66vygKESO3CnRmyGgZWDJh
 FAYyRDgPx/4cDpxZQXq89vu1S0g55d7KXuez8hKQXcbkm89jEBhd6HmEsBTJX8CWlrej
 3Q8Q==
X-Gm-Message-State: AOAM533harMZ+d/Rj0SYeRYGcg0SuDDyyRAWpA/SWVCCWycs6VQE7lbQ
 hdY5+6zVp44WM2Ss1cNL31Go9BW6ttYSwIyvLO3fPmi4nqHRDS6qBQKCzsFdKAo83HnMpN+o3JD
 ZRMX/TTRUIL/tTM+TDrj+ayiG6A==
X-Received: by 2002:ae9:eb8a:: with SMTP id
 b132mr24453026qkg.296.1614790318749; 
 Wed, 03 Mar 2021 08:51:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVPt9AWZN8STwpBGdgnH+4A1if150q/noZBh8/OLSgiml+l+P2zvY7nZfWwG0cyvE8eCDV0w==
X-Received: by 2002:ae9:eb8a:: with SMTP id
 b132mr24453013qkg.296.1614790318533; 
 Wed, 03 Mar 2021 08:51:58 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id k138sm8669108qke.60.2021.03.03.08.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 08:51:57 -0800 (PST)
Message-ID: <2dd41d05f6fff86cce7f5a08063de1509e2e3a42.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>, Alex Riesen
 <alexander.riesen@cetitec.com>
Date: Wed, 03 Mar 2021 11:51:56 -0500
In-Reply-To: <CAKb7Uvj1cGMx3R1dM2MYsFoP9g65c0Eg_pBROsfjicOv7jcBvg@mail.gmail.com>
References: <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
 <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
 <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
 <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
 <YD+D/zhUwC4zaO8v@pflmari>
 <CAKb7Uvj1cGMx3R1dM2MYsFoP9g65c0Eg_pBROsfjicOv7jcBvg@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTAzLTAzIGF0IDA4OjEyIC0wNTAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBP
biBXZWQsIE1hciAzLCAyMDIxIGF0IDc6NDEgQU0gQWxleCBSaWVzZW4gPGFsZXhhbmRlci5yaWVz
ZW5AY2V0aXRlYy5jb20+Cj4gd3JvdGU6Cj4gPiAKPiA+IElsaWEgTWlya2luLCBTYXQsIEZlYiAy
NywgMjAyMSAyMjoyNjo1NyArMDEwMDoKPiA+ID4gQ2FuIHlvdSB0cnkgQWxleCdzIHBhdGNoIHRv
IG1vZGV0ZXN0IGFuZCBjb25maXJtIHRoYXQgeW91IHNlZSBpc3N1ZXMKPiA+ID4gd2l0aCBtb2Rl
dGVzdD8gSWYgc28sIGNhbiB5b3UgKGFuZCBtYXliZSBBbGV4IGFzIHdlbGwpIHRyeSBhbiBvbGRl
cgo+ID4gPiBrZXJuZWwgKEknbSBvbiA1LjYpIGFuZCBzZWUgaWYgbW9kZXRlc3QgYmVoYXZlcyB3
ZWxsIHRoZXJlLiBbVGhlIHBhdGNoCj4gPiA+IGluIHF1ZXN0aW9uIHdhcyB0byBleHBvc2UgMjU2
eDI1NiBhcyB0aGUgJ3ByZWZlcnJlZCcgc2l6ZSwgYnV0IHN1cHBvcnQKPiA+ID4gZm9yIHRoZSBs
YXJnZXIgY3Vyc29ycyBoYXMgYmVlbiBhcm91bmQgZm9yIGEgd2hpbGUuXSBBbGV4IC0gaWYgeW91
Cj4gPiA+IGhhdmUgdGltZSwgc2FtZSBxdWVzdGlvbiB0byB5b3UuCj4gPiAKPiA+IFNvcnJ5IHRo
YXQgaXQgdG9vayBzbyBsb25nLiBJIHJldGVzdGV0IHdpdGggdGhlIHNhbWUga2VybmVsIGFzIFV3
ZSBkaWQKPiA+ICg1LjQuMTAxKSBhbmQgbXkgcmVzdWx0cyBhcmUgdGhlIHNhbWU6IG1vZGV0ZXN0
IHdpdGggNjQgYW5kIDEyOCBjdXJzb3JzCj4gPiBsb29rcwo+ID4gZ29vZCwgMjU2IGJyb2tlbi4g
RGlkbid0IHRlc3Qgd2l0aCBYIHRoaXMgdGltZSAodGhpcyBiZWluZyBteSBtYWluIG9mZmljZQo+
ID4gbWFjaGluZSksIGJ1dCBjYW4gZG8gbGF0ZXIgaWYgcmVxdWlyZWQuCj4gCj4gVGhhbmtzIGZv
ciBjb25maXJtaW5nISBObyBuZWVkIHRvIHRlc3QgWCAtIHRoYXQgd2lsbCB3b3JrIGZpbmUsIHNp
bmNlCj4gd2Ugd2VyZSByZXBvcnRpbmcgdGhlIHNtYWxsZXIgY3Vyc29ycyBvbiB0aGF0IGtlcm5l
bC4KPiAKPiBTbyBJIHRoaW5rIHdlIGhhdmUgZGVmaW5pdGl2ZSBldmlkZW5jZSB0aGF0IGF0IGxl
YXN0IGFsbCBLZXBsZXIKPiBkb2Vzbid0IGRvIDI1NngyNTYgKGFuZCBpdCdzIG5vdCBqdXN0IHNv
bWUgYnVnIGluIHRoZSBkaXNwbGF5IG1hY3JvCj4gcmV3b3JrIHRoYXQgZ290IGludHJvZHVjZWQp
LiBBbmQgdW5sZXNzIEknbSBibGluZCBhbmQgZG9uJ3Qgc2VlIHRoZQo+IGNvcnJ1cHRpb24sIFBh
c2NhbCBzZWVtcyBmaW5lLiBRdWVzdGlvbiByZW1haW5zIGZvciBNYXh3ZWxsMS8yIEdQVXMuCj4g
VW5sZXNzIHNvbWVvbmUgaGFzIGltbWVkaWF0ZSBwbGFucyB0byB0ZXN0IG9uIHRob3NlLCBJJ2Qg
cmVjb21tZW5kCj4gYnVtcGluZyB0aGUgbWluaW11bSBmb3IgMjU2eDI1NiBiZWluZyByZXBvcnRl
ZCB0byBQYXNjYWwsIGFuZCBkb2luZwo+IDEyOHgxMjggZm9yIEtlcGxlciAvIE1heHdlbGwuCgpJ
J20gZmFpcmx5IHN1cmUgdGhpcyB3aWxsIGFjdHVhbGx5IHdvcmsgZmluZSBvbiBtYXh3ZWxsLCBJ
IHRoaW5rIEtlcGxlciBpcyB0aGUKb25seSBvbmUgSSdtIGF3YXJlIG9mIHNvIGZhciB0aGF0IGhh
cyBpc3N1ZXMgd2l0aCB0aGlzLiBJJ3ZlIGdvdCBvbmUgb2YgZWFjaCBnZW4KZnJvbSBrZXBsZXIg
MSB1cCB0byBhbXBlcmUsIHNvIEknbGwgdHJ5IHRvIGZpbmQgc29tZSB0b2RheSB0byB0ZXN0IHRo
ZSBjYXJkcwpJJ3ZlIGdvdCBhbmQgc2VlIHdoZXJlIHRoZSBzdXBwb3J0IGN1dG9mZiBmb3IgdGhp
cyBpcyBhbmQgdGhlbiBzdWJtaXQgYSBwYXRjaApmb3IgdGhlIHRpbWUgYmVpbmcuCgpJdCdzIGFs
c28gcmVhbGx5IHN0cmFuZ2UgdG8gbWUgdGhhdCB0aGlzIHdvdWxkIGJlIHByZXNlbnQgaW4gdGhl
IGRpc3BsYXkgY2xhc3Nlcwp5ZXQgbm90IGJlIHN1cHBvcnRlZCBvbiB0aGUgR1BVLCBzaW5jZSB0
aGVyZSBkZWZpbml0ZWx5IGFyZW4ndCBhbnkgY2FwYWJpbGl0aWVzCmZvciB0aGlzLiBJJ2xsIGFs
c28gc2VuZCBhbiBlbWFpbCB0byBBbmR5IGFuZCBzZWUgaWYgaGUgbWlnaHQga25vdyB3aGF0J3Mg
Z29pbmcKb24gaGVyZS4KPiAKPiBTaW1vbiwgTHl1ZGUgLS0gdGhvdWdodHM/Cj4gCj4gQ2hlZXJz
LAo+IAo+IMKgIC1pbGlhCj4gCgotLSAKU2luY2VyZWx5LAogICBMeXVkZSBQYXVsIChzaGUvaGVy
KQogICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CiAgIApOb3RlOiBJIGRlYWwgd2l0aCBh
IGxvdCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBsb3Qgb2YgYnVncyBvbiBteSBwbGF0ZS4gSWYgeW91
J3ZlCmFza2VkIG1lIGEgcXVlc3Rpb24sIGFyZSB3YWl0aW5nIGZvciBhIHJldmlldy9tZXJnZSBv
biBhIHBhdGNoLCBldGMuIGFuZCBJCmhhdmVuJ3QgcmVzcG9uZGVkIGluIGEgd2hpbGUsIHBsZWFz
ZSBmZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRvIGNoZWNrCm9uIG15IHN0YXR1
cy4gSSBkb24ndCBiaXRlIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
Cg==
