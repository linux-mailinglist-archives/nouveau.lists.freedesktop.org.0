Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B8BB34BDC
	for <lists+nouveau@lfdr.de>; Mon, 25 Aug 2025 22:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A0C10E031;
	Mon, 25 Aug 2025 20:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MpJ/V/wT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A64E10E031
 for <nouveau@lists.freedesktop.org>; Mon, 25 Aug 2025 20:29:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 75AB1601E5;
 Mon, 25 Aug 2025 20:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC2BC113D0;
 Mon, 25 Aug 2025 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756153742;
 bh=cMFpc538AFBMdcE1lIa0328QIOWBCzu97/gWCg21c+8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MpJ/V/wT6nf1djFA8HrkEBZ7bk0W/6678LIj4RqRQvO4kCvdI07Fi0dftSwmID8vz
 MnKgff/dSUT10yp11ARi/pEaMClP1Gm+daKinGju+6mAM1ReU1LFiFYHu89DopMA8K
 IVXcFvL8MNc41bn0YsR9lH6FOH46aFCMGjbmGtS6I7r5Vr20J02A8C8arqTxgH/LE1
 w+I5m7lvsvR4XRRqvZRBSlzJiddG/KW2JptJzP2WeZr2RJGj74AUcHQHb/uYDgHZp6
 NEJTmHTIWWrwD7Z2DGDKaItYj4Sebrl8EoDihC6sLpYJjckqMTRjozE7ivK/fNhsJt
 cErL3qM3iJzBA==
Message-ID: <f6efb0c8-532a-44d3-89a0-e419ab6265c2@kernel.org>
Date: Mon, 25 Aug 2025 22:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
To: Timur Tabi <ttabi@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20250813001004.2986092-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250813001004.2986092-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 8/13/25 2:10 AM, Timur Tabi wrote:
> Function nvkm_gsp_fwsec_v2() sets 'ret' if the kmemdup() call fails, but
> it never uses or returns 'ret' after that point.  We always need to release
> the firmware regardless, so do that and then check for error.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Cc: stable@vger.kernel.org # v6.7+
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

For this and patch 2 and 3:

Applied to drm-misc-fixes, thanks!
