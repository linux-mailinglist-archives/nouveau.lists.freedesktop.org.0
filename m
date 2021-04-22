Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EEC3685B7
	for <lists+nouveau@lfdr.de>; Thu, 22 Apr 2021 19:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793266E550;
	Thu, 22 Apr 2021 17:20:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C746E532
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619111913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LfDSNIXXrzz4FbE4CwlcLSSxDEOGT/2JNoxma+lfpdU=;
 b=UYo+Yfoj9jHQP8AgrRYGZHEE9NBhnnSVZpddlQmFlj0h9B3aqz0BrgczEvG+8Vzi9LkGlf
 8A4XFNomh3FbBpypnsfu/Y/yEE0tqSOAIosqm9/4XjAgFqkWgHZNu7W146BWsj+9C/J7Lp
 dSAy/brUm1x/B0XU5GI5e/7odojw4UE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-iVfTEuUEP42Et08i9qxd-A-1; Thu, 22 Apr 2021 13:18:13 -0400
X-MC-Unique: iVfTEuUEP42Et08i9qxd-A-1
Received: by mail-qv1-f72.google.com with SMTP id
 el4-20020ad459c40000b029019a47ec7a9dso12612191qvb.21
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 10:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=LfDSNIXXrzz4FbE4CwlcLSSxDEOGT/2JNoxma+lfpdU=;
 b=lHo4a3T3yd8zTv7RZFy6LHl9TPVDstXy+tfJyTmV1YbdCZtGrbQ9OjP5Yamzyz4r7G
 KLKdo+X7Eaz9F2WCILQcOpx425Qtl3tt9D08e1VUm7/4PnEbaAsr0DnPEvBYi1GcDI5q
 ponMYKjfY7y9brziXESFzZXMzTFikDpmUQXJCbQiSf0zqO8wKM+QmaBB2yaoivsc5ZCw
 yaGCHVw17et8/nMqftIpqL827pX+SUHP80Xl/lnLjHymdf+sKwwDW7nv7iwo/h087aOh
 ONxY10irpA7ihIbNxbOQ3yJ7ka222kBUzwnfnHVT73719w80U2ExJQSp8AUlOYORj96C
 5FhA==
X-Gm-Message-State: AOAM532JoJTQQMVBcDpUWQw1KjYYjpa1qkv7eSrZ6e/2BPSPUkQzTpZR
 w4becEOKoK4ntZnjcDOmqkl+6Yf2nsoHjGrTN+/CkZugbKR4D7YVnMJIj3JE8WxOSTydykRO9EF
 bgQ5U8aBLePc9iIpPMrVEDFi/gQ==
X-Received: by 2002:a37:9547:: with SMTP id x68mr4649688qkd.474.1619111892936; 
 Thu, 22 Apr 2021 10:18:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL+wipZ8wslP+tJgr/etmf17aGBKnIbho/C7QbmqdQYxpKccy8EwWdn+YgrbEvV+9kokVRew==
X-Received: by 2002:a37:9547:: with SMTP id x68mr4649649qkd.474.1619111892722; 
 Thu, 22 Apr 2021 10:18:12 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id v4sm2561004qto.50.2021.04.22.10.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 10:18:12 -0700 (PDT)
Message-ID: <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 22 Apr 2021 13:18:09 -0400
In-Reply-To: <YH4PPbY1qqF2NtrN@intel.com>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-4-lyude@redhat.com> <YH4PPbY1qqF2NtrN@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Thu, 22 Apr 2021 17:20:12 +0000
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
 Thierry Reding <thierry.reding@gmail.com>,
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
 Jani Nikula <jani.nikula@linux.intel.com>, Joe Perches <joe@perches.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Maxime Ripard <mripard@kernel.org>,
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

T24gVHVlLCAyMDIxLTA0LTIwIGF0IDAyOjE2ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gCj4gVGhlIGluaXQgdnMuIHJlZ2lzdGVyIHNwbGl0IGlzIGludGVudGlvbmFsLiBSZWdpc3Rl
cmluZyB0aGUgdGhpbmcKPiBhbmQgYWxsb3dpbmcgdXNlcnNwYWNlIGFjY2VzcyB0byBpdCBiZWZv
cmUgdGhlIHJlc3Qgb2YgdGhlIGRyaXZlcgo+IGlzIHJlYWR5IGlzbid0IHBhcnRpY3VsYXJseSBn
cmVhdC4gRm9yIGEgd2hpbGUgbm93IHdlJ3ZlIHRyaWVkIHRvCj4gbW92ZSB0b3dhcmRzIGFuIGFy
Y2hpdGVjdHVyZSB3aGVyZSB0aGUgZHJpdmVyIGlzIGZ1bGx5IGluaXRpYWx6aWVkCj4gYmVmb3Jl
IGFueXRoaW5nIGdldHMgZXhwb3NlZCB0byB1c2Vyc3BhY2UuCgpZZWFoLXRoYW5rIHlvdSBmb3Ig
cG9pbnRpbmcgdGhpcyBvdXQuIFRoaWVycnkgLSBkbyB5b3UgdGhpbmsgdGhlcmUncyBhbgphbHRl
cm5hdGUgc29sdXRpb24gd2UgY291bGQgZ28gd2l0aCBpbiBUZWdyYSB0byBmaXggdGhlIGdldF9k
ZXZpY2UoKSBpc3N1ZQp0aGF0IHdvdWxkbid0IHJlcXVpcmUgdXMgdHJ5aW5nIHRvIGV4cG9zZSB0
aGUgaTJjIGFkYXB0ZXIgZWFybHk/Cgo+IAoKLS0gCkNoZWVycywKIEx5dWRlIFBhdWwgKHNoZS9o
ZXIpCiBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXUK
