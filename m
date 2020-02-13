Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C6815C97F
	for <lists+nouveau@lfdr.de>; Thu, 13 Feb 2020 18:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAF66E3AC;
	Thu, 13 Feb 2020 17:37:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6869A6E3AC
 for <nouveau@lists.freedesktop.org>; Thu, 13 Feb 2020 17:37:03 +0000 (UTC)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D93121734;
 Thu, 13 Feb 2020 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581615423;
 bh=q50Oz37YvnxtYmsvMqPYsT7pSPcLhm4AV3OyntXOS/8=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=HzsZ5IPXhiDsdt7lq5IW7ll/JK4rFkQQ6LfZH+rFB1m8zXXlX8+we3dPGba5PXAJ1
 di2HjB1XtCa57SjRhUEnb6KQOycJp2lUCj87nprWnYYq1gScJghxsXxRmhGRHloEXw
 LUKatv94SZ7GgVOY89iJDfv/3Ezm4klj5sg5txs4=
Date: Thu, 13 Feb 2020 17:37:02 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
In-Reply-To: <20200212230043.170477-4-lyude@redhat.com>
References: <20200212230043.170477-4-lyude@redhat.com>
Message-Id: <20200213173703.0D93121734@mail.kernel.org>
Subject: Re: [Nouveau] [PATCH 3/4] drm/nouveau/kms/nv50-: Move 8BPC limit
 for MST into nv50_mstc_get_modes()
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
    3261e013c0ca ("drm/amd/display: Add MST atomic routines")
    dc48529fb14e ("drm/dp_mst: Add PBN calculation for DSC modes")

v5.4.19: Failed to apply! Possible dependencies:
    14692a3637d4 ("drm/dp_mst: Add probe_lock")
    3261e013c0ca ("drm/amd/display: Add MST atomic routines")
    37dfdc55ffeb ("drm/dp_mst: Cleanup drm_dp_send_link_address() a bit")
    3f9b3f02dda5 ("drm/dp_mst: Protect drm_dp_mst_port members with locking")
    50094b5dcd32 ("drm/dp_mst: Destroy topology_mgr mutexes")
    5950f0b797fc ("drm/dp_mst: Move link address dumping into a function")
    60f9ae9d0d3d ("drm/dp_mst: Remove huge conditional in drm_dp_mst_handle_up_req()")
    7cb12d48314e ("drm/dp_mst: Destroy MSTBs asynchronously")
    9408cc94eb04 ("drm/dp_mst: Handle UP requests asynchronously")
    a29d881875fc ("drm/dp_mst: Refactor drm_dp_mst_handle_up_req()")
    c485e2c97dae ("drm/dp_mst: Refactor pdt setup/teardown, add more locking")
    caf81ec6cd72 ("drm: Destroy the correct mutex name in drm_dp_mst_topology_mgr_destroy")
    dc48529fb14e ("drm/dp_mst: Add PBN calculation for DSC modes")
    e2839ff692c6 ("drm/dp_mst: Rename drm_dp_add_port and drm_dp_update_port")

v4.19.103: Failed to apply! Possible dependencies:
    232c9eec417a ("drm/nouveau: Use atomic VCPI helpers for MST")
    310d35771ee9 ("drm/nouveau/kms/nv50-: Call outp_atomic_check_view() before handling PBN")
    39b50c603878 ("drm/atomic_helper: Stop modesets on unregistered connectors harder")
    412e85b60531 ("drm/nouveau: Only release VCPI slots on mode changes")
    706246c761dd ("drm/dp_mst: Refactor drm_dp_update_payload_part1()")
    72fdb40c1a4b ("drm: extract drm_atomic_uapi.c")
    7f4de521001f ("drm/atomic: Add __drm_atomic_helper_plane_reset")
    88ec89adec36 ("drm/nouveau: Move PBN and VCPI allocation into nv50_head_atom")
    a3d15c4b0ecd ("drm/dp_mst: Remove port validation in drm_dp_atomic_find_vcpi_slots()")
    a5ec8332d428 ("drm: Add per-plane pixel blend mode property")
    bea5c38f1eb6 ("drm/dp_mst: Add some atomic state iterator macros")
    d0757afd00d7 ("drm/dp_mst: Rename drm_dp_mst_get_validated_(port|mstb)_ref and friends")
    d86552efe10a ("drm/atomic: trim driver interface/docs")
    db1231ddc046 ("drm/nouveau: Only recalculate PBN/VCPI on mode/connector changes")
    ebcc0e6b5091 ("drm/dp_mst: Introduce new refcounting scheme for mstbs and ports")
    eceae1472467 ("drm/dp_mst: Start tracking per-port VCPI allocations")
    fc63668656bd ("drm/dp_mst: Remove bogus conditional in drm_dp_update_payload_part1()")

v4.14.170: Failed to apply! Possible dependencies:
    07bbc1c5f49b ("drm/nouveau/core/memory: split info pointers from accessor pointers")
    0b11b30de9d2 ("drm/nouveau/mmu/nv04-nv4x: move global vmm to nvkm_mmu")
    0f43715fac00 ("drm/nouveau/mmu/g84: fork from nv50")
    1590700d94ac ("drm/nouveau/kms/nv50-: split each resource type into their own source files")
    269fe32d3343 ("drm/nouveau/bar: swap oneinit/init ordering, and rename bar3 to bar2")
    30ed49b55b6e ("drm/nouveau/kms/nv50-: move code underneath dispnv50/")
    310d35771ee9 ("drm/nouveau/kms/nv50-: Call outp_atomic_check_view() before handling PBN")
    5b17f3624efa ("drm/nouveau/mmu/nv04: implement vmm on top of new base")
    5e075fdeb166 ("drm/nouveau/mmu: automatically handle "un-bootstrapping" of vmm")
    6359c982243e ("drm/nouveau/mmu/gp10b: fork from gf100")
    7f53d6dc9a72 ("drm/nouveau/core/memory: comptag allocation")
    806a73356537 ("drm/nouveau/mmu: implement base for new vm management")
    88ec89adec36 ("drm/nouveau: Move PBN and VCPI allocation into nv50_head_atom")
    997a89003c2d ("drm/nouveau/core/memory: add reference counting")
    b86a45877ead ("drm/nouveau/mmu/gp100: fork from gf100")
    c83c4097eba8 ("drm/nouveau/mmu: define user interfaces to mmu memory allocation")
    cedc4d57df26 ("drm/nouveau/mmu/gm20b: fork from gf100")
    d1f6c8d2e9df ("drm/nouveau/mmu/gk20a: fork from gf100")
    db018585a51a ("drm/nouveau/mmu/gk104: fork from gf100")
    db1231ddc046 ("drm/nouveau: Only recalculate PBN/VCPI on mode/connector changes")
    e1e33c791a23 ("drm/nouveau/mmu/gm200: fork from gf100")
    e69dae85c90b ("drm/nouveau/bar/nv50,g84: drop mmu invalidate")
    eaf1a69110f4 ("drm/nouveau/mmu: add base for type-based memory allocation")
    f5650478ab07 ("drm/nouveau/disp/nv50-: pass nvkm_memory objects for channel push buffers")

v4.9.213: Failed to apply! Possible dependencies:
    310d35771ee9 ("drm/nouveau/kms/nv50-: Call outp_atomic_check_view() before handling PBN")
    3dbd036b8419 ("drm/nouveau/kms/nv50: separate out mode commit")
    52aa30f2524d ("drm/nouveau/kms/nv50: switch mst sink back into sst mode")
    6bbab3b6b656 ("drm/nouveau/kms/nv50: separate out base/ovly channel usage bounds commit")
    7e91833dfb2d ("drm/nouveau/kms/nv50: separate out dither commit")
    839ca903f12e ("drm/nouveau/kms/nv50: transition to atomic interfaces internally")
    973f10c2d3ea ("drm/nouveau/kms/nv50: separate out base channel commit")
    ad6336195393 ("drm/nouveau/kms/nv50: separate out core surface commit")
    ea8ee39002a1 ("drm/nouveau/kms/nv50: separate out cursor surface commit")
    f479c0ba4a17 ("drm/nouveau/kms/nv50: initial support for DP 1.2 multi-stream")

v4.4.213: Failed to apply! Possible dependencies:
    13a3d91f17a5 ("drm: Pass 'name' to drm_encoder_init()")
    310d35771ee9 ("drm/nouveau/kms/nv50-: Call outp_atomic_check_view() before handling PBN")
    3dbd036b8419 ("drm/nouveau/kms/nv50: separate out mode commit")
    52aa30f2524d ("drm/nouveau/kms/nv50: switch mst sink back into sst mode")
    7568b1067181 ("drm/nouveau/nvif: split out display interface definitions")
    839ca903f12e ("drm/nouveau/kms/nv50: transition to atomic interfaces internally")
    973f10c2d3ea ("drm/nouveau/kms/nv50: separate out base channel commit")
    ad6336195393 ("drm/nouveau/kms/nv50: separate out core surface commit")
    b516a9efb7af ("drm: Move LEAVE/ENTER_ATOMIC_MODESET to fbdev helpers")
    f479c0ba4a17 ("drm/nouveau/kms/nv50: initial support for DP 1.2 multi-stream")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
