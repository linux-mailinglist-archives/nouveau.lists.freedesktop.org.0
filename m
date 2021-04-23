Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4D3369606
	for <lists+nouveau@lfdr.de>; Fri, 23 Apr 2021 17:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73846EC0D;
	Fri, 23 Apr 2021 15:20:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CE06EB39
 for <nouveau@lists.freedesktop.org>; Fri, 23 Apr 2021 04:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619151072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UEsttLkpBkpq2SJNDxCdn4ntrP1/pMb5ophnX8OcNHQ=;
 b=anYwAMcb46SASDoZpyKMlMWHKr/qIBryvcIWntskBHQ1/0xvPAbf2Kskj7dGFMZadvTXiQ
 jhEfSxn0vUnXumq4FOyoqYczqtNDd31L2NFT/M4XjJUMCk1+T/F4e2h3BInQ/qdTHnbgaZ
 7gSDatMHyULglsXWFY4nF/YYCnCSei8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-Byfrw8-6P--gqemlLYpoCw-1; Fri, 23 Apr 2021 00:11:11 -0400
X-MC-Unique: Byfrw8-6P--gqemlLYpoCw-1
Received: by mail-qv1-f69.google.com with SMTP id
 i12-20020a0cf38c0000b02901a283706bc1so14810529qvk.2
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 21:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=UEsttLkpBkpq2SJNDxCdn4ntrP1/pMb5ophnX8OcNHQ=;
 b=b5lGc+ZgqK/o+qCB5qoebhsoIizyW2EdEWmXHBzDWyWICvDH4nRnQo8fbSHCPcfTrS
 Q+H70JxaE1iuzdJrS6kYcdu11ZYlEifMnuAUyg1X5a8kk7bFWqleNbu3tEgf/BxTFn4w
 CC9aqSfQ2WF4yQPSAPnj4CJcrF6mZyMBliJ/7i/wpjZDbEvZeatxXpUxGYPWTcbTfCOk
 EI2+jYov68oX8FpIRQSKq2/0w/ynK1MUMgwemBFkbnB9QNUuMAl9FxCQHibVlNkDmwck
 vQs4f4eFr43shnfJyv1XhOMHo95obbRAl41TY5SnupCJrQCL4S8SWwrJ373P3lVpLsWj
 G90g==
X-Gm-Message-State: AOAM5301FZfP+tuOkT13rkDql4KL1gfB1odyjJjLM+UUoDx+01oIsgJS
 CUV27z0rh/HT8Km8XqDJTcqivdBVGA8hXTVmlb4pDN3jXu1g73wqQvaQlKh+xqD2ia8EJVFFbFR
 uDo7/toBozn/BJkak9lHxdNrWxQ==
X-Received: by 2002:a05:620a:759:: with SMTP id
 i25mr2051960qki.193.1619151070450; 
 Thu, 22 Apr 2021 21:11:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylBePZmlCk3b2HVjreUYqrF7R043bNOhqz9vj7MTklILGEdtzIHic9P0aNqf5EMN/2bwB8Yg==
X-Received: by 2002:a05:620a:759:: with SMTP id
 i25mr2051902qki.193.1619151070183; 
 Thu, 22 Apr 2021 21:11:10 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id f22sm3495254qkm.134.2021.04.22.21.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 21:11:09 -0700 (PDT)
Message-ID: <17aa145e4cfa3d8852f7411067c5c37bff771b16.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 23 Apr 2021 00:11:06 -0400
In-Reply-To: <2e211a6623664714af1d180eadcd74aa7ef417db.camel@redhat.com>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-4-lyude@redhat.com> <YH4PPbY1qqF2NtrN@intel.com>
 <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
 <2e211a6623664714af1d180eadcd74aa7ef417db.camel@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Fri, 23 Apr 2021 15:20:26 +0000
Subject: Re: [Nouveau] [PATCH v3 03/20] drm/dp: Move i2c init to
 drm_dp_aux_init, add __must_check and fini
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Oleg Vasilev <oleg.vasilev@intel.com>, dri-devel@lists.freedesktop.org,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Parshuram Thombare <pthombar@cadence.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Thierry Reding <treding@nvidia.com>,
 Harry Wentland <harry.wentland@amd.com>, Imre Deak <imre.deak@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Joe Perches <joe@perches.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Sean Paul <sean@poorly.run>, Navid Emamdoost <navid.emamdoost@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Robert Foss <robert.foss@linaro.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Rob Clark <robdclark@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIxLTA0LTIyIGF0IDE4OjMzIC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+IE9L
IC0gdGFsa2VkIHdpdGggVmlsbGUgYSBiaXQgb24gdGhpcyBhbmQgZGlkIHNvbWUgb2YgbXkgb3du
IHJlc2VhcmNoLCBJCj4gYWN0dWFsbHkgdGhpbmsgdGhhdCBtb3ZpbmcgaTJjIHRvIGRybV9kcF9h
dXhfaW5pdCgpIGlzIHRoZSByaWdodCBkZWNpc2lvbgo+IGZvcgo+IHRoZSB0aW1lIGJlaW5nLiBU
aGUgcmVhc29uaW5nIGJlaGluZCB0aGlzIGJlaW5nIHRoYXQgYXMgc2hvd24gYnkgbXkgcHJldmlv
dXMKPiB3b3JrIG9mIGZpeGluZyBkcml2ZXJzIHRoYXQgY2FsbCBkcm1fZHBfYXV4X3JlZ2lzdGVy
KCkgdG9vIGVhcmx5IC0gaXQgc2VlbXMKPiBsaWtlIHRoZXJlJ3MgYWxyZWFkeSBiZWVuIGRyaXZl
cnMgdGhhdCBoYXZlIGJlZW4gd29ya2luZyBqdXN0IGZpbmUgd2l0aAo+IHNldHRpbmcgdXAgdGhl
IGkyYyBkZXZpY2UgYmVmb3JlIERSTSByZWdpc3RyYXRpb24uIAo+IAo+IEluIHRoZSBmdXR1cmUs
IGl0J2QgcHJvYmFibHkgYmUgYmV0dGVyIGlmIHdlIGNhbiBzcGxpdCB1cCBpMmNfYWRkX2FkYXB0
ZXIoKQo+IGludG8gYW4gaW5pdCBhbmQgcmVnaXN0ZXIgZnVuY3Rpb24gLSBidXQgd2UnbGwgaGF2
ZSB0byB0YWxrIHdpdGggdGhlIGkyYwo+IG1haW50YWluZXJzIHRvIHNlZSBpZiB0aGlzIGlzIGFj
Y2VwdGFibGUgdy8gdGhlbQoKQWN0dWFsbHkgLSBJIHRoaW5rIGFkZGluZyB0aGUgYWJpbGl0eSB0
byByZWZjb3VudCBkcCBhdXggYWRhcHRlcnMgbWlnaHQgYmUgYQpiZXR0ZXIgc29sdXRpb24gc28g
SSdtIGdvaW5nIHRvIHRyeSB0aGF0IQoKPiAKPiBPbiBUaHUsIDIwMjEtMDQtMjIgYXQgMTM6MTgg
LTA0MDAsIEx5dWRlIFBhdWwgd3JvdGU6Cj4gPiBPbiBUdWUsIDIwMjEtMDQtMjAgYXQgMDI6MTYg
KzAzMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+ID4gCj4gPiA+IFRoZSBpbml0IHZzLiBy
ZWdpc3RlciBzcGxpdCBpcyBpbnRlbnRpb25hbC4gUmVnaXN0ZXJpbmcgdGhlIHRoaW5nCj4gPiA+
IGFuZCBhbGxvd2luZyB1c2Vyc3BhY2UgYWNjZXNzIHRvIGl0IGJlZm9yZSB0aGUgcmVzdCBvZiB0
aGUgZHJpdmVyCj4gPiA+IGlzIHJlYWR5IGlzbid0IHBhcnRpY3VsYXJseSBncmVhdC4gRm9yIGEg
d2hpbGUgbm93IHdlJ3ZlIHRyaWVkIHRvCj4gPiA+IG1vdmUgdG93YXJkcyBhbiBhcmNoaXRlY3R1
cmUgd2hlcmUgdGhlIGRyaXZlciBpcyBmdWxseSBpbml0aWFsemllZAo+ID4gPiBiZWZvcmUgYW55
dGhpbmcgZ2V0cyBleHBvc2VkIHRvIHVzZXJzcGFjZS4KPiA+IAo+ID4gWWVhaC10aGFuayB5b3Ug
Zm9yIHBvaW50aW5nIHRoaXMgb3V0LiBUaGllcnJ5IC0gZG8geW91IHRoaW5rIHRoZXJlJ3MgYW4K
PiA+IGFsdGVybmF0ZSBzb2x1dGlvbiB3ZSBjb3VsZCBnbyB3aXRoIGluIFRlZ3JhIHRvIGZpeCB0
aGUgZ2V0X2RldmljZSgpIGlzc3VlCj4gPiB0aGF0IHdvdWxkbid0IHJlcXVpcmUgdXMgdHJ5aW5n
IHRvIGV4cG9zZSB0aGUgaTJjIGFkYXB0ZXIgZWFybHk/Cj4gPiAKPiA+ID4gCj4gPiAKPiAKCi0t
IApDaGVlcnMsCiBMeXVkZSBQYXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5naW5lZXIgYXQgUmVk
IEhhdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91
dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
