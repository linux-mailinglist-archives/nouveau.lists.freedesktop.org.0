Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADC3340A86
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 17:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556696E8F3;
	Thu, 18 Mar 2021 16:49:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F796E8A7
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 16:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616086158;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58mfL97IvEYUj6Zg/JL2i7ElYsYo76QJ4ddbnp0yADU=;
 b=XpuUjMZNBA0ZOqL1o3gaQmLOI/EKMcsCV/JTTZrEHAf0SvYRdvP9yyf4A9B318RlBu0u7i
 qpgU1DlLIsK87hbJhReXUq1hXcUtV/19rgIf4KUY0SpCrjfgvd0HrY8/gUtkn+m5zgzjnt
 RR9MmM+7Br2n62wtZW+iIdaMXVvyMNw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-1dCsb5nlO5OJGG_aNYhklA-1; Thu, 18 Mar 2021 12:49:15 -0400
X-MC-Unique: 1dCsb5nlO5OJGG_aNYhklA-1
Received: by mail-qk1-f199.google.com with SMTP id t24so14750001qkg.3
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 09:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=58mfL97IvEYUj6Zg/JL2i7ElYsYo76QJ4ddbnp0yADU=;
 b=gUYtQmXf987XDkXoY6a+B2G18fSj2LPNdNT03/VcpMZVIZylOgpNRQ/Hj9CgNUN+5H
 wkuz0exD6/yhZx6lVWNkjkAfgsDYg3BFoN5P+/crTb3sLHaokAA/Kv8isxeYq1iK1vIO
 Sv3pwDhbTDewxCeoiuBsik9EioMhzvlMoc5N2iZWwtprdOrfmguhY/ZDhOc5C+56Mvrv
 30HZ3A21syNe+aOUSZX4oaQBIBGCzotEBAxcr+c5UnzmvFBECjN/+dZWpQBML2KkkIDp
 3Kct5L1LFehvh0MFM3oth0TNAwrkmZaT9Uer9h8CvO97To4HNDDZcMpP9F20wc8sIZHI
 qsvg==
X-Gm-Message-State: AOAM530Tz+JFjRtm9oMjJmVX381x1PRzkPpdvNwxWfh37M/4n+VlQhvv
 BzmRjq3pZUit9Zb5jo3jN7bgiXOwqEb183nYhfxfuhosZJPElEmzgCJEA+vACm42Rtwcq9c2U1+
 YLmXwwxt62lGyXnd1yv4BqnTIgw==
X-Received: by 2002:ad4:51c1:: with SMTP id p1mr5284035qvq.39.1616086155385;
 Thu, 18 Mar 2021 09:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1prQrldQnaewXNBb34uN0dwD+jsgrVxRWsx/Xcph9Jt/tLKqwESYUe4k6ieid+UKUeXEvow==
X-Received: by 2002:ad4:51c1:: with SMTP id p1mr5284021qvq.39.1616086155230;
 Thu, 18 Mar 2021 09:49:15 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id q64sm1814007qtd.32.2021.03.18.09.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 09:49:14 -0700 (PDT)
Message-ID: <3c5108990850ae8f88952c3149eaa935f7e378e7.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Petri Latvala <petri.latvala@intel.com>, Martin Peres
 <martin.peres@mupuf.org>
Date: Thu, 18 Mar 2021 12:49:13 -0400
In-Reply-To: <YFMaG3tRgsiizy+J@platvala-desk.ger.corp.intel.com>
References: <20210317223827.446803-1-lyude@redhat.com>
 <f42f3af7-658e-b06f-fb79-c36273ac4810@mupuf.org>
 <YFMaG3tRgsiizy+J@platvala-desk.ger.corp.intel.com>
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
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIxLTAzLTE4IGF0IDExOjE1ICswMjAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOgo+
IE9uIFRodSwgTWFyIDE4LCAyMDIxIGF0IDA5OjA2OjI5QU0gKzAyMDAsIE1hcnRpbiBQZXJlcyB3
cm90ZToKPiA+IE9uIDE4LzAzLzIwMjEgMDA6MzgsIEx5dWRlIHdyb3RlOgo+ID4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0tdWFwaS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL2RybS11YXBpL2Ry
bV9mb3VyY2MuaAo+ID4gPiBpbmRleCBhN2JjMDU4Yy4uODdjODc0ODUgMTAwNjQ0Cj4gPiA+IC0t
LSBhL2luY2x1ZGUvZHJtLXVhcGkvZHJtX2ZvdXJjYy5oCj4gPiA+ICsrKyBiL2luY2x1ZGUvZHJt
LXVhcGkvZHJtX2ZvdXJjYy5oCj4gPiA+IEBAIC02ODEsNyArNjgxLDcgQEAgZHJtX2ZvdXJjY19j
YW5vbmljYWxpemVfbnZpZGlhX2Zvcm1hdF9tb2QoX191NjQKPiA+ID4gbW9kaWZpZXIpCj4gPiA+
IMKgIH0KPiA+ID4gwqAgLyoKPiA+ID4gLSAqIDE2QngyIEJsb2NrIExpbmVhciBsYXlvdXQsIHVz
ZWQgYnkgVGVncmEgSzEgYW5kIGxhdGVyCj4gPiA+ICsgKiAxNkJ4MiBCbG9jayBMaW5lYXIgbGF5
b3V0LCB1c2VkIGJ5IGRlc2t0b3AgR1BVcywgYW5kIFRlZ3JhIEsxIGFuZAo+ID4gPiBsYXRlcgo+
ID4gCj4gPiBNYXliZSByZW1vdmUgb25lIG9mIHRoZSAiYW5kInM/Cj4gPiAKPiA+IDE2QngyIEJs
b2NrIExpbmVhciBsYXlvdXQsIHVzZWQgYnkgZGVza3RvcCBHUFVzLCBhbmQgVGVncmEgSzErCj4g
Cj4gZHJtX2ZvdXJjYy5oIGlzIGNvcGllZCBmcm9tIHRoZSBrZXJuZWwsIG5vIGhhbmQtZWRpdGlu
ZyBpbiBJR1QuCgpUaGVzZSBhZGRpdGlvbnMgYXJlIGFsbCBjb3BpZWQgZnJvbSB0aGUgZHJtX2Zv
dXJjYy5oIGZpbGUgaW4gdGhlIGtlcm5lbCB0aG91Z2gsCmRvIHlvdSB3YW50IG1lIHRvIGp1c3Qg
dXBkYXRlIHRoZSB3aG9sZSBmaWxlIGluc3RlYWQ/Cgo+IAo+IAoKLS0gClNpbmNlcmVseSwKICAg
THl1ZGUgUGF1bCAoc2hlL2hlcikKICAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdAogICAK
Tm90ZTogSSBkZWFsIHdpdGggYSBsb3Qgb2YgZW1haWxzIGFuZCBoYXZlIGEgbG90IG9mIGJ1Z3Mg
b24gbXkgcGxhdGUuIElmIHlvdSd2ZQphc2tlZCBtZSBhIHF1ZXN0aW9uLCBhcmUgd2FpdGluZyBm
b3IgYSByZXZpZXcvbWVyZ2Ugb24gYSBwYXRjaCwgZXRjLiBhbmQgSQpoYXZlbid0IHJlc3BvbmRl
ZCBpbiBhIHdoaWxlLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHNlbmQgbWUgYW5vdGhlciBlbWFpbCB0
byBjaGVjawpvbiBteSBzdGF0dXMuIEkgZG9uJ3QgYml0ZSEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
