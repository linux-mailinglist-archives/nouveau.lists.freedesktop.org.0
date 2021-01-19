Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE232FB53D
	for <lists+nouveau@lfdr.de>; Tue, 19 Jan 2021 11:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37686E0AF;
	Tue, 19 Jan 2021 10:18:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715CE6E0AF
 for <nouveau@lists.freedesktop.org>; Tue, 19 Jan 2021 10:18:40 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com
 [91.134.188.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 8F9C02004C7A
 for <nouveau@lists.freedesktop.org>; Tue, 19 Jan 2021 10:18:38 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="EEJJJiPI"
Date: Tue, 19 Jan 2021 10:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611051513;
 bh=q+dny+d9bvN1Z30lIJh9zYFbNAX8RL+E2yHDrPen8dc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=EEJJJiPIPVks4KgMcNX6viXtSMfYjtON2y4W70FpTyTi14JE/rViukoIbCoh/NwXN
 hS2y3D1bjc6lPimCVxpsJGSayd2xTHqIPYkw+u2PNQdJZGb4Ts6i0V0kinGewOOUKB
 oBAMay6gJFo6aUuzcfDMK+QfOwnHlqdJ+tcouH/UU4s7dbOdAFtGrHpPbrCtmEiLVr
 Uh2CHjzBIq/6E7dwbs5d92IPTrVY1/ye8B23nwyLheIdxzxKsSNI/011eJlJ3J6yIg
 gEdyJ1b35Ic670vTqrTU2L79iCZcVqEYXS/RsIj7UFODx29LjbOHcEuOjkhOp7NBYg
 OdkXmaVJ2dDfA==
To: Lyude Paul <lyude@redhat.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <HfzDFy00Jir8FH_WqWz7EmLYojZvbfaoSAhmjdxfTSVxhBBpUYgpdApQFXXM2Uv3yzq0ySUYLCq2izrT5d9_gxna2IN9U8zHme2dvo7LlKs=@emersion.fr>
In-Reply-To: <20210119015415.2511028-1-lyude@redhat.com>
References: <20210119015415.2511028-1-lyude@redhat.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
Subject: Re: [Nouveau] [PATCH 1/3] drivers/nouveau/kms/nv50-: Reject format
 modifiers for cursor planes
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tuesday, January 19th, 2021 at 2:54 AM, Lyude Paul <lyude@redhat.com> wrote:

> Nvidia hardware doesn't actually support using tiling formats with the
> cursor plane, only linear is allowed. In the future, we should write a
> testcase for this.
>
> Fixes: c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly/nvdisp")
> Cc: James Jones <jajones@nvidia.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Jeremy Cline <jcline@redhat.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: <stable@vger.kernel.org> # v5.8+
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Together with [1], this patch allows me to run unpatched modifier-aware
user-space successfully, without a cursor visual glitch. drm_info
correctly reports the new modifier list, and wlroots logs confirm that
a flavor of NVIDIA_BLOCK_LINEAR_2D is used for the primary buffers and
LINEAR is used for cursor buffers.

Code looks good to me as well.

Reviewed-by: Simon Ser <contact@emersion.fr>

[1]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
