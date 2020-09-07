Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81CC25FC98
	for <lists+nouveau@lfdr.de>; Mon,  7 Sep 2020 17:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2956E48D;
	Mon,  7 Sep 2020 15:03:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651486E48D
 for <nouveau@lists.freedesktop.org>; Mon,  7 Sep 2020 15:03:41 +0000 (UTC)
Received: from localhost (unknown [70.37.104.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9D2B21532;
 Mon,  7 Sep 2020 15:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599491021;
 bh=jxKWb/zVKsSOn6DeuF9gcQ1Pits1TBWbVJNuIzM0ZVU=;
 h=Date:From:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
 b=CbdsZkhWW4Zd0/gf7rZoz0iDVRLO2D6/QcZkFLjC+0jRRlYUsIFSvJkLO/9e9WDk2
 kUVKtRnwIAaWFtn8oSRKbnycMSlTMEquIDoSKWJvwKPrPPdmy8vpmajrb4lze7xmjl
 ONZR494HhYC6mEzSxZS4plZLu2PJ3nZY2u38ZlIA=
Date: Mon, 07 Sep 2020 15:03:40 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
In-Reply-To: <20200904202813.1260202-1-lyude@redhat.com>
References: <20200904202813.1260202-1-lyude@redhat.com>
Message-Id: <20200907150340.E9D2B21532@mail.kernel.org>
Subject: Re: [Nouveau] [PATCH v5 1/2] drm/nouveau/kms/nv50-: Program
 notifier offset before requesting disp caps
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

The bot has tested the following trees: v5.8.7.

v5.8.7: Failed to apply! Possible dependencies:
    0a96099691c8 ("drm/nouveau/kms/nv50-: implement proper push buffer control logic")
    0bc8ffe09771 ("drm/nouveau/kms/nv50-: Move hard-coded object handles into header")
    12885ecbfe62 ("drm/nouveau/kms/nvd9-: Add CRC support")
    203f6eaf4182 ("drm/nouveau/kms/nv50-: convert core update() to new push macros")
    2853ccf09255 ("drm/nouveau/kms/nv50-: wrap existing command submission in nvif_push interface")
    344c2e5a4796 ("drm/nouveau/kms/nv50-: use NVIDIA's headers for core or_ctrl()")
    3c43c362b3a5 ("drm/nouveau/kms/nv50-: convert core caps_init() to new push macros")
    5e691222eac6 ("drm/nouveau/kms/nv50-: convert core init() to new push macros")
    9ec5e8204053 ("drm/nouveau/kms/nv50-: convert core or_ctrl() to new push macros")
    b11d8ca151d0 ("drm/nouveau/kms/nv50-: use NVIDIA's headers for core init()")
    b505935e56b2 ("drm/nouveau/kms/nv50-: convert core wndw_owner() to new push macros")
    d8b24526ef68 ("drm/nouveau/kms/nv50-: use NVIDIA's headers for core caps_init()")
    e79c9a0ba5e7 ("drm/nouveau/nvif: give every mem object a human-readable identifier")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
