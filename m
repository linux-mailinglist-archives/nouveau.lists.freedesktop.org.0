Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A27679124E
	for <lists+nouveau@lfdr.de>; Mon,  4 Sep 2023 09:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD8C10E2B9;
	Mon,  4 Sep 2023 07:35:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Mon, 04 Sep 2023 07:35:04 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B91410E2B9
 for <nouveau@lists.freedesktop.org>; Mon,  4 Sep 2023 07:35:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D647BCE0E16;
 Mon,  4 Sep 2023 07:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6242C433C8;
 Mon,  4 Sep 2023 07:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693812468;
 bh=piU91Jcbu/nw4mkWE2ebzf6Prd/hbd/WAB0XaDvFVKs=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Zvb1r76GhELMisX9kegFx6hYvKO9a95ROEtrBeUGlMbCGe6dLBS306Urr9gQ7Y4/O
 RjfMKdnLGbxCogy0Sw7M71edlT+aFPxH+Z52ERTui2cf/2MCtDIQTpRsuO8KUAZ+gj
 UhPAJAp8xsJEuCC1OEYmDrSYMakSkrxSuqnNWimZfR8AAgUePniokMZ9WDo+KhQPGZ
 1UeKp+Y4eulL+A+VxVQ09/eumfPM+kiPlkxnI4wac8PKcm+PMHlHBGwaZScVNLeurG
 9bZhX6EBfgW0mneEv6bUiP5l3w/Hi8gz6AGocWmZMqxky1J0imwWFMJ58DF4cHvLj+
 0ZH5AS8zmDoeg==
Message-ID: <8a90bc6f4bf16d5aa545e5215f2a5112.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:27:45 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
In-Reply-To: <20230901164111.RFT.6.Ie7588ec6e0f93e8bc700e76b265ad1a7ad6b15ad@changeid>
References: <20230901164111.RFT.6.Ie7588ec6e0f93e8bc700e76b265ad1a7ad6b15ad@changeid>
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [RFT PATCH 06/15] drm/nouveau: Call
 drm_atomic_helper_shutdown() or equiv at shutdown time
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
Cc: Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:17 -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() (or
> drm_helper_force_disable_all() if not using atomic) at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
