Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59123253079
	for <lists+nouveau@lfdr.de>; Wed, 26 Aug 2020 15:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD276EA8D;
	Wed, 26 Aug 2020 13:53:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD356EA8D
 for <nouveau@lists.freedesktop.org>; Wed, 26 Aug 2020 13:53:56 +0000 (UTC)
Received: from localhost (unknown [70.37.104.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FF7222B49;
 Wed, 26 Aug 2020 13:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598450036;
 bh=OV4bwx36FNw2xv7P1ILL50dIdP+4ztOih/WWEpibydI=;
 h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
 b=q0HHMwNiZbjG4uSe0dHHCHRVKXNaTb58Ui3GUpfSmKI9HgV1Su6I1E1Thd/hEF7Sk
 LUm7JF5nKbyOQjewa4GO9hU483wcH5IbyC9FAcvP/n9COK1DU0AvrDZL35kqAzkabP
 QRodIDdZPYywSAs3Zx0ZqXKoQ106KMBHYB+UuPj0=
Date: Wed, 26 Aug 2020 13:53:55 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
In-Reply-To: <20200806230129.324035-1-lyude@redhat.com>
References: <20200806230129.324035-1-lyude@redhat.com>
Message-Id: <20200826135356.0FF7222B49@mail.kernel.org>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: Program notifier
 offset before requesting disp caps
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
Cc: Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP interlacing support").

The bot has tested the following trees: v5.8.2.

v5.8.2: Failed to apply! Possible dependencies:
    3c43c362b3a5 ("drm/nouveau/kms/nv50-: convert core caps_init() to new push macros")
    5e691222eac6 ("drm/nouveau/kms/nv50-: convert core init() to new push macros")
    d8b24526ef68 ("drm/nouveau/kms/nv50-: use NVIDIA's headers for core caps_init()")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
