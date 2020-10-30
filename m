Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D029FB65
	for <lists+nouveau@lfdr.de>; Fri, 30 Oct 2020 03:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B8D6E935;
	Fri, 30 Oct 2020 02:37:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63C96E935
 for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2020 02:36:59 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f9b7c4d0000>; Thu, 29 Oct 2020 19:37:01 -0700
Received: from localhost (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Oct
 2020 02:36:57 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <nouveau@lists.freedesktop.org>
Date: Fri, 30 Oct 2020 13:36:40 +1100
Message-ID: <20201030023645.10114-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604025421; bh=3IGy0F2oiI0HJPDydZI5rZ2cMu1lwaCPrHO7WDEV8hw=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
 X-ClientProxiedBy;
 b=ZNZ+b1jeioz9b/WbjUwZPe25st94csn055qa4rhBuVc2Q1zkn76Ho302Kc+FWyV7J
 YFj9Cw+YUOk0VWEQ6RtdGdQrRChnZzTtFnB5cZGZWDc6o2a7Iv0BW6aZHrqRuYfiMM
 1sFcrDZdngVWm/juJ4j+6zEggkk5Q7RZnNvAOQJi8DVhh6y75OOcHCxin1NGZegTXe
 A3C9GtZpz+YGAAcO+SXDdr+El0co+8kgiruGonuakiygkViM+8qzUHHTuguXP+1Tun
 iaTPfXMUh3h268EMDbLXdwVhpptN9k2Q2/EFuTAg4ZIBYNzPS+LpSfsRVzOZdEtGVK
 sBXHMMnK6p0yw==
Subject: [Nouveau] [PATCH 0/5] Improve Robust Channel (RC) recovery for
 Turing
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
Cc: Alistair Popple <apopple@nvidia.com>, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is an initial series of patches to improve channel recovery on Turing GPUs
with the goal of improving reliability enough to eventually enable SVM for
Turing. It's likely follow up patches will be required to fully address problems
with less trivial workloads than what I have been able to test thus far.

This series primarily addresses a number of hardware changes to interrupt layout
and channel recovery for Turing and for simple cases improves handling and
reliability of recovery.

I have been testing trivial OpenCL workloads and with this series have been able
to recover from while(1) style GPU loops and bad pointer dereferences on a
Turing GPU. However if there are less trivial tests available that have been
known to cause problems with channel recovery in the past let me know and I'll
start testing those as well.

Alistair Popple (5):
  drm/nouveau: Fix MMU fault interrupts on Turing
  drm/nouveau: Remove Turing interrupt hack
  drm/nouveau: Move Turing specific FIFO functions
  drm/nouveau: FIFO interrupt fixes for Turing
  drm/nouveau: Turing channel preemption fix

 .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  |  46 +--
 .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.h  |  32 ++
 .../gpu/drm/nouveau/nvkm/engine/fifo/tu102.c  | 364 +++++++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/fault/tu102.c |  21 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c |   3 -
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/priv.h |   1 -
 .../gpu/drm/nouveau/nvkm/subdev/mc/tu102.c    | 113 +++++-
 7 files changed, 529 insertions(+), 51 deletions(-)

-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
