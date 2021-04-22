Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB3369605
	for <lists+nouveau@lfdr.de>; Fri, 23 Apr 2021 17:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5BD6EC0A;
	Fri, 23 Apr 2021 15:20:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8776EAD8
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619130832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/vRB79wkOkQwRN4IMQD6uSpNtDOh8JtWPvQm40S7Z8=;
 b=T4r8Dkwm4JPgV+QQSSN2PrYjvK9e+vHHRpRu1zYzf4CSxZQ5/0fFI/ToJo02TEjVkxi3zv
 Tl3vSM05F4GDhh6EvngR2Nudyl4nGQtZ7vGJINjFPzqL7ygfjfpeB8Tm4c2xJNWXWvnM2i
 w/BAgcBG10TlFVj7IS0/GEGDGRvDong=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-V1HwwKHKMQmpbS60ixOy7g-1; Thu, 22 Apr 2021 18:33:49 -0400
X-MC-Unique: V1HwwKHKMQmpbS60ixOy7g-1
Received: by mail-qk1-f197.google.com with SMTP id
 s143-20020a3745950000b029028274263008so13110857qka.9
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 15:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=f/vRB79wkOkQwRN4IMQD6uSpNtDOh8JtWPvQm40S7Z8=;
 b=BDKnkiSjZpgtHMmXDsP7IJPSI56nxHj6XrBzpQh6CNXLb94+IPZNy/h1bgiWEbqSy1
 WMhtITKz5booyvgKpoi1IMZqF7GQwiJUiLzaQzbbLxAPHcrKRX4Rf0uy9JMgrGMFDtXl
 ZBnWtRzAD129oysBQwPDMWJPM7+JRhwCaZZbc5BESVIC7okwiPtdAL4vXmQAcfsErX2Q
 OHdp9/JKc9s254drJ9mi6b1lxzBTotALtp38iM/NpOcXMDf0zPOQvl7y1TjsKQaM5+v+
 ug+soNRnVfE+07aOEQPYzJhXASFkcy0VdukpglVfbSPoBIGDsXQ1YuxUrsUhzyxAlraY
 Bkpg==
X-Gm-Message-State: AOAM533SMqEqUjjpJRqS/EOG32va1HPAMSdDbF9fMVFIbxadZHyv8pHW
 jLnjZlPprhY2tDehpFGQ3GeCNxTm/Z6U20Z11J6WDcxNhVKAdp+Ycv2hg4LirP9jb+iMjCumrxA
 kZfihGFz2ZIv5fy6+m5at9ikSrw==
X-Received: by 2002:ad4:4947:: with SMTP id o7mr881596qvy.18.1619130828583;
 Thu, 22 Apr 2021 15:33:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz02Kh6a2SHHB692u3GqETh7EMROD4F/lD1uak4N1xfhj+PZRZ3m979UGgrkSpKy+qKyYfYag==
X-Received: by 2002:ad4:4947:: with SMTP id o7mr881548qvy.18.1619130828362;
 Thu, 22 Apr 2021 15:33:48 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id j185sm3229184qke.1.2021.04.22.15.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 15:33:47 -0700 (PDT)
Message-ID: <2e211a6623664714af1d180eadcd74aa7ef417db.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 22 Apr 2021 18:33:44 -0400
In-Reply-To: <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-4-lyude@redhat.com> <YH4PPbY1qqF2NtrN@intel.com>
 <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
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

T0sgLSB0YWxrZWQgd2l0aCBWaWxsZSBhIGJpdCBvbiB0aGlzIGFuZCBkaWQgc29tZSBvZiBteSBv
d24gcmVzZWFyY2gsIEkKYWN0dWFsbHkgdGhpbmsgdGhhdCBtb3ZpbmcgaTJjIHRvIGRybV9kcF9h
dXhfaW5pdCgpIGlzIHRoZSByaWdodCBkZWNpc2lvbiBmb3IKdGhlIHRpbWUgYmVpbmcuIFRoZSBy
ZWFzb25pbmcgYmVoaW5kIHRoaXMgYmVpbmcgdGhhdCBhcyBzaG93biBieSBteSBwcmV2aW91cwp3
b3JrIG9mIGZpeGluZyBkcml2ZXJzIHRoYXQgY2FsbCBkcm1fZHBfYXV4X3JlZ2lzdGVyKCkgdG9v
IGVhcmx5IC0gaXQgc2VlbXMKbGlrZSB0aGVyZSdzIGFscmVhZHkgYmVlbiBkcml2ZXJzIHRoYXQg
aGF2ZSBiZWVuIHdvcmtpbmcganVzdCBmaW5lIHdpdGgKc2V0dGluZyB1cCB0aGUgaTJjIGRldmlj
ZSBiZWZvcmUgRFJNIHJlZ2lzdHJhdGlvbi4gCgpJbiB0aGUgZnV0dXJlLCBpdCdkIHByb2JhYmx5
IGJlIGJldHRlciBpZiB3ZSBjYW4gc3BsaXQgdXAgaTJjX2FkZF9hZGFwdGVyKCkKaW50byBhbiBp
bml0IGFuZCByZWdpc3RlciBmdW5jdGlvbiAtIGJ1dCB3ZSdsbCBoYXZlIHRvIHRhbGsgd2l0aCB0
aGUgaTJjCm1haW50YWluZXJzIHRvIHNlZSBpZiB0aGlzIGlzIGFjY2VwdGFibGUgdy8gdGhlbQoK
T24gVGh1LCAyMDIxLTA0LTIyIGF0IDEzOjE4IC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+IE9u
IFR1ZSwgMjAyMS0wNC0yMCBhdCAwMjoxNiArMDMwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+
ID4gCj4gPiBUaGUgaW5pdCB2cy4gcmVnaXN0ZXIgc3BsaXQgaXMgaW50ZW50aW9uYWwuIFJlZ2lz
dGVyaW5nIHRoZSB0aGluZwo+ID4gYW5kIGFsbG93aW5nIHVzZXJzcGFjZSBhY2Nlc3MgdG8gaXQg
YmVmb3JlIHRoZSByZXN0IG9mIHRoZSBkcml2ZXIKPiA+IGlzIHJlYWR5IGlzbid0IHBhcnRpY3Vs
YXJseSBncmVhdC4gRm9yIGEgd2hpbGUgbm93IHdlJ3ZlIHRyaWVkIHRvCj4gPiBtb3ZlIHRvd2Fy
ZHMgYW4gYXJjaGl0ZWN0dXJlIHdoZXJlIHRoZSBkcml2ZXIgaXMgZnVsbHkgaW5pdGlhbHppZWQK
PiA+IGJlZm9yZSBhbnl0aGluZyBnZXRzIGV4cG9zZWQgdG8gdXNlcnNwYWNlLgo+IAo+IFllYWgt
dGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dC4gVGhpZXJyeSAtIGRvIHlvdSB0aGluayB0
aGVyZSdzIGFuCj4gYWx0ZXJuYXRlIHNvbHV0aW9uIHdlIGNvdWxkIGdvIHdpdGggaW4gVGVncmEg
dG8gZml4IHRoZSBnZXRfZGV2aWNlKCkgaXNzdWUKPiB0aGF0IHdvdWxkbid0IHJlcXVpcmUgdXMg
dHJ5aW5nIHRvIGV4cG9zZSB0aGUgaTJjIGFkYXB0ZXIgZWFybHk/Cj4gCj4gPiAKPiAKCi0tIApD
aGVlcnMsCiBMeXVkZSBQYXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhh
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
