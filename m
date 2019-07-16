Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264E16D405
	for <lists+nouveau@lfdr.de>; Thu, 18 Jul 2019 20:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D14D6E457;
	Thu, 18 Jul 2019 18:35:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87A66E0EB;
 Tue, 16 Jul 2019 19:52:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17351699-1500050 for multiple; Tue, 16 Jul 2019 20:52:32 +0100
MIME-Version: 1.0
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190716174331.7371-2-robdclark@gmail.com>
References: <20190716174331.7371-1-robdclark@gmail.com>
 <20190716174331.7371-2-robdclark@gmail.com>
Message-ID: <156330674940.9436.18083089508232951941@skylake-alporthouse-com>
User-Agent: alot/0.6
Date: Tue, 16 Jul 2019 20:52:29 +0100
X-Mailman-Approved-At: Thu, 18 Jul 2019 18:35:44 +0000
Subject: Re: [Nouveau] [PATCH v2 2/3] drm: plumb attaching dev thru to
 prime_pin/unpin
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Eric Biggers <ebiggers@google.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, nouveau@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Emil Velikov <emil.velikov@collabora.com>,
 Rob Clark <robdclark@chromium.org>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Laura Abbott <labbott@redhat.com>, Deepak Sharma <deepak.sharma@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 etnaviv@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 spice-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UXVvdGluZyBSb2IgQ2xhcmsgKDIwMTktMDctMTYgMTg6NDM6MjIpCj4gRnJvbTogUm9iIENsYXJr
IDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IAo+IE5lZWRlZCBpbiB0aGUgZm9sbG93aW5nIHBh
dGNoIGZvciBjYWNoZSBvcGVyYXRpb25zLgoKV2hhdCdzIHRoZSBiYXNlIGZvciB0aGlzIHBhdGNo
PyAoSSdtIG1pc3NpbmcgdGhlIGFuY2VzdG9yIGZvciBkcm1fZ2VtLmMpCi1DaHJpcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
