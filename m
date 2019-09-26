Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E5412B298
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04E789A7A;
	Fri, 27 Dec 2019 08:13:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 461 seconds by postgrey-1.36 at gabe;
 Thu, 26 Sep 2019 07:56:08 UTC
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249296E970;
 Thu, 26 Sep 2019 07:56:08 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C921C30E6;
 Thu, 26 Sep 2019 03:48:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 26 Sep 2019 03:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=engestrom.ch; h=
 date:from:to:cc:subject:message-id:mime-version:content-type
 :content-transfer-encoding:in-reply-to; s=fm2; bh=w+s9r045arvlx/
 7fyu9GSn1qP1pE18hWMcKzZta1ao0=; b=cHYfMHXNmz4X1JJpDas6Cp3OR2p1ub
 yARL/LXju2LibRlSdvE7Y4kpqKUn3NpKtbVgoUGmXNxj8jEDjjjs4r/MSuANhtxO
 6KlVMgwDuWQMAAPOm+elAQdIexV/xQBvcRCgMxecf4OvDx9gDgFoqkKI3nCsgFs+
 E6MPnAfsrrArWaaL5Ohe/ri8NEIDiTPtfLnB/Ma7IlLPqfWKIkY2CAyctrjMe6Yg
 DLPBDtci+LWxrI8moASHkXFZ4Ozn5mbLskC5Eum/s/LmiQWnyYpw98h4s438UieO
 vmZANMPK40b/SJPC+MHFyhwwOA7y8HyPM/sDnYNvHimogDatRL80ytiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=w+s9r045arvlx/7fyu9GSn1qP1pE18hWMcKzZta1ao0=; b=zhkl16JI
 +L5HYpQBmQ8847J9Obh1ZPQO/sx2am0uy3M4JH1beGSKzGyxRwyLfrGn0z/fUfhz
 /kh35aK+i7UZsyrWpzZW6nWqVVgMUEVpRuPVVgiQSz32ehKyTdg71pBtSXil0gSn
 2Xm+Y9Qi7GYWp/UX8B7yFa1N/NhOyjEjqnvpvJUHHIwbyNmVvIDDr2TNJ6HwBE89
 ZIDhAFuuwDUIJWZmBBAK35POLFSyXEQ6IRvd9z9fiPoL72xDZMozgm1YMJ213IYY
 elcu9MyCWMgXrSY2MNcxseJEN/UC/Yxtv8O7qOeDS1JlXrYJhDZeuh9JMsGc0IxC
 R2yHYgL3ZdGSSQ==
X-ME-Sender: <xms:RW2MXTBz5sy02KvxEz3F__h8A5E6GRMtXZ_SuqCXRci3N2YrV-rNiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggugfgjohgfsehtkeertddtreejnecuhfhrohhmpefgrhhi
 tgcugfhnghgvshhtrhhomhcuoegvrhhitgesvghnghgvshhtrhhomhdrtghhqeenucffoh
 hmrghinhepmhgrihhlqdgrrhgthhhivhgvrdgtohhmnecukfhppedukeekrddvledrudei
 hedrudefvdenucfrrghrrghmpehmrghilhhfrhhomhepvghrihgtsegvnhhgvghsthhroh
 hmrdgthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:RW2MXeYCrpZtXzMH7FzTo2KlvyHa95r2ZIvgDEuubID58JW17PEyxQ>
 <xmx:RW2MXXIoBtJiAtOC7yGGIqT3XTt8dejFx73SBHXWSJChe11KVGLwug>
 <xmx:RW2MXXDzEPYOIelKXwiciRwa0zGZ7RWOaW9nF4l4IdQFfJ-GmJ_KzQ>
 <xmx:R22MXfyTonuRreeRd8IR2CPBzDSRL3ubmekqQfULp65TLSbHg86NAQ>
Received: from engestrom.ch (188.29.165.132.threembb.co.uk [188.29.165.132])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF3CAD60063;
 Thu, 26 Sep 2019 03:48:18 -0400 (EDT)
Date: Thu, 26 Sep 2019 08:48:14 +0100
From: Eric Engestrom <eric@engestrom.ch>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20190926074814.rdzxjmut6izqf4d5@engestrom.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1569329774.git.jani.nikula@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:32 +0000
Subject: Re: [Nouveau] [PATCH v2 0/9] drm/print: add and use
 drm_debug_enabled()
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
Cc: David Zhou <David1.Zhou@amd.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjAxOS0wOS0yNCAxNTo1ODo1NiArMDMwMCwgSmFuaSBOaWt1bGEgd3JvdGU6
Cj4gSGkgYWxsLCB2MiBvZiBbMV0sIGEgbGl0dGxlIHJlZmFjdG9yaW5nIGFyb3VuZCBkcm1fZGVi
dWcgYWNjZXNzIHRvCj4gYWJzdHJhY3QgaXQgYmV0dGVyLiBUaGVyZSBzaG91bGRuJ3QgYmUgYW55
IGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiAKPiBJJ2QgYXBwcmVjaWF0ZSBhY2tzIGZvciBtZXJnaW5n
IHRoZSBsb3QgdmlhIGRybS1taXNjLiBJZiB0aGVyZSBhcmUgYW55Cj4gb2JqZWN0aW9ucyB0byB0
aGF0LCB3ZSdsbCBuZWVkIHRvIHBvc3Rwb25lIHRoZSBsYXN0IHBhdGNoIHVudGlsCj4gZXZlcnl0
aGluZyBoYXMgYmVlbiBtZXJnZWQgYW5kIGNvbnZlcnRlZCBpbiBkcm0tbmV4dC4KPiAKPiBCUiwK
PiBKYW5pLgo+IAo+IENjOiBFcmljIEVuZ2VzdHJvbSA8ZXJpYy5lbmdlc3Ryb21AaW50ZWwuY29t
Pgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgKENo
dW5NaW5nKSBaaG91IDxEYXZpZDEuWmhvdUBhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+Cj4gQ2M6
IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJr
QGdtYWlsLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IGxpbnV4
LWFybS1tc21Admdlci5rZXJuZWwub3JnCj4gQ2M6IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBDYzogRnJhbmNpc2NvIEplcmV6IDxjdXJyb2plcmV6QHJpc2V1cC5uZXQ+Cj4gQ2M6
IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+IENjOiBSdXNzZWxsIEtpbmcg
PGxpbnV4K2V0bmF2aXZAYXJtbGludXgub3JnLnVrPgo+IENjOiBDaHJpc3RpYW4gR21laW5lciA8
Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgo+IENjOiBldG5hdml2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IAo+IAo+IFsxXSBodHRwOi8vbWlkLm1haWwtYXJjaGl2ZS5jb20vY292ZXIuMTU2
ODM3NTE4OS5naXQuamFuaS5uaWt1bGFAaW50ZWwuY29tCj4gCj4gSmFuaSBOaWt1bGEgKDkpOgo+
ICAgZHJtL3ByaW50OiBtb3ZlIGRybV9kZWJ1ZyB2YXJpYWJsZSB0byBkcm1fcHJpbnQuW2NoXQo+
ICAgZHJtL3ByaW50OiBhZGQgZHJtX2RlYnVnX2VuYWJsZWQoKQo+ICAgZHJtL2k5MTU6IHVzZSBk
cm1fZGVidWdfZW5hYmxlZCgpIHRvIGNoZWNrIGZvciBkZWJ1ZyBjYXRlZ29yaWVzCj4gICBkcm0v
cHJpbnQ6IHJlbmFtZSBkcm1fZGVidWcgdG8gX19kcm1fZGVidWcgdG8gZGlzY291cmFnZSB1c2UK
ClRoZSBhYm92ZSBmb3VyIHBhdGNoZXMgYXJlOgpSZXZpZXdlZC1ieTogRXJpYyBFbmdlc3Ryb20g
PGVyaWNAZW5nZXN0cm9tLmNoPgoKRGlkIHlvdSBjaGVjayB0byBtYWtlIHN1cmUgdGhlIGB1bmxp
a2VseSgpYCBpcyBwcm9wYWdhdGVkIGNvcnJlY3RseQpvdXRzaWRlIHRoZSBgZHJtX2RlYnVnX2Vu
YWJsZWQoKWAgY2FsbD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
