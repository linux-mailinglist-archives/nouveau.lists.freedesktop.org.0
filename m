Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F052C2D6440
	for <lists+nouveau@lfdr.de>; Thu, 10 Dec 2020 18:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB3B6E952;
	Thu, 10 Dec 2020 17:59:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD6E6E952
 for <nouveau@lists.freedesktop.org>; Thu, 10 Dec 2020 17:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607623186;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=miPlyEGKFxoGa24ryNqCASQdc5deGGtvievJU2IZNcA=;
 b=BxKDikVgZbm3D+OjVbvURdNbPBl/6NmA6aDgD6tPv2pTlEf2J72cQytLZfxGNoIqrI/KxN
 CvPYFs3cT9ovbFEcArUWSz9SO8hI7qeEPahRXy8xQ5QIBeVkfKwQKXwHISpR09WxDf30Nj
 M6M+cFUcMeUwlTAp6REovEyNZcQ4UjA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-l4jvL8VPOv6Gd7ndEed5Lw-1; Thu, 10 Dec 2020 12:59:45 -0500
X-MC-Unique: l4jvL8VPOv6Gd7ndEed5Lw-1
Received: by mail-qv1-f70.google.com with SMTP id b9so4402185qvj.6
 for <nouveau@lists.freedesktop.org>; Thu, 10 Dec 2020 09:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=miPlyEGKFxoGa24ryNqCASQdc5deGGtvievJU2IZNcA=;
 b=qklNfdFTHfbJMgjt9BOz/DQX4VpM3Gqc8r1HA97EgX0oOlk21BMgSBYertseIEJcGy
 pdlSVUKdXj69MwIDHpK5dnzW7qDJ/bte3Ulw9tiaWRUrJSFeNV7/DLRyTSH+j2wUGzQ3
 sQu3IFiYIfCPMDIDUTJf3F2/WqxbUx831+xbHKt0bSTwRkXQ0OToRq8zi0p2v21s7QDy
 5KlWI8wYiheEufijE47yJjFcNFQ5pBGqs9zIicwfMTPX0y7kJ/rj1k1o60dUHk+3lZ+3
 7aRqC7I7s/cVqau07hoFL+App9e2FOimEFx4yGAuJ9aJr6xQSwRWpDLnNhNF+0E0fHbB
 v/zA==
X-Gm-Message-State: AOAM530Pr/Q+vkVR0w5abf58Q5i8g++P6uEvrjjlYHpdlLDVHBrBxyBw
 bK26Y69HBXt35QlMnkhNXChR39N10Pv1yhE5DtN59yd3PLpvphmf1ZGp5yc89MHfDKeHTKBGiOw
 EIlp7bgFhDpzsRfcAo5nf1uWtGQ==
X-Received: by 2002:aed:3051:: with SMTP id 75mr10549152qte.64.1607623184868; 
 Thu, 10 Dec 2020 09:59:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxejh2Gr5HYiB6KfMBmbtZVRZHA4dnV4LUHU7T3+dXsaBxb5lrxub5RIB9FoNV4l/s8tTX7w==
X-Received: by 2002:aed:3051:: with SMTP id 75mr10549123qte.64.1607623184645; 
 Thu, 10 Dec 2020 09:59:44 -0800 (PST)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id z8sm3851407qti.22.2020.12.10.09.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 09:59:43 -0800 (PST)
Message-ID: <c4726b0adb72bbc9f740f05c22af1c6b9401a8e1.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Thu, 10 Dec 2020 12:59:42 -0500
In-Reply-To: <20190814213118.28473-3-kherbst@redhat.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-3-kherbst@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 2/7] Revert "ACPI / OSI: Add OEM _OSI string
 to enable NVidia HDMI audio"
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
Cc: Dave Airlie <airlied@redhat.com>, Alex Hung <alex.hung@canonical.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGksIGJ1bXBpbmcgdGhlIGRpc2N1c3Npb24gYWdhaW4gaGVyZSBiZWNhdXNlIHdlIGp1c3QgcmFu
IGludG8gdGhpcyBhZ2FpbiwgYXMgd2UKanVzdCBoYWQgYSBsYXB0b3AgT0VNIHRyeSB0byBmaXgg
YW5vdGhlciBpc3N1ZSBieSBhZGRpbmcgYW4gT1NJIGNoZWNrIGZvciB0aGVzZQpzdHJpbmdzIGlu
c3RlYWQgb2YgaGVscGluZyB1cyBmaXggdGhlIGlzc3VlIGluIG5vdXZlYXUuIE5vdGUgYXMgIHdl
bGwgdGhlIGlzc3VlCkknbSByZWZlcnJpbmcgdG8gaXMgZW50aXJlbHkgaW5kZXBlbmRlbnQgb2Yg
cnVudGltZSBEMywgc28gd2UganVzdCBnb3QgcnVudGltZQpEMyBicm9rZW4gYWdhaW4gYmVjYXVz
ZSBvZiB0aGVzZSBoYWNrcy4KCldoeSBoYXNuJ3QgdGhpcyBwYXRjaCBiZWVuIGFjY2VwdGVkIGlu
dG8gdGhlIGtlcm5lbD8gVGhlc2Ugd2VyZSBhZGRlZCB3aXRob3V0CmFueSBzb3J0IG9mIGRpc2N1
c3Npb24gd2l0aCBub3V2ZWF1IGRldmVsb3BlcnMsIGFuZCBub3V2ZWF1IGlzIHRoZSBjYW5vbmlj
YWwKbnZpZGlhIGRyaXZlciBpbiB0aGUgTGludXgga2VybmVsLiBUaGVzZSBzdHJpbmdzIHNob3Vs
ZG4ndCBiZSBoZXJlIHdpdGhvdXQKZGlzY3Vzc2lvbiB3aXRoIHRoZSByZWxldmFudCBkcml2ZXIg
bWFpbnRhaW5lcnMsIGFuZCBuZWVkIHRvIGJlIHJlbW92ZWQuCgpPbiBXZWQsIDIwMTktMDgtMTQg
YXQgMjM6MzEgKzAyMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiBUaGlzIHJldmVydHMgY29tbWl0
IDg4NzUzMmNhN2NhNTlmY2YwNTQ3YTc5MjExNzU2NzkxMTI4MDMwYTMuCj4gCj4gV2UgaGF2ZSBh
IGJldHRlciBzb2x1dGlvbiBmb3IgdGhpczogYjUxNmVhNTg2ZDcxNwo+IAo+IEFuZCBzYW1lIGFz
IHdpdGggdGhlIGxhc3QgY29tbWl0OiAiTlZpZGlhIExpbnV4IGRyaXZlciIgdGhhdCdzIE5vdXZl
YXUsIGFueQo+IG91dCBvZiB0cmVlIGRyaXZlciBkb2VzIF9ub3RfIG1hdHRlci4gQW5kIHdpdGgg
Tm91dmVhdSBhbGwgb2YgdGhpcyB3b3JrcyBldmVuCj4gdGhvdWdoIGl0IHJlcXVpcmVkIGEgcHJv
cGVyIGZpeCBmaXJzdCwgYnV0IHdlIGhhdmUgdGhhdCBub3cuCj4gCj4gU2lnbmVkLW9mZi1ieTog
S2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Cj4gQ0M6IEFsZXggSHVuZyA8YWxleC5o
dW5nQGNhbm9uaWNhbC5jb20+Cj4gQ0M6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwuai53eXNv
Y2tpQGludGVsLmNvbT4KPiBDQzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiBD
QzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBDQzogQmVuIFNrZWdncyA8YnNrZWdn
c0ByZWRoYXQuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9hY3BpL29zaS5jIHwgOCAtLS0tLS0tLQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYWNwaS9vc2kuYyBiL2RyaXZlcnMvYWNwaS9vc2kuYwo+IGluZGV4IDliMjBhYzRkNzlhMC4u
NTZjYzk1YjZiNzI0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9vc2kuYwo+ICsrKyBiL2Ry
aXZlcnMvYWNwaS9vc2kuYwo+IEBAIC01MywxNCArNTMsNiBAQCBvc2lfc2V0dXBfZW50cmllc1tP
U0lfU1RSSU5HX0VOVFJJRVNfTUFYXSBfX2luaXRkYXRhID0gewo+IMKgwqDCoMKgwqDCoMKgwqAg
KiBiZSByZW1vdmVkIGlmIGJvdGggbmV3IGFuZCBvbGQgZ3JhcGhpY3MgY2FyZHMgYXJlIHN1cHBv
cnRlZC4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDCoMKgwqDCoHsiTGludXgtRGVs
bC1WaWRlbyIsIHRydWV9LAo+IC3CoMKgwqDCoMKgwqDCoC8qCj4gLcKgwqDCoMKgwqDCoMKgICog
TGludXgtTGVub3ZvLU5WLUhETUktQXVkaW8gaXMgdXNlZCBieSBCSU9TIHRvIHBvd2VyIG9uIE5W
aWRpYSdzCj4gSERNSQo+IC3CoMKgwqDCoMKgwqDCoCAqIGF1ZGlvIGRldmljZSB3aGljaCBpcyB0
dXJuZWQgb2ZmIGZvciBwb3dlci1zYXZpbmcgaW4gV2luZG93cyBPUy4KPiAtwqDCoMKgwqDCoMKg
wqAgKiBUaGlzIHBvd2VyIG1hbmFnZW1lbnQgZmVhdHVyZSBvYnNlcnZlZCBvbiBzb21lIExlbm92
byBUaGlua3BhZAo+IC3CoMKgwqDCoMKgwqDCoCAqIHN5c3RlbXMgd2hpY2ggd2lsbCBub3QgYmUg
YWJsZSB0byBvdXRwdXQgYXVkaW8gdmlhIEhETUkgd2l0aG91dAo+IC3CoMKgwqDCoMKgwqDCoCAq
IGEgQklPUyB3b3JrYXJvdW5kLgo+IC3CoMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDC
oHsiTGludXgtTGVub3ZvLU5WLUhETUktQXVkaW8iLCB0cnVlfSwKPiDCoH07Cj4gwqAKPiDCoHN0
YXRpYyB1MzIgYWNwaV9vc2lfaGFuZGxlcihhY3BpX3N0cmluZyBpbnRlcmZhY2UsIHUzMiBzdXBw
b3J0ZWQpCgotLSAKU2luY2VyZWx5LAogICBMeXVkZSBQYXVsIChzaGUvaGVyKQogICBTb2Z0d2Fy
ZSBFbmdpbmVlciBhdCBSZWQgSGF0CiAgIApOb3RlOiBJIGRlYWwgd2l0aCBhIGxvdCBvZiBlbWFp
bHMgYW5kIGhhdmUgYSBsb3Qgb2YgYnVncyBvbiBteSBwbGF0ZS4gSWYgeW91J3ZlCmFza2VkIG1l
IGEgcXVlc3Rpb24sIGFyZSB3YWl0aW5nIGZvciBhIHJldmlldy9tZXJnZSBvbiBhIHBhdGNoLCBl
dGMuIGFuZCBJCmhhdmVuJ3QgcmVzcG9uZGVkIGluIGEgd2hpbGUsIHBsZWFzZSBmZWVsIGZyZWUg
dG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRvIGNoZWNrCm9uIG15IHN0YXR1cy4gSSBkb24ndCBi
aXRlIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91
dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
