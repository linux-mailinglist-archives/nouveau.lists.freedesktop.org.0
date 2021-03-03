Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6348F32B964
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 18:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D927B89FAD;
	Wed,  3 Mar 2021 17:11:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D3D89FAD
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614791503;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTaeUIp3K7uuUNDFoWTQVxjtZD+C2ERMQPS2gcXQ0k4=;
 b=Zm6kWX6nx9BpMgWiFTtpRdHEryCyDUB75nwPG0bwjkzz/me7M5iOIw6G+TC2jZkOJQbkCX
 HAf5lmuHM1v21Y2OOl9Rot39zl/v4QUIDb4lRFr89559gUZ4x4Aa4Vjz2Dhv93w4uNPn++
 r1ZjS+UChSTiQm/ZbOtPt3eg7RRawhs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-OVkYcZVhORS1GMg-laGuiw-1; Wed, 03 Mar 2021 12:11:41 -0500
X-MC-Unique: OVkYcZVhORS1GMg-laGuiw-1
Received: by mail-qk1-f200.google.com with SMTP id 130so8380812qkm.0
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 09:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=gTaeUIp3K7uuUNDFoWTQVxjtZD+C2ERMQPS2gcXQ0k4=;
 b=OeVqFvDTCa+KLWrSdK97Ngm56Qrri1LCOvteDUnUhPYY+0I9BjJPaSn1zlQMLNywyq
 JZRW3p8ykGPi7XXwiZ422KozxtuYJ5fBvpPPnYV75uvpY+g7NS4wNz2yQHvsQnz4dDnn
 /uCZcj3l16OGmXS5g0DSGl0o7EAhkCPI35UA8y/qGBhMLjrVVekwGmTnBrWCT8yXBdSl
 Gs+yLrNaRJePIh8fio8iHDoz+8w6ipYL6xDafJ/RikuHhZUwkNNP10cRwMMQGSbrX9kf
 x0nGTiOEHT3P97fn6bLxu0SKVVDw/LEtuG67RPL/57h6NJTit898mTISEGGAdKAQrAY+
 ehdQ==
X-Gm-Message-State: AOAM532OuMDrbF47ssoFRYDiC9l8UnYBy0e1+QjCdH85rqwGgUdgwX3q
 U/5FlKJ9X4Kt5JXOq71L90UTK1VvGdLIeSCQM1UCrAg5AUqt7CkApqybSMH+4pSNdCM80MoAa+h
 VPotjUcTjbwLGac83URObo71zVQ==
X-Received: by 2002:a05:6214:18d2:: with SMTP id
 cy18mr150359qvb.50.1614791501454; 
 Wed, 03 Mar 2021 09:11:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+6zP4bjbxHd1i1BFSZ8YPoCoj2BuSXjIdugGkphxDFEmyKIi0iAJD4yu8z0s0ApdGKkBCEA==
X-Received: by 2002:a05:6214:18d2:: with SMTP id
 cy18mr150339qvb.50.1614791501270; 
 Wed, 03 Mar 2021 09:11:41 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id x3sm17983052qkd.94.2021.03.03.09.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:11:40 -0800 (PST)
Message-ID: <bd9a66111b5e43826726cbcdde7211cd3d3f83c8.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: uwe.sauter.de@gmail.com, Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 03 Mar 2021 12:11:39 -0500
In-Reply-To: <c0cb8898-e395-99a4-c93a-a3e2f1442305@gmail.com>
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
 <4cfd5800-1f3a-4740-244c-599601517cda@gmail.com>
 <CAKb7UviXJp30K5VBdNS_THru8Er-p4OHKad4Oxuxm8Pdck_yRQ@mail.gmail.com>
 <c0cb8898-e395-99a4-c93a-a3e2f1442305@gmail.com>
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
Cc: Alex Riesen <alexander.riesen@cetitec.com>,
 nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTAzLTAzIGF0IDE4OjAyICswMTAwLCBVd2UgU2F1dGVyIHdyb3RlOgo+IEFt
IDAzLjAzLjIxIHVtIDE0OjMzIHNjaHJpZWIgSWxpYSBNaXJraW46Cj4gPiBPbiBXZWQsIE1hciAz
LCAyMDIxIGF0IDg6MjUgQU0gVXdlIFNhdXRlciA8dXdlLnNhdXRlci5kZUBnbWFpbC5jb20+IHdy
b3RlOgo+ID4gPiAKPiA+ID4gQW0gMDMuMDMuMjEgdW0gMTQ6MTIgc2NocmllYiBJbGlhIE1pcmtp
bjoKPiA+ID4gPiBPbiBXZWQsIE1hciAzLCAyMDIxIGF0IDc6NDEgQU0gQWxleCBSaWVzZW4KPiA+
ID4gPiA8YWxleGFuZGVyLnJpZXNlbkBjZXRpdGVjLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiAKPiA+
ID4gPiA+IElsaWEgTWlya2luLCBTYXQsIEZlYiAyNywgMjAyMSAyMjoyNjo1NyArMDEwMDoKPiA+
ID4gPiA+ID4gQ2FuIHlvdSB0cnkgQWxleCdzIHBhdGNoIHRvIG1vZGV0ZXN0IGFuZCBjb25maXJt
IHRoYXQgeW91IHNlZSBpc3N1ZXMKPiA+ID4gPiA+ID4gd2l0aCBtb2RldGVzdD8gSWYgc28sIGNh
biB5b3UgKGFuZCBtYXliZSBBbGV4IGFzIHdlbGwpIHRyeSBhbiBvbGRlcgo+ID4gPiA+ID4gPiBr
ZXJuZWwgKEknbSBvbiA1LjYpIGFuZCBzZWUgaWYgbW9kZXRlc3QgYmVoYXZlcyB3ZWxsIHRoZXJl
LiBbVGhlCj4gPiA+ID4gPiA+IHBhdGNoCj4gPiA+ID4gPiA+IGluIHF1ZXN0aW9uIHdhcyB0byBl
eHBvc2UgMjU2eDI1NiBhcyB0aGUgJ3ByZWZlcnJlZCcgc2l6ZSwgYnV0Cj4gPiA+ID4gPiA+IHN1
cHBvcnQKPiA+ID4gPiA+ID4gZm9yIHRoZSBsYXJnZXIgY3Vyc29ycyBoYXMgYmVlbiBhcm91bmQg
Zm9yIGEgd2hpbGUuXSBBbGV4IC0gaWYgeW91Cj4gPiA+ID4gPiA+IGhhdmUgdGltZSwgc2FtZSBx
dWVzdGlvbiB0byB5b3UuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFNvcnJ5IHRoYXQgaXQgdG9vayBz
byBsb25nLiBJIHJldGVzdGV0IHdpdGggdGhlIHNhbWUga2VybmVsIGFzIFV3ZSBkaWQKPiA+ID4g
PiA+ICg1LjQuMTAxKSBhbmQgbXkgcmVzdWx0cyBhcmUgdGhlIHNhbWU6IG1vZGV0ZXN0IHdpdGgg
NjQgYW5kIDEyOAo+ID4gPiA+ID4gY3Vyc29ycyBsb29rcwo+ID4gPiA+ID4gZ29vZCwgMjU2IGJy
b2tlbi4gRGlkbid0IHRlc3Qgd2l0aCBYIHRoaXMgdGltZSAodGhpcyBiZWluZyBteSBtYWluCj4g
PiA+ID4gPiBvZmZpY2UKPiA+ID4gPiA+IG1hY2hpbmUpLCBidXQgY2FuIGRvIGxhdGVyIGlmIHJl
cXVpcmVkLgo+ID4gPiA+IAo+ID4gPiA+IFRoYW5rcyBmb3IgY29uZmlybWluZyEgTm8gbmVlZCB0
byB0ZXN0IFggLSB0aGF0IHdpbGwgd29yayBmaW5lLCBzaW5jZQo+ID4gPiA+IHdlIHdlcmUgcmVw
b3J0aW5nIHRoZSBzbWFsbGVyIGN1cnNvcnMgb24gdGhhdCBrZXJuZWwuCj4gPiA+ID4gCj4gPiA+
ID4gU28gSSB0aGluayB3ZSBoYXZlIGRlZmluaXRpdmUgZXZpZGVuY2UgdGhhdCBhdCBsZWFzdCBh
bGwgS2VwbGVyCj4gPiA+ID4gZG9lc24ndCBkbyAyNTZ4MjU2IChhbmQgaXQncyBub3QganVzdCBz
b21lIGJ1ZyBpbiB0aGUgZGlzcGxheSBtYWNybwo+ID4gPiA+IHJld29yayB0aGF0IGdvdCBpbnRy
b2R1Y2VkKS4gQW5kIHVubGVzcyBJJ20gYmxpbmQgYW5kIGRvbid0IHNlZSB0aGUKPiA+ID4gPiBj
b3JydXB0aW9uLCBQYXNjYWwgc2VlbXMgZmluZS4gUXVlc3Rpb24gcmVtYWlucyBmb3IgTWF4d2Vs
bDEvMiBHUFVzLgo+ID4gPiA+IFVubGVzcyBzb21lb25lIGhhcyBpbW1lZGlhdGUgcGxhbnMgdG8g
dGVzdCBvbiB0aG9zZSwgSSdkIHJlY29tbWVuZAo+ID4gPiA+IGJ1bXBpbmcgdGhlIG1pbmltdW0g
Zm9yIDI1NngyNTYgYmVpbmcgcmVwb3J0ZWQgdG8gUGFzY2FsLCBhbmQgZG9pbmcKPiA+ID4gPiAx
Mjh4MTI4IGZvciBLZXBsZXIgLyBNYXh3ZWxsLgo+ID4gPiAKPiA+ID4gVGhlIG9ubHkgb2xkZXIg
bW9kZWwgSSBoYXZlIGFjY2VzcyB0byB3b3VsZCBiZSBhIDY2MDBHVCAoTlY0MykuIERvbid0IGtu
b3cKPiA+ID4gaWYgdGhpcyB3b3VsZCBoYXZlIGFueQo+ID4gPiBzaWduaWZpY2FuY2XigKYKPiA+
IAo+ID4gTm9wZSwgd2Ugd2FudCBuZXdlciA6KSBNYXh3ZWxsIGNhbWUgYWZ0ZXIgS2VwbGVyLiBH
VFggNzUwIGZvciBNYXh3ZWxsCj4gPiAxLCBhbmQgR1RYIDl4eCBmb3IgTWF4d2VsbCAyLiAoR00x
MHggYW5kIEdNMjB4KS4KPiAKPiBJIG1hbmFnZWQgdG8gZ2V0IGFjY2VzcyB0byB0d28gbXVjaCBu
ZXdlciBjYXJkcywgUlRLIDEwNzAgYW5kIHRoZSBsaWtlLgo+IAo+IFNob3VsZCBJIHRlc3QgdGhl
c2Ugb3IgaXMgaXQgbm90IG5lY2Vzc2FyeT8KTmFoLCBldmVyeXRoaW5nIHZvbHRhKyBpcyBhIGNv
bXBsZXRlbHkgZGlmZmVyZW50IGJhbGxnYW1lLiBBbnl3YXksIEkgZG9uJ3QgdGhpbmsKd2UgbmVl
ZCBtb3JlIHRlc3RpbmcgaGVyZSBhbnlob3csIEkganVzdCBuZWVkIHRvIHRyeSB3aGF0IEphbWVz
IEpvbmVzIHN1Z2dlc3RlZAphbmQgaWYgdGhhdCBkb2Vzbid0IHdvcmssIHdyaXRlIHVwIGEgcGF0
Y2ggdG8gbGltaXQgdGhlIGN1cnNvciBzaXplIHVudGlsIHdlCmZpZ3VyZSBvdXQgYSBwcm9wZXIg
c29sdXRpb24gZm9yIHRoaXMuCgo+IAo+IFJlZ2FyZHMsCj4gCj4gwqDCoMKgwqDCoMKgwqDCoFV3
ZQo+IAo+IAo+ID4gQ2hlZXJzLAo+ID4gCj4gPiDCoCAtaWxpYQo+ID4gCj4gCgotLSAKU2luY2Vy
ZWx5LAogICBMeXVkZSBQYXVsIChzaGUvaGVyKQogICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQg
SGF0CiAgIApOb3RlOiBJIGRlYWwgd2l0aCBhIGxvdCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBsb3Qg
b2YgYnVncyBvbiBteSBwbGF0ZS4gSWYgeW91J3ZlCmFza2VkIG1lIGEgcXVlc3Rpb24sIGFyZSB3
YWl0aW5nIGZvciBhIHJldmlldy9tZXJnZSBvbiBhIHBhdGNoLCBldGMuIGFuZCBJCmhhdmVuJ3Qg
cmVzcG9uZGVkIGluIGEgd2hpbGUsIHBsZWFzZSBmZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90aGVy
IGVtYWlsIHRvIGNoZWNrCm9uIG15IHN0YXR1cy4gSSBkb24ndCBiaXRlIQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
