Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CB3786EB0
	for <lists+nouveau@lfdr.de>; Thu, 24 Aug 2023 14:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7145310E523;
	Thu, 24 Aug 2023 12:07:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE1B10E520;
 Thu, 24 Aug 2023 12:07:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1EE8622C0;
 Thu, 24 Aug 2023 12:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493D8C433C8;
 Thu, 24 Aug 2023 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692878866;
 bh=XGcUYxKeus/elTOoo1TjZur2p/AUG6A2tJIcsd6tkeY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rsSVe7TgROYG1eWOt5xc+RTZFGzWVP57WTUrt7RVc1v7xwhiWcgSchrbaVPEI+2tI
 n1Rh4UbOh+Ln4e6fL5ZMoOetp8KgWCwOiMLCOs+IylzDhL8RApvllbJXgiZ3GdpL8U
 i1Z2IbTVQmipwBnz/wmvTxRx68NKj7igKU3SNfFwkoxeaMxIB+khZboENPg/rHmz9K
 GBDYsOifsqOPM6DfahgDS1+TmELqmdew1kTvyVkejTiq4r9p540lLTO3unNGYRWzdT
 clXGNzTBHyFZYghbE3br+BXurpvs1+DgMi3cDunaFl0t2ZI2Kh5D2hn+HiySfUC00i
 pLn15gYif2/8g==
Date: Thu, 24 Aug 2023 13:07:35 +0100
From: Lee Jones <lee@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230824120735.GS1380343@google.com>
References: <20230824073710.2677348-1-lee@kernel.org>
 <87wmxk4xt3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wmxk4xt3.fsf@intel.com>
Subject: Re: [Nouveau] [PATCH (set 1) 00/20] Rid W=1 warnings from GPU
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Stanley Yang <Stanley.Yang@amd.com>, linux-media@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Hyun Kwon <hyun.kwon@xilinx.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Jerome Glisse <glisse@freedesktop.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023, Jani Nikula wrote:

> On Thu, 24 Aug 2023, Lee Jones <lee@kernel.org> wrote:
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> 
> The next question is, how do we keep it W=1 clean going forward?

My plan was to fix them all, then move each warning to W=0.

Arnd recently submitted a set doing just that for a bunch of them.

https://lore.kernel.org/all/20230811140327.3754597-1-arnd@kernel.org/

I like to think a bunch of this is built on top of my previous efforts.

GPU is a particularly tricky though - the warnings seem to come in faster
than I can squash them.  Maybe the maintainers can find a way to test
new patches on merge?

> Most people don't use W=1 because it's too noisy, so it's a bit of a
> catch-22.
> 
> In i915, we enable a lot of W=1 warnings using subdir-ccflags-y in our
> Makefile. For CI/developer use we also enable kernel-doc warnings by
> default.
> 
> Should we start enabling some of those warning flags in drm/Makefile to
> to keep the entire subsystem warning free?

That would we awesome!  We'd just need buy-in.

-- 
Lee Jones [李琼斯]
