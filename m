Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382CC121FEE
	for <lists+nouveau@lfdr.de>; Tue, 17 Dec 2019 01:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5723C6E8FA;
	Tue, 17 Dec 2019 00:44:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14F06E8FA;
 Tue, 17 Dec 2019 00:44:49 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df824f80000>; Mon, 16 Dec 2019 16:44:40 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 16:44:49 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 16 Dec 2019 16:44:49 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 00:44:48 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 17 Dec 2019 00:44:48 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.42.105]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df825000000>; Mon, 16 Dec 2019 16:44:48 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 16 Dec 2019 16:45:17 -0800
Message-ID: <20191217004520.2404-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576543480; bh=RjdyggDrwYmuRHmh1WYBF92vncApEVLXB3y4eFYsaPM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=auf0Kj5LX7DhQDxHGVf4kYsRPPBM0rzPQmCYAaUTQly9Y4VqE+uYtyayKBzACUCvf
 OQbdGrm41SFvnMD0WTK04F6u5Cn+U5XZhtj5zRWYy3+mObTd2tAbAEHRbp9AyJmikE
 QTFVBHl8QV/2qAQSkWxHqAwaqxnMgTVLqAre5M5Z+A9wW1JWNLRVhWgDcCxvRgg4tm
 lYulkXMApyXeBtXC3Q4ktVZCtAX+N+abaXhzlp3dA77KgI9nLhpg0sNmkFm4LEeJyD
 awHq7pz/o5SP+XkPXpVrk+DQ50mNAzzLCpFLtTKaSIjSfTHxq/YiYhDMnyByJK7clG
 WhJvhJLXylGTg==
Subject: [Nouveau] [PATCH v2 0/3] drm/nouveau: Support NVIDIA format
 modifiers
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This series modifies the NV5x+ nouveau display backends to advertise
appropriate format modifiers on their display planes in atomic mode
setting blobs.

Corresponding modifications to Mesa/userspace are available here:

https://gitlab.freedesktop.org/cubanismo/mesa/tree/nouveau_work

But those need a bit of cleanup before they're ready to submit.

I've tested this on Tesla, Kepler, Pascal, and Turing-class hardware
using various formats and all the exposed format modifiers, plus some
negative testing with invalid ones.

NOTE: this series depends on the "[PATCH v3] drm: Generalized NV Block
Linear DRM format mod" patch submitted to dri-devel.

v2: Used Tesla family instead of NV50 chipset compare to avoid treating
    oddly numbered NV4x-class chipsets as NV50+ GPUs.  Other instances
    of compares with chipset number in the series were audited, deemed
    safe, and left as-is for consistency with existing code.

James Jones (3):
  drm/nouveau: Add format mod prop to base/ovly/nvdisp
  drm/nouveau: Check framebuffer size against bo
  drm/nouveau: Support NVIDIA format modifiers

 drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  59 ++++++++
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |   4 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  35 ++++-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  17 +++
 drivers/gpu/drm/nouveau/nouveau_display.c   | 154 ++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_display.h   |   4 +
 7 files changed, 272 insertions(+), 8 deletions(-)

-- 
2.17.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
