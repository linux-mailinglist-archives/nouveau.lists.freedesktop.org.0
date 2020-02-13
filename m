Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC9015C982
	for <lists+nouveau@lfdr.de>; Thu, 13 Feb 2020 18:37:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1148F6F60E;
	Thu, 13 Feb 2020 17:37:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1F16E3AE
 for <nouveau@lists.freedesktop.org>; Thu, 13 Feb 2020 17:37:05 +0000 (UTC)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FD89206ED;
 Thu, 13 Feb 2020 17:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581615425;
 bh=jNQSrekiz1p9aPQZV+zrvk888nCcka1X38wRO9DMGsU=;
 h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
 b=z4v+uBLxaiIUnrpxwO5ihl+UJHm8pj45LkKpgaKNqn9VmrC+vPlDL3q97GkqzCoh0
 PP2DCCMf9mEZpU/pSOZ8a76zdLiQXkbGjAj25qx8AcgPXwmY+6osQLorE/GS8a7He4
 TQ5zoMAK8mhgA+khMoZHougJ8lrdh5u5dGylIWBo=
Date: Thu, 13 Feb 2020 17:37:04 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
In-Reply-To: <20200212231150.171495-1-lyude@redhat.com>
References: <20200212231150.171495-1-lyude@redhat.com>
Message-Id: <20200213173705.3FD89206ED@mail.kernel.org>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/gv100-: Re-set LUT after
 clearing for modesets
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
Cc: , Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: facaed62b4cb ("drm/nouveau/kms/gv100: initial support").

The bot has tested the following trees: v5.5.3, v5.4.19, v4.19.103.

v5.5.3: Build OK!
v5.4.19: Build OK!
v4.19.103: Failed to apply! Possible dependencies:
    88b703527ba7 ("drm/nouveau/kms/gf119-: add ctm property support")
    cb55cd0c66a1 ("drm/nouveau/kms/nv50-: allow more flexibility with lut formats")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
