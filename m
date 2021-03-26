Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E022E34B1A9
	for <lists+nouveau@lfdr.de>; Fri, 26 Mar 2021 23:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490726F4A9;
	Fri, 26 Mar 2021 22:00:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418096F49A
 for <nouveau@lists.freedesktop.org>; Fri, 26 Mar 2021 22:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616796056;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwmpBP589O6V0JxrSUt13E4QZLT4xX4RH4BOYcChKvM=;
 b=aVt4G+xHATarXn3s2aPCmfvZkAsognmtRJrXOObOmR4I31naRKzlv0wZ6o9ijak+fWZi1p
 oOX3RfIYzlklm1Tg5pgoenRI3SoxZICQfEIgVnmCNs/xojULAvWZq4WSEp6Sp5TNg/5JeO
 nBBmfR4U8hv+5qj05/GdOA78TxfPKfw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-LZFP57T3NrieZ8DtthPOHQ-1; Fri, 26 Mar 2021 18:00:54 -0400
X-MC-Unique: LZFP57T3NrieZ8DtthPOHQ-1
Received: by mail-qk1-f199.google.com with SMTP id c1so7198733qke.8
 for <nouveau@lists.freedesktop.org>; Fri, 26 Mar 2021 15:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=NwmpBP589O6V0JxrSUt13E4QZLT4xX4RH4BOYcChKvM=;
 b=L4OXycG3rZVlQBa5ZwZI7Adhx8o07xCzikOvnRvFX6gK35RDmUYmzRR/trwFfx0x9c
 ustAIGVewlayak0ubnYqNnpzJ1vRtAYMqKRBJ4woV5Nq04KrblpxFubM+eiuF0qxaqFw
 n0PpUKzj3KzLYHSOoGcT0gffS16i6D+LTAHTvnWCoIldAkCQNH9fFJfELSo0Fed4Z0jl
 FyZSdg6mO9H/08kycmUCB2ZBFsYvIBofRLCkmnM7pW3sdo9c93rBse2wozYlLfE/Z50W
 ICrLndWspwBBjuXVT2XQ1gDlcWy/HKoC63VuyJ23N1e7J+ETwiYHZ50aUmBljQqMcrGu
 teFA==
X-Gm-Message-State: AOAM5337tN51TswpK4ZKqEXbjfQ9NIJDbyEm3jrFu2Sk9cE+yOtip4SH
 sc+0DIrD5vegIbGiUo2vS/H7A24eIOR/rXiT6QT3BbAM6FVSxu4xQHIJZlbxR3zDLdFHgNA39rN
 NMd7gC0msWp7drFEoLav/tioZLA==
X-Received: by 2002:a37:a38e:: with SMTP id
 m136mr15199347qke.250.1616796053859; 
 Fri, 26 Mar 2021 15:00:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdjc8K+Reia9/uZrIZA0FnyV82RIoH05Va+FBTVeF7yBkyt1wnjDJ4h2zusGmfId1aYTbjwQ==
X-Received: by 2002:a37:a38e:: with SMTP id
 m136mr15199330qke.250.1616796053657; 
 Fri, 26 Mar 2021 15:00:53 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 21sm7965657qkv.12.2021.03.26.15.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 15:00:52 -0700 (PDT)
Message-ID: <b4da382b17a77b66e45fd374c9d806dac6054e3a.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Fri, 26 Mar 2021 18:00:51 -0400
In-Reply-To: <20201125202648.5220-1-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH v2 0/3] drm/nouveau: fix a use-after-free in
 postclose()
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgaXM6CgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KCkJ0dyAtIGluIHRoZSBmdXR1cmUgaWYgeW91IG5lZWQgdG8gc2VuZCBhIHJlc3Bp
biBvZiBtdWx0aXBsZSBwYXRjaGVzLCB5b3UgbmVlZAp0byBzZW5kIGl0IGFzIGl0J3Mgb3duIHNl
cGFyYXRlIHNlcmllcyBpbnN0ZWFkIG9mIHJlcGx5aW5nIHRvIHRoZSBwcmV2aW91cyBvbmUKKG9u
ZS1vZmYgcmVzcGlucyBjYW4ganVzdCBiZSBwb3N0ZWQgYXMgcmVwbGllcyB0aG91Z2gpLCBvdGhl
cndpc2UgcGF0Y2h3b3JrCndvbid0IHBpY2sgaXQgdXAKCk9uIFdlZCwgMjAyMC0xMS0yNSBhdCAx
NToyNiAtMDUwMCwgSmVyZW15IENsaW5lIHdyb3RlOgo+IFRoaXMgc2VyaWVzIGZpeGVzIGEgbnVt
YmVyIG9mIHVzZS1hZnRlci1mcmVlcyBpbiBub3V2ZWF1J3MgcG9zdGNsb3NlKCkKPiBoYW5kbGVy
LiBJdCB3YXMgZGlzY292ZXJlZCBieSBwb2ludGluZyBJR1QncyBjb3JlX2hvdHVucGx1ZyB0ZXN0
cyBhdCBhCj4gbm91dmVhdSBkZXZpY2UsIGJ1dCB0aGUgc3RlcHMgdG8gcmVwcm9kdWNlIGl0IGFy
ZSBzaW1wbGU6Cj4gCj4gMS4gT3BlbiB0aGUgZGV2aWNlIGZpbGUKPiAyLiBVbmJpbmQgdGhlIGRy
aXZlciBvciByZW1vdmUgdGhlIGRldmljZQo+IDMuIENsb3NlIHRoZSBmaWxlIG9wZW5lZCBpbiBz
dGVwIDEuCj4gCj4gRHVyaW5nIHRoZSBkZXZpY2UgcmVtb3ZhbCwgdGhlIG5vdXZlYXVfZHJtIHN0
cnVjdHVyZSBpcyBkZS1hbGxvY2F0ZWQsCj4gYnV0IGlzIGRlcmVmZXJlbmNlZCBpbiB0aGUgcG9z
dGNsb3NlKCkgaGFuZGxlci4KPiAKPiBPbmUgb2J2aW91cyBzb2x1dGlvbiBpcyB0byBlbnN1cmUg
YWxsIHRoZSBvcGVyYXRpb25zIGluIHRoZSBwb3N0Y2xvc2UoKQo+IGhhbmRsZXIgYXJlIHZhbGlk
IGJ5IGV4dGVuZGluZyB0aGUgbGlmZXRpbWUgb2YgdGhlIG5vdXZlYXVfZHJtCj4gc3RydWN0dXJl
LiBUaGlzIGlzIHBvc3NpYmxlIHdpdGggdGhlIG5ldyBkZXZtX2RybV9kZXZfYWxsb2MoKSBpbnRl
cmZhY2UsCj4gYnV0IHRoZSBjaGFuZ2UgaXMgc29tZXdoYXQgaW52YXNpdmUgc28gSSB0aG91Z2h0
IGl0IGJlc3QgdG8gc3VibWl0IHRoYXQKPiB3b3JrIHNlcGFyYXRlbHkuCj4gCj4gSW5zdGVhZCwg
d2UgbWFrZSB1c2Ugb2YgdGhlIGRybV9kZXZfdW5wbHVnKCkgQVBJLCBjbGVhbiB1cCBhbGwgY2xp
ZW50cwo+IGluIHRoZSBkZXZpY2UgcmVtb3ZhbCBjYWxsLCBhbmQgY2hlY2sgdG8gbWFrZSBzdXJl
IHRoZSBkZXZpY2UgaGFzIG5vdAo+IGJlZW4gdW5wbHVnZ2VkIGluIHRoZSBwb3N0Y2xvc2UoKSBo
YW5kbGVyLiBXaGlsZSB0aGlzIGRvZXMgbm90IGVuYWJsZQo+IGhvdC11bnBsdWcgc3VwcG9ydCBm
b3Igbm91dmVhdSwgaXQncyBlbm91Z2ggdG8gYXZvaWQgY3Jhc2hpbmcgdGhlIGtlcm5lbAo+IGFu
ZCBsZWFkcyB0byBhbGwgdGhlIGNvcmVfaG90dW5wbHVnIHRlc3RzIHRvIHBhc3MuCj4gCj4gVGhp
cyBzZXJpZXMgcmVyb2xsIGFkZHJlc3NlcyBhIG1pc3NpbmcgbXV0ZXhfZGVzdHJveSgpIGNhbGwg
YW5kIGEgdHlwbwo+IGluIGEgY29tbWl0IG1lc3NhZ2UuCj4gCj4gSmVyZW15IENsaW5lICgzKToK
PiDCoCBkcm0vbm91dmVhdTogdXNlIGRybV9kZXZfdW5wbHVnKCkgZHVyaW5nIGRldmljZSByZW1v
dmFsCj4gwqAgZHJtL25vdXZlYXU6IEFkZCBhIGRlZGljYXRlZCBtdXRleCBmb3IgdGhlIGNsaWVu
dHMgbGlzdAo+IMKgIGRybS9ub3V2ZWF1OiBjbGVhbiB1cCBhbGwgY2xpZW50cyBvbiBkZXZpY2Ug
cmVtb3ZhbAo+IAo+IMKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyB8IDQy
ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kcnYuaCB8wqAgNSArKysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCgotLSAKU2luY2VyZWx5LAogICBMeXVkZSBQYXVsIChz
aGUvaGVyKQogICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CiAgIApOb3RlOiBJIGRlYWwg
d2l0aCBhIGxvdCBvZiBlbWFpbHMgYW5kIGhhdmUgYSBsb3Qgb2YgYnVncyBvbiBteSBwbGF0ZS4g
SWYgeW91J3ZlCmFza2VkIG1lIGEgcXVlc3Rpb24sIGFyZSB3YWl0aW5nIGZvciBhIHJldmlldy9t
ZXJnZSBvbiBhIHBhdGNoLCBldGMuIGFuZCBJCmhhdmVuJ3QgcmVzcG9uZGVkIGluIGEgd2hpbGUs
IHBsZWFzZSBmZWVsIGZyZWUgdG8gc2VuZCBtZSBhbm90aGVyIGVtYWlsIHRvIGNoZWNrCm9uIG15
IHN0YXR1cy4gSSBkb24ndCBiaXRlIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9u
b3V2ZWF1Cg==
