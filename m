Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A315C986
	for <lists+nouveau@lfdr.de>; Thu, 13 Feb 2020 18:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABD26F614;
	Thu, 13 Feb 2020 17:37:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235EF6F615
 for <nouveau@lists.freedesktop.org>; Thu, 13 Feb 2020 17:37:11 +0000 (UTC)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8D1C222C2;
 Thu, 13 Feb 2020 17:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581615431;
 bh=f1eRO1bn+QC5+Hd5H+EI675bgwgEypohLMxD2TAqaHw=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=DxPdMOU6UPbwF0JdDQ4dFJGWzHfZYEBoguWpvgXcvsfJaxUiBGPXWbHDusUem7FNL
 fHmCJYKZH2rbltabyVbSsv/Ik2Qa8Mj7Ak48+cUx+RyrmmBs+RDn44QYYyk1xfdvFg
 7Kh/yK8Zrp1gO0vdea0kClhaTaNjhmGTbA9TxMdg=
Date: Thu, 13 Feb 2020 17:37:10 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
In-Reply-To: <20200212230043.170477-2-lyude@redhat.com>
References: <20200212230043.170477-2-lyude@redhat.com>
Message-Id: <20200213173710.C8D1C222C2@mail.kernel.org>
Subject: Re: [Nouveau] [PATCH 1/4] drm/nouveau/kms/nv50-: Probe SOR caps for
 DP interlacing support
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

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.5.3, v5.4.19, v4.19.103, v4.14.170, v4.9.213, v4.4.213.

v5.5.3: Failed to apply! Possible dependencies:
    5ff0cb1ce253 ("drm/nouveau/kms/nv50-: Use less encoders by making mstos per-head")

v5.4.19: Failed to apply! Possible dependencies:
    5ff0cb1ce253 ("drm/nouveau/kms/nv50-: Use less encoders by making mstos per-head")

v4.19.103: Failed to apply! Possible dependencies:
    5e292e7646ef ("drm/nouveau: Remove unnecessary VCPI checks in nv50_msto_cleanup()")
    5ff0cb1ce253 ("drm/nouveau/kms/nv50-: Use less encoders by making mstos per-head")

v4.14.170: Failed to apply! Possible dependencies:
    07bbc1c5f49b ("drm/nouveau/core/memory: split info pointers from accessor pointers")
    0b11b30de9d2 ("drm/nouveau/mmu/nv04-nv4x: move global vmm to nvkm_mmu")
    11fc017dfb1e ("drm/nouveau/kms/nv50: prepare for double-buffered LUTs")
    1590700d94ac ("drm/nouveau/kms/nv50-: split each resource type into their own source files")
    269fe32d3343 ("drm/nouveau/bar: swap oneinit/init ordering, and rename bar3 to bar2")
    30ed49b55b6e ("drm/nouveau/kms/nv50-: move code underneath dispnv50/")
    34508f9d260c ("drm/nouveau/kms/nv50-: determine MST support from DP Info Table")
    5b17f3624efa ("drm/nouveau/mmu/nv04: implement vmm on top of new base")
    5e075fdeb166 ("drm/nouveau/mmu: automatically handle "un-bootstrapping" of vmm")
    6359c982243e ("drm/nouveau/mmu/gp10b: fork from gf100")
    698c1aa9f83b ("drm/nouveau/kms/nv50-: Don't create MSTMs for eDP connectors")
    7f53d6dc9a72 ("drm/nouveau/core/memory: comptag allocation")
    806a73356537 ("drm/nouveau/mmu: implement base for new vm management")
    90df522912ac ("drm/nouveau/kms/nv50: use INTERPOLATE_257_UNITY_RANGE LUT on newer chipsets")
    997a89003c2d ("drm/nouveau/core/memory: add reference counting")
    b86a45877ead ("drm/nouveau/mmu/gp100: fork from gf100")
    c83c4097eba8 ("drm/nouveau/mmu: define user interfaces to mmu memory allocation")
    cedc4d57df26 ("drm/nouveau/mmu/gm20b: fork from gf100")
    d1f6c8d2e9df ("drm/nouveau/mmu/gk20a: fork from gf100")
    e1e33c791a23 ("drm/nouveau/mmu/gm200: fork from gf100")
    e69dae85c90b ("drm/nouveau/bar/nv50,g84: drop mmu invalidate")
    e75182f68b7b ("drm/nouveau/kms/nv50: use "low res" lut for indexed mode")
    eaf1a69110f4 ("drm/nouveau/mmu: add base for type-based memory allocation")
    f4778f08a038 ("drm/nouveau/kms/nv50: fix handling of gamma since atomic conversion")
    f5650478ab07 ("drm/nouveau/disp/nv50-: pass nvkm_memory objects for channel push buffers")

v4.9.213: Failed to apply! Possible dependencies:
    11fc017dfb1e ("drm/nouveau/kms/nv50: prepare for double-buffered LUTs")
    34508f9d260c ("drm/nouveau/kms/nv50-: determine MST support from DP Info Table")
    3dbd036b8419 ("drm/nouveau/kms/nv50: separate out mode commit")
    52aa30f2524d ("drm/nouveau/kms/nv50: switch mst sink back into sst mode")
    698c1aa9f83b ("drm/nouveau/kms/nv50-: Don't create MSTMs for eDP connectors")
    6bbab3b6b656 ("drm/nouveau/kms/nv50: separate out base/ovly channel usage bounds commit")
    a7ae1561909d ("drm/nouveau/kms/nv50: separate out lut commit")
    ad6336195393 ("drm/nouveau/kms/nv50: separate out core surface commit")
    f4778f08a038 ("drm/nouveau/kms/nv50: fix handling of gamma since atomic conversion")

v4.4.213: Failed to apply! Possible dependencies:
    13a3d91f17a5 ("drm: Pass 'name' to drm_encoder_init()")
    34508f9d260c ("drm/nouveau/kms/nv50-: determine MST support from DP Info Table")
    52aa30f2524d ("drm/nouveau/kms/nv50: switch mst sink back into sst mode")
    698c1aa9f83b ("drm/nouveau/kms/nv50-: Don't create MSTMs for eDP connectors")
    a7ae1561909d ("drm/nouveau/kms/nv50: separate out lut commit")
    ad6336195393 ("drm/nouveau/kms/nv50: separate out core surface commit")
    f4778f08a038 ("drm/nouveau/kms/nv50: fix handling of gamma since atomic conversion")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
