Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB7B62407F
	for <lists+nouveau@lfdr.de>; Thu, 10 Nov 2022 11:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8281510E135;
	Thu, 10 Nov 2022 10:57:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257F510E135;
 Thu, 10 Nov 2022 10:57:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 178935808C6;
 Thu, 10 Nov 2022 05:57:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 05:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668077835; x=1668085035; bh=cvSidfTlOF
 iz9lapBwlfSzymOn7SZniWI1BdG3cziLY=; b=C6ycC4opK9uquS1BOwRpGYYpIq
 oa5uL1rqcfmQx/208683xtMKHikLJxtKUV1AhDVJauJtAMBKgdhO1blLN+/7c/jx
 5M99IasEYvkK/FMe8d0m3OS64ywh+Rp0aTGbkN/X24s+G8oDx+4+DDLTpg4b6nI2
 FawDZKSObJmh8ZKu20V0Hy9VuuSw1smnS7/yPIwPf9tBXWk5+URpYEYql7it4i1S
 91whRNbas6gsKoI2kXQz5aPEHgsRZWGR/A/dyWv7mhDQdviU8i4YSzgJgvNbqzXA
 d9MYg1lqZDZK/e2rGJNNzIWSjvoYTPUjeZ01kR9fq5V42o+ykxNAEKcvRKNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668077835; x=1668085035; bh=cvSidfTlOFiz9lapBwlfSzymOn7S
 ZniWI1BdG3cziLY=; b=LfydtyO3J80va6islVtiBHDxfWQPhnQJyS5NyW4eRi/b
 ahDFNpQbooDc8neMqOhXh/VNtpGc4iDSbZY8HwwuUmdaC6RAe+n+UHV5xPfzOob2
 rNaGTJErRJ9Ua8oIyMNZWLknV7jvqtYb2F9WpMJoHyQCYnNJ/QV+jumYLusuiqQd
 SODkCdbkV6Jvc/rtfofGpmmmseajbikDiaTBUAe0w8k+ArZvdqCVytaBcxP/y1C8
 zT5MwKvCpPFjhr5Y78JrR+nWlAkUI1DTVNkzH0FcA2fcvXCYSvbxo4K3Yg+P6Rlu
 o0XoYu4Xs9MGTeVEae4GyfcusMDLPK6NRUbm3aoTTw==
X-ME-Sender: <xms:CtlsY-6ZAptdxVgF6yUdkGevghiPzpHp7gyXvgdVLaqV9xGipGnRWA>
 <xme:CtlsY356xemRLsQvQZbQNMjJ66KkvsE0qkyfbX9bJGFU6BGQWi9Kc15cPHsmY6i1C
 v5qr9fPivP3U9BEjg0>
X-ME-Received: <xmr:CtlsY9ezqhxGaP-q1vbPIEoruabcmwa09CkVH_RUn7twxS-LpSj9PbhEu2mVPJ0tdCAuq6N9zBbM61iTxyz3T20B3vqydg6EvKGpis5OG0i8GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleehvdegueevffeuffdvheevudelveffteegieetgfeijeeiudevheekvdeg
 uddunecuffhomhgrihhnpehgihhthhhusghushgvrhgtohhnthgvnhhtrdgtohhmpdhgih
 hthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CtlsY7IoWROIDYrZfguqSRyuAXydH7zRB4ZHI8eGiK-y6vIqS8iXwg>
 <xmx:CtlsYyIE4nPbggzufN0Qh-YtS-mp6VoAtLp0cSAP8uOUomw1xCeWIQ>
 <xmx:CtlsY8zqMDPz7gv-SJ1UdBcOPbi9j43rPuqacce2YHIIFDXKAwfN1g>
 <xmx:C9lsY8qNq8YiG3R7u67advqHP_v-EzK3UqAi97QzZW-wDJUiZG6zog>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 05:57:13 -0500 (EST)
Date: Thu, 10 Nov 2022 11:57:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: kfyatek+publicgit@gmail.com
Message-ID: <20221110105711.pgmzsykts3jiqonz@houat>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-22-7072a478c6b3@cerno.tech>
 <e0779ff5-3227-4a6f-1c0b-de2fbff99425@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0779ff5-3227-4a6f-1c0b-de2fbff99425@gmail.com>
Subject: Re: [Nouveau] [PATCH v7 22/23] drm/vc4: vec: Add support for more
 analog TV standards
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Emma Anholt <emma@anholt.net>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi!

On Wed, Nov 09, 2022 at 02:15:29AM +0100, Mateusz Kwiatkowski wrote:
> I ran your v7 patchset on my Pi with Xorg, and the mode switching, as well as
> the preferred mode handling, all work really well now!

Thanks again for all your help

> I just noted that the downstream version of the vc4 driver still has inaccurate
> field delays in vc4_crtc.c, which causes vertical lines to appear jagged (like
> here: https://user-images.githubusercontent.com/4499762/112738569-385c3280-8f64-11eb-83c4-d671537af209.png).
> This has been fixed downstream in
> https://github.com/raspberrypi/linux/pull/4241/commits/bc093f27bf2613ec93524fdc19e922dd7dd3d800,
> but I guess that should be upstreamed separately...?

I guess I missed it while rebasing, but yeah, it should definitely be
upstreamed.

Maxime
